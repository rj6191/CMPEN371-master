----------------------------------------------------------------------------
-- Entity:        One Shot
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   looks for a rising clock edge to help stabilize an input
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


entity OneShot is
	port( D 		: in   STD_LOGIC;
			CLK	: in STD_LOGIC;
         Q	 	: out  STD_LOGIC);
end OneShot;

architecture Behavioral of OneShot is

signal q_int : STD_LOGIC;

begin

Flip: DFF port map (
	D => D,
	CLK => CLK,
	Q =>q_int);

Q <= (not q_int) and D;


end Behavioral;

