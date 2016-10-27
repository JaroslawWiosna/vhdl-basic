--     project: seg7_count99
--        file: mult7seg.vhd
--      author: Micha³ Kielan
--        data: 07/06/2014 
-- description: multipleksacja wyœwietlacza 7 seg
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_Arith.all;

entity mult7seg is port ( 
        res : in  std_logic;
	clk_show : in  std_logic;   			  
   seg7_out : out std_logic_vector(3 downto 0);
         an : out std_logic_vector(3 downto 0);	
    bcd_num : in  std_logic_vector(15 downto 0);
         dp : out std_logic
);
end mult7seg;

architecture Behavioral of mult7seg is
signal count 			: std_logic_vector(1 downto 0);
signal seg7_sig 		: std_logic_vector(3 downto 0);
constant ActiveReset : std_logic:='1';
constant DotOff      : std_logic:='1';
constant DotOn 		: std_logic:='0';
constant an1_on		: std_logic_vector:="0111";
constant an2_on		: std_logic_vector:="1011";
constant an3_on		: std_logic_vector:="1101";
constant an4_on		: std_logic_vector:="1110";
constant an_off		: std_logic_vector:="1111";

begin

showBCD: process(clk_show, res)
begin
	if res = ActiveReset then
		count <= (others => '0');		

	elsif clk_show'event and clk_show = '1' then 
		
		count <= count + 1;
			case count is 
			  when "00" => an <= an1_on; seg7_out <= bcd_num(15 downto 12); dp <= DotOff;
			  when "01" => an <= an2_on; seg7_out <= bcd_num(11 downto  8); dp <= DotOff;
			  when "10" => an <= an3_on; seg7_out <= bcd_num(7  downto  4); dp <= DotOff;
			when others => an <= an4_on; seg7_out <= bcd_num(3  downto  0); dp <= DotOff;				
		end case;				
	end if;
end process;


end Behavioral;

