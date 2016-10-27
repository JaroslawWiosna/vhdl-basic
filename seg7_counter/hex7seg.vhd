--     project: seg7_count99
--        file: hex7seg.vhd
--      author: Micha³ Kielan
--        data: 07/06/2014 
-- description: biblioteka znaków w hexie
--------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex7seg is port ( 
	     tetr_in : in  std_logic_vector (3 downto 0);
           seg7 : out std_logic_vector (6 downto 0));
end hex7seg;

architecture Behavioral of hex7seg is

begin

	process(tetr_in)
	begin 	
		case tetr_in is
				when x"0" => seg7 <= "1000000"; --0
				when x"1" => seg7 <= "1111001"; --1 
				when x"2" => seg7 <= "0100100"; --2 
				when x"3" => seg7 <= "0110000"; --3
				when x"4" => seg7 <= "0011001"; --4
				when x"5" => seg7 <= "0010010"; --5
				when x"6" => seg7 <= "0000010"; --6
				when x"7" => seg7 <= "1111000"; --7
				when x"8" => seg7 <= "0000000"; --8
				when x"9" => seg7 <= "0010000"; --9
			   when x"A" => seg7 <= "0001000"; --A
			   when x"B" => seg7 <= "0000000"; --B
				when x"C" => seg7 <= "1000110"; --C
				when x"D" => seg7 <= "1000000"; --D
				when x"E" => seg7 <= "0000110"; --E
				when x"F" => seg7 <= "0001110"; --F
		    when others => seg7 <= "0000110"; --err
		end case;
	end process;
				
end Behavioral;

