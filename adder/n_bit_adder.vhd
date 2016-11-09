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

entity n_bit_adder is
    generic(
        n : integer := 4	-- this variable define how big value adder can add
        );
	port(
		a : in std_logic_vector (n-1 downto 0);
		b : in std_logic_vector (n-1 downto 0);
		cin : in std_logic_vector (n-1 downto 0);
		sum : out std_logic_vector (n-1 downto 0);
		carry : out std_logic_vector (n-1 downto 0)
		);
end n_bit_adder;

architecture Behavioral of n_bit_adder is

component fulladder
    port(
		a : in std_logic;
        b : in std_logic;
        cin : in std_logic;
        sum : out std_logic;
        carry : out std_logic
        );
end component;

signal s_carry : std_logic_vector (n downto 0);
signal s_cin : std_ulogic := '0';

begin

FBA: for i in 0 to n-1 generate
	FBA_i: fulladder port map(
						a => a(i),
						b => b(i),
						cin => s_carry(i),
						sum => sum(i),
						carry => s_carry(i+1)
						);
end generate FBA;

carry <= (others => '0');
carry(0) <= s_carry(n);	-- only carry(3) is vital other for test purpose

end Behavioral;