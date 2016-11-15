----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Przemes & Jaroslaw
-- 
-- Create Date: 15.11.2016 14:03:20
-- Design Name: 
-- Module Name: multiplier - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    port(
		a : in std_logic_vector (3 downto 0);
		b : in std_logic_vector (3 downto 0);
		mult : out std_logic_vector (7 downto 0)
		);
end multiplier;

architecture Behavioral of multiplier is

component fulladder
    port(
		a : in std_logic;
        b : in std_logic;
        cin : in std_logic;
        sum : out std_logic;
        carry : out std_logic
        );
end component;

component halfadd
    port(
         a : in std_logic;
         b : in std_logic;
         sum : out std_logic;
         carry : out std_logic
        );
end component;

signal s_carry : std_logic_vector (11 downto 0);
signal s_cin : std_logic_vector (7 downto 0);
signal s_sum : std_logic_vector (11 downto 0);

begin

M1: halfadd port map(
						a => a(0) and b(1),
						b => a(1) and b(0),
						sum => s_sum(0),
						carry => s_carry(0)
						);
					
M2: halfadd port map(
                        a => a(1) and b(1),
                        b => a(2) and b(0),
                        sum => s_sum(1),
                        carry => s_carry(1)
                        );

M3: fulladder port map(
                       a => s_sum(1),
                       b => a(0) and b(2),
                       cin => s_carry(0),
                       sum => s_sum(2),
                       carry => s_carry(2)
                       );                         

M4: halfadd port map(
                        a => a(2) and b(1),
                        b => a(3) and b(0),
                        sum => s_sum(3),
                        carry => s_carry(3)
                        );
                        
M5: fulladder port map(
                       a => s_sum(3),
                       b => a(1) and b(2),
                       cin => s_carry(1),
                       sum => s_sum(4),
                       carry => s_carry(4)
                       );
                       
M7: fulladder port map(
                      a => s_sum(4),
                      b => a(0) and b(3),
                      cin => s_carry(2),
                      sum => s_sum(5),
                      carry => s_carry(5)
                      );  
                                                               
M6: fulladder port map(
                      a => a(3) and b(1),
                      b => a(2) and b(2),
                      cin => s_carry(3),
                      sum => s_sum(6),
                      carry => s_carry(6)
                      );

M8: fulladder port map(
                        a => s_sum(6),
                        b => a(1) and b(3),
                        cin => s_carry(4),
                        sum => s_sum(7),
                        carry => s_carry(7)
                        );

M10: halfadd port map(
						a => s_sum(7),
						b => s_carry(5),
						sum => s_sum(8),
						carry => s_carry(8)
						);

M9: fulladder port map(
                        a => a(3) and b(2),
                        b => a(2) and b(3),
                        cin => s_carry(6),
                        sum => s_sum(9),
                        carry => s_carry(9)
                        );

M11: fulladder port map(
                        a => s_sum(9),
                        b => s_carry(7),
                        cin => s_carry(8),
                        sum => s_sum(10),
                        carry => s_carry(10)
                        );
                        
M12: fulladder port map(
                        a => a(3) and b(3),
                        b => s_carry(6),
                        cin => s_carry(9),
                        sum => s_sum(11),
                        carry => s_carry(11)
                        );
                                                



mult(0) <= a(0) and b(0);
mult(1) <= s_sum(0);
mult(2) <= s_sum(2);
mult(3) <= s_sum(5);
mult(4) <= s_sum(8);
mult(5) <= s_sum(10);
mult(6) <= s_sum(11);
mult(7) <= s_carry(11);



end Behavioral