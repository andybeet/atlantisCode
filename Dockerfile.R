FROM ubuntu:18.04

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -yq build-essential autoconf libnetcdf-dev libxml2-dev libproj-dev subversion valgrind dos2unix gawk nano r-base

COPY atlantisCode/v6681_debug/atlantis /app/atlantis
COPY atlantisCode/v6681_debug/svn /app/.svn
#COPY CDFDistiller/v6490 /CDFDistiller

# compile Atlantis
RUN cd /app/atlantis && aclocal && autoheader && autoconf && automake -a && ./configure --enable-rassesslink && make && make install

# compile cdf distiller
#ENV PKG_CONFIG_PATH=/app/model
#RUN cd /CDFDistiller && aclocal && autoheader && autoconf && automake -a && ./configure && make && make install

WORKDIR /app/model

ENTRYPOINT ["sh"]

CMD ["RunAtlantis.sh"]
