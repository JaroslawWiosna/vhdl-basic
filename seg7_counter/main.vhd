--     project: seg7_count99
--        file: main.vhd
--      author: Micha³ Kielan
--        data: 07/06/2014 
-- description: plik g³ówny
----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_Arith.all;

entity main is port ( 
			  res : in  std_logic;
			  clk : in  std_logic;	
        switch : in  std_logic; 
	 StopButton : in  std_logic;
      seg7_out : out std_logic_vector(6 downto 0);
            an : out std_logic_vector(3 downto 0);		  
            dp : out std_logic);
end main;

architecture Behavioral of main is
signal clkSig7seg  : std_logic;
signal clkSigCount : std_logic;
signal seg7_sig 	 : std_logic_vector(3 downto 0);
signal bcd_num		 : std_logic_vector(15 downto 0);

component hex7seg is port(
	tetr_in : in  std_logic_vector(3 downto 0);
		seg7 : out std_logic_vector(6 downto 0)
);
end component;

component divider is port(
	 clk_in : in  std_logic;
	    res : in  std_logic;
	 clk_mult: out std_logic;
		clk_count : out std_logic
);
end component;

component countBCD is port(
  clk_licznik : in  std_logic;
		    res : in  std_logic;
	StopButton : in  std_logic;
      bcd_out : out std_logic_vector(15 downto 0);
	    switch : in  std_logic
);
end component;


component mult7seg is port(
	    res : in  std_logic;
  clk_show : in  std_logic;	        		  
  seg7_out : out std_logic_vector(3 downto 0);
        an : out std_logic_vector(3 downto 0);		  
        dp : out std_logic;
   bcd_num : in  std_logic_vector(15 downto 0)
);
end component;

begin
D_div: divider port map(	 
	    res => res,
    clk_in => clk,
  clk_mult => clkSig7seg,
 clk_count => clkSigCount
);

D_bcd: countBCD port map(
			   res => res,
    clk_licznik => clkSigCount,
        bcd_out => bcd_num,
	  StopButton => StopButton,
		   switch => switch
);

D_hex: hex7seg port map(
	 tetr_in => seg7_sig, 
		 seg7 => seg7_out
);

D_mul: mult7seg port map(
	      res => res,
	 clk_show => clkSig7seg, 			  
    seg7_out => seg7_sig,
	  bcd_num => bcd_num,
          an => an,	  
          dp => dp
);

end Behavioral;

