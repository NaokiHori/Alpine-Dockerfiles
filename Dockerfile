## build stage
FROM alpine:3.16.0 AS build
# working directory for build
WORKDIR /usr/local/src
# install wget and grab / extract tarball
RUN apk add --no-cache wget
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xzf ./install-tl-unx.tar.gz --strip-components=1
# install perl and run install-tl
RUN apk add --no-cache perl
COPY ./texlive.profile ./
RUN ./install-tl --profile=texlive.profile
# install other libraries
WORKDIR /usr/local/bin/x86_64-linuxmusl
RUN ./tlmgr install extsizes epstopdf

## main stage
FROM alpine:3.16.0
# perl and ghostscript for epstopdf
RUN apk add --no-cache perl ghostscript
# bring binaries from build stage
COPY --from=build /usr/local/bin /usr/local/bin
COPY --from=build /usr/local/texmf-config /usr/local/texmf-config
COPY --from=build /usr/local/texmf-dist /usr/local/texmf-dist
COPY --from=build /usr/local/texmf-local /usr/local/texmf-local
COPY --from=build /usr/local/texmf-var /usr/local/texmf-var
COPY --from=build /usr/local/tlpkg /usr/local/tlpkg
# path to binaries
ENV PATH /usr/local/bin/x86_64-linuxmusl:$PATH
