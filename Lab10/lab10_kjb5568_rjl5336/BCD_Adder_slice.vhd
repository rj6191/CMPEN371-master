----------------------------------------------------------------------------
-- Entity:        BCD adder slice
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  11/7/2015
-- Description:   one digit bcd adder
--
-- Revision History (date, initials, description): 11/7/2015, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5366_library
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;

entity BCD_Adder_slice is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           sub : in  STD_LOGIC;
           cbi : in  STD_LOGIC;
           cbo : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end BCD_Adder_slice;

architecture Behavioral of BCD_Adder_slice is

signal sum_int : std_logic_vector (3 downto 0);
signal sum_correction : std_logic_vector (3 downto 0);
signal bxor : std_logic_vector (3 downto 0);
signal c_out : std_logic;
signal cbo_int : std_logic;
signal c_in_int : std_logic;
signal greater : std_logic;
signal correction_num : std_logic_vector (3 downto 0);
signal a_int : std_logic_vector (4 downto 0);


begin

bxor(0) <= b(0) xor sub;
bxor(1) <= b(1) xor sub;
bxor(2) <= b(2) xor sub;
bxor(3) <= b(3) xor sub;

correction_num <= "0110" when sub = '0' else
						"1010" when sub = '1' else 
						"0000";
cbo_int <= (c_out xor sub) when sub ='1' else
			  greater when sub = '0' else
			  '0';
			  
c_in_int <=cbi xor sub;
main_adder: Ripple_Carry_Adder generic map (4) port map (
	a=> a,
	b=> bxor, 
	c_in => c_in_int,
	c_out => c_out,
	sum =>  sum_int  );

correction_adder: Ripple_Carry_Adder generic map (4) port map (
	a=> sum_int,
	b=> correction_num, 
	c_in => '0',
	c_out => open,
	sum =>  sum_correction  );

a_int <= c_out & sum_int;	
greater_9 : CompareGRT generic map (5) port map (
	a => a_int,
	b => "01001",
	output => greater );

sum <= sum_int when cbo_int = '0' else 
		sum_correction when cbo_int ='1' else 
		"0000";

cbo <= cbo_int;
end Behavioral;

