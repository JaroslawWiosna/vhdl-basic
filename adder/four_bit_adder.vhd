----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Przemes
-- 
-- Create Date: 07.11.2016
-- Design Name: 
-- Module Name: four_bit_adder - Behavioral
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

entity four_bit_adder is
	port(
		a : in std_logic_vector (3 downto 0);
		b : in std_logic_vector (3 downto 0);
		cin : in std_logic_vector (3 downto 0);
		sum : out std_logic_vector (3 downto 0);
		carry : out std_logic_vector (3 downto 0)
		);
end four_bit_adder;

architecture Behavioral of four_bit_adder is

component fulladder
    port(
		a : in std_logic;
        b : in std_logic;
        cin : in std_logic;
        sum : out std_logic;
        carry : out std_logic
        );
end component;

signal s_carry : std_logic_vector (3 downto 0);

begin

FBA1: fulladder port map(
						a => a(0),
						b => b(0),
						cin => cin(0),	-- Formally here cin should be always equal to '0'
						sum => sum(0),
						carry => s_carry(0)
						);

FBA2: fulladder port map(
						a => a(1),
						b => b(1),
						cin => s_carry(0),	-- carry from previous FA as an cin input
						sum => sum(1),
						carry => s_carry(1)
						);
						
FBA3: fulladder port map(
						a => a(2),
						b => b(2),
						cin => s_carry(1),	-- carry from previous FA as an cin input
						sum => sum(2),
						carry => s_carry(2)
						);

FBA4: fulladder port map(
						a => a(3),
						b => b(3),
						cin => s_carry(2),	-- carry from previous FA as an cin input
						sum => sum(3),
						carry => s_carry(3)
						);

carry <= s_carry;	-- only carry(3) is vital other for test purpose

end Behavioral