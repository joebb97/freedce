FROM debian:11

RUN apt-get update
RUN apt-get install -y build-essential autoconf libtool bison flex uuid-dev procps tcpdump

COPY . /freedce
WORKDIR /freedce/dcethreads

RUN ./buildconf
RUN ./configure
RUN make
RUN make install

WORKDIR /freedce/freedce
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

# Libraries have been installed in:
#    /opt/dce/lib

# If you ever happen to want to link against installed libraries
# in a given directory, LIBDIR, you must either use libtool, and
# specify the full pathname of the library, or use the '-LLIBDIR'
# flag during linking and do at least one of the following:
#    - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
#      during execution
#    - add LIBDIR to the 'LD_RUN_PATH' environment variable
#      during linking
#    - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
#    - have your system administrator add LIBDIR to '/etc/ld.so.conf'
