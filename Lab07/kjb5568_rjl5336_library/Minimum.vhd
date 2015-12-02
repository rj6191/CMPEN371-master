----------------------------------------------------------------------------
-- Entity:        Minimum
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   compute the minimum of 4 numbers
--
-- Revision History (date, initials, description): 9/10/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_components.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;


entity minimum is
	port ( SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0); -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			 MIN			: out	STD_LOGIC_VECTOR(3 downto 0));
end minimum;

architecture Structural of minimum is
signal LST2_out  : STD_LOGIC_VECTOR (3 downto 0);
signal LST1_out  : STD_LOGIC_VECTOR (3 downto 0);
signal LST0_out  : STD_LOGIC_VECTOR (3 downto 0);
signal LST_out   : STD_LOGIC_VECTOR (3 downto 0);
signal LST_SEL   : STD_LOGIC_VECTOR (2 downto 0);

begin

LST2: LST generic map (4) port map (
	A		=>SWITCH (15 downto 12),
	B		=>SWITCH (11 downto 8),
	OUTPUT=>LST_SEL(2)
	);
LST1: LST generic map (4) port map (
	A		=>LST2_out,
	B		=>SWITCH(7 downto 4),
	OUTPUT=>LST_SEL(1)
	);
LST0: LST generic map (4) port map (
	A		=>LST1_out,
	B		=>SWITCH(3 downto 0),
	OUTPUT=>LST_SEL(0)
	);

LST2_out <=SWITCH (15 downto 12) when (LST_SEL(2) = '1') else
			  SWITCH (11 downto 8) when (LST_SEL(2) = '0') else
			  SWITCH (15 downto 12);

LST1_out <=LST2_out when (LST_SEL(1) = '1') else
			  SWITCH(7 downto 4) when (LST_SEL(1) = '0') else
			  LST2_out;
			  
LST0_out <=LST1_out when (LST_SEL(0) = '1') else
			  SWITCH(3 downto 0) when (LST_SEL(0) = '0') else
			  LST1_out;
			  
MIN <= LST0_out;



end Structural;

