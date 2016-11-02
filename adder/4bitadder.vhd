----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:41 10/18/2016 
-- Design Name: 
-- Module Name:    adders - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity adder4 is
    port (a : in unsigned(3 downto 0);
          b : in unsigned(3 downto 0);
          sum : out unsigned(3 downto 0);
          carry : out std_logic
         );
end adder4;

architecture Behavioral of adder4 is

signal sum_carry : out unsigned(4 downto 0); -- 4 due to carry bit 

begin

  sum_carry <=("0" & a) + b;
  sum <= sum_carry(3 downto 0);
  carry <= sum_carry(4);

end Behavioral
