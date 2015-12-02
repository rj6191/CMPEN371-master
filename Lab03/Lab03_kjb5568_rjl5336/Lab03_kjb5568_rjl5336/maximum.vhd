----------------------------------------------------------------------------
-- Entity:        maximum value block
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   finds max value for 4, 4 bit numbers
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


entity maximum is
	port ( SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0); -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			 MAX			: out	STD_LOGIC_VECTOR(3 downto 0));
end maximum;

architecture Behavioral of maximum is
signal GT2_out  : STD_LOGIC_VECTOR (3 downto 0);
signal GT1_out  : STD_LOGIC_VECTOR (3 downto 0);
signal GT0_out  : STD_LOGIC_VECTOR (3 downto 0);
signal GT_out  : STD_LOGIC_VECTOR (3 downto 0);
signal GT_SEL  : STD_LOGIC_VECTOR (2 downto 0);

begin

GRT2: CompareGRT generic map (4) port map (
	A=>SWITCH (15 downto 12),
	B=>SWITCH (11 downto 8),
	OUTPUT=>GT_SEL(2)
	);
GRT1: CompareGRT generic map (4) port map (
	A=>GT2_OUT,
	B=>SWITCH(7 downto 4),
	OUTPUT=>GT_SEL(1)
	);
GRT0: CompareGRT generic map (4) port map (
	A=>GT1_OUT,
	B=>SWITCH(3 downto 0),
	OUTPUT=>GT_SEL(0)
	);

GT2_out <= SWITCH (15 downto 12) when (GT_SEL(2) = '1') else
			  SWITCH (11 downto 8) when (GT_SEL(2) = '0') else
			  SWITCH (15 downto 12);

GT1_out <= GT2_out when (GT_SEL(2) = '1') else
			  SWITCH(7 downto 4) when (GT_SEL(2) = '0') else
			  GT2_out;
			  
GT0_out <= GT1_OUT when (GT_SEL(2) = '1') else
			  SWITCH(3 downto 0) when (GT_SEL(2) = '0') else
			  GT1_OUT;
			  
MAX <= GT0_out;



end Behavioral;

