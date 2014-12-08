rm -rf ~/.cgminer
sudo apt-get install libcurl4-openssl-dev libncurses5-dev pkg-config libtool yasm
autogen automake
wget https://github.com/ckolivas/cgminer/tarball/v2.11.4
mkdir cgminer
tar zxvf v2.11.4 --directory cgminer
cd cgminer/ckolivas-cgminer-96c8ff5
./autogen.sh --disable-opencl --disable-adl --enable-cpumining
CFLAGS="-O2 -Wall -march=native" ./configure --disable-opencl --disable-adl --enable-cpumining
make -j16
sudo make install
./cgminer -o stratum+tcp://stratum.mining.eligius.st:3334 -u 16GgJNQDHxx2NpjSxgrAAndnSEjBR4uBTt -p x --cpu-threads 1 --text-only --api-listen --real-quiet &
cd ../..
