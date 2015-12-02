----------------------------------------------------------------------------
-- Entity:        Debouncer
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   debounces an input from a buton
--
-- Revision History (date, initials, description): 9/16/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;

entity Debouncer is
	port( D 		: in   STD_LOGIC;
			CLK	: in STD_LOGIC;
			Pulse	: in STD_LOGIC;
         Q	 	: out  STD_LOGIC);

end Debouncer;

architecture Behavioral of Debouncer is

signal q_int1 : STD_LOGIC;
signal q_int2 : STD_LOGIC;
signal q_int3 : STD_LOGIC;

begin

Flip1: DFF_CE port map (
	D => D,
	CE => Pulse,
	CLK => CLK,
	Q => q_int1);
	
Flip2: DFF_CE port map (
	D => q_int1,
	CE => Pulse,
	CLK => CLK,
	Q => q_int2);
	
Flip3: DFF_CE port map (
	D => q_int2,
	CE => Pulse,
	CLK => CLK,
	Q => q_int3);

Q <= q_int2 and q_int3;

end Behavioral;

