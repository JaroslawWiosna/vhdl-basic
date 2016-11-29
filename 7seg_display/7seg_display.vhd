----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 22.11.2016 13:46:26
-- Design Name:
-- Module Name: 7seg - Behavioral
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
 
entity seg7 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (6 downto 0));
end seg7;
 
architecture Behavioral of seg7 is
 
 
constant v0     : std_logic_vector (6 downto 0) := "1000000";
constant v1     : std_logic_vector (6 downto 0) := "1111001";
constant v2     : std_logic_vector (6 downto 0) := "0100100";
constant v3     : std_logic_vector (6 downto 0) := "0110000";
constant v4     : std_logic_vector (6 downto 0) := "0011001";
constant v5     : std_logic_vector (6 downto 0) := "0010010";
constant v6     : std_logic_vector (6 downto 0) := "0000010";
constant v7     : std_logic_vector (6 downto 0) := "1111000";
constant v8     : std_logic_vector (6 downto 0) := "0000000";
constant v9     : std_logic_vector (6 downto 0) := "0010000";
constant va     : std_logic_vector (6 downto 0) := "0001000";
constant vb     : std_logic_vector (6 downto 0) := "0000011";
constant vc     : std_logic_vector (6 downto 0) := "0100111";
constant vd     : std_logic_vector (6 downto 0) := "0100001";
constant ve     : std_logic_vector (6 downto 0) := "0000110";
constant vf     : std_logic_vector (6 downto 0) := "0001110";
 
 
begin
 
process (a)
begin
    case a is
        when "0000" => led <= v0;
        when "0001" => led <= v1;
        when "0010" => led <= v2;
        when "0011" => led <= v3;
        when "0100" => led <= v4;
        when "0101" => led <= v5;
        when "0110" => led <= v6;
        when "0111" => led <= v7;
        when "1000" => led <= v8;
        when "1001" => led <= v9;
        when "1010" => led <= va;
        when "1011" => led <= vb;
        when "1100" => led <= vc;
        when "1101" => led <= vd;
        when "1110" => led <= ve;
        when "1111" => led <= vf;
        when others => led <= v8;
    end case;
end process;
 
end Behavioral;