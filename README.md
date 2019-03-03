# Dockerfile

Toolchain for SH7262

HJ-LINK/USB Debugger for SH7262 can load an ELF program which built with this toolchain

ex.
<pre>
docker build -t toolchain:gcc-3.4.5_binutils-2.16.1._sh-elf -f Dockerfile.toolchain_gcc-3.4.5_binutils-2.16.1_sh-elf --no-cache=true .
Extract LCDsample.zip
docker run --rm -it -v D:\Downloads:/Downloads toolchain:gcc-3.4.5_binutils-2.16.1._sh-elf
cd /Downloads/LCDsample2/LCDsample/LCDtest1
make clean
make
File -> Download program -> Select an ELF program
</pre>
