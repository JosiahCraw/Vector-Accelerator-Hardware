FROM ghdl/ghdl:fedora32-gcc-9.2.0

WORKDIR /code

COPY . .

RUN cd tests && make all
