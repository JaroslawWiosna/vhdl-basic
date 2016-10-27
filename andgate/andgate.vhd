entity andgate is
    port(ina, inb : in bit; op : out bit);
end entity andgate;
 
architecture behavioral of andgate is
begin
    op <= ina and inb;
end architecture;
 
use work.all;
 
entity testbench is
end entity testbench;
 
architecture dataflow of testbench is
    signal inpone, inptwo, outp : bit;
begin
    portmaps : entity andgate port map(inpone, inptwo, outp);
    testprocess: process is
    begin
        inpone <= '0';
        inptwo <= '0';
        wait for 10 ns;
        inpone <= '0';
        inptwo <= '1';
        wait for 10 ns;
        inpone <= '1';
        inptwo <= '0';
        wait for 10 ns;
        inpone <= '1';
        inptwo <= '1';
        wait for 10 ns;
    end process testprocess;
end architecture dataflow;