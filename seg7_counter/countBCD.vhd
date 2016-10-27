--     project: seg7_count99
--        file: countBCD.vhd
--      author: Micha³ Kielan
--        data: 07/06/2014 
-- description: licznik w kodzie BCD
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_Arith.ALL;

entity countBCD is port( 
			  clk_licznik : in  std_logic;
			          res : in  std_logic;
					 switch : in  std_logic;
			   StopButton : in  std_logic;
               bcd_out : out std_logic_vector(15 downto 0));
end countBCD;

architecture Behavioral of countBCD is
signal j        		: std_logic_vector(3 downto 0):=X"9";
signal d        		: std_logic_vector(3 downto 0):=X"9";
signal s			  		: std_logic_vector(3 downto 0):=X"9";
signal t			  		: std_logic_vector(3 downto 0):=X"4";
signal num       		: std_logic_vector(15 downto 0);
constant max 			: std_logic_vector:=X"9";
constant min 			: std_logic_vector:=X"0";
constant CountUp     : std_logic:='1';
constant CountDown   : std_logic:='0';
constant StopOn		: std_logic:='1';
constant ResetActive : std_logic:='1';

begin

process(clk_licznik,res)
begin	
	if res = ResetActive then
		j <= (others => '0');
		d <= (others => '0');
		s <= (others => '0');
		t <= (others => '0');
	 num <= (others => '0');

	elsif clk_licznik'event and clk_licznik = '1' then
		
		if StopButton = StopOn then
			num <=num;
		else
		
		if switch = CountUp then 		j <= j + 1;		
		if j >= max then j <= X"0";	d <= d + 1;							
		if d >= max then d <= X"0";	s <= s + 1;
		if s >= max then s <= X"0";	t <= t + 1;
		if t >= max then t <= X"0";
		end if;
		end if;
		end if;
		end if;
						
		elsif switch = CountDown then	j <= j - 1;	
		if j = min then j <= X"9";		d <= d - 1;							
		if d = min then d <= X"9";		s <= s - 1;
		if s = min then s <= X"9";		t <= t - 1;
		if t = min then t <= X"9";
		end if;
		end if;
		end if;
		end if;	
		
	   end if; --end if od switch buttona		
		end if; --end if od stop buttona
	   end if; --end if od clocka
	 
	num <= (t & X"000") or (X"0" & s & X"00") or (X"00" & d & X"0") or (X"000" & j );
	
end process;

bcd_out <= num;

end Behavioral;

