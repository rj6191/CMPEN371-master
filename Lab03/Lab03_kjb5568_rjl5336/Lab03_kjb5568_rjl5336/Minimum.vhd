----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:52:03 09/13/2015 
-- Design Name: 
-- Module Name:    Minimum - Behavioral 
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
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;


entity minimum is
	port ( SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0); -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			 MIN			: out	STD_LOGIC_VECTOR(3 downto 0));
end minimum;

architecture Behavioral of minimum is
signal LST2_out  : STD_LOGIC_VECTOR (3 downto 0);
signal LST1_out  : STD_LOGIC_VECTOR (3 downto 0);
signal LST0_out  : STD_LOGIC_VECTOR (3 downto 0);
signal LST_out  : STD_LOGIC_VECTOR (3 downto 0);
signal LST_SEL  : STD_LOGIC_VECTOR (2 downto 0);

begin

GRT2: CompareGRT generic map (4) port map (
	A=>SWITCH (15 downto 12),
	B=>SWITCH (11 downto 8),
	OUTPUT=>LST_SEL(2)
	);
GRT1: CompareGRT generic map (4) port map (
	A=>LST2_out,
	B=>SWITCH(7 downto 4),
	OUTPUT=>LST_SEL(1)
	);
GRT0: CompareGRT generic map (4) port map (
	A=>LST1_out,
	B=>SWITCH(3 downto 0),
	OUTPUT=>LST_SEL(0)
	);

LST2_out <= SWITCH (15 downto 12) when (LST_SEL(2) = '1') else
			  SWITCH (11 downto 8) when (LST_SEL(2) = '0') else
			  SWITCH (15 downto 12);

LST1_out <= LST2_out when (LST_SEL(1) = '1') else
			  SWITCH(7 downto 4) when (LST_SEL(1) = '0') else
			  LST2_out;
			  
LST0_out <= LST1_out when (LST_SEL(0) = '1') else
			  SWITCH(3 downto 0) when (LST_SEL(1) = '0') else
			  LST1_out;
			  
MIN <= LST0_out;



end Behavioral;

