Based on tutorial from 
https://neerajadh.wordpress.com/2015/09/15/vhdl-simulation-using-freehdl-in-linux/

sudo apt-get install freehdl gtkwave libtool-bin
gvhdl andgate.vhdl
./andgate
> d
> r 100 ns
> d
> q
gtkwave wave.dmp
