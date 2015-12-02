----------------------------------------------------------------------------
-- Entity:        lab03 top level
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   top level of lab 3
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

entity Lab03_Kjb5568_rjl5336_top is
	 Port ( BTNL 		: in  STD_LOGIC;
           BTNR	 	: in  STD_LOGIC;
           BTNU	 	: in  STD_LOGIC;
           BTND	 	: in  STD_LOGIC;
           BTNC	 	: in  STD_LOGIC;
			  SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0);   -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			  ANODE		: out	STD_LOGIC_VECTOR(7 downto 0);
			  SEGMENT	: out STD_LOGIC_VECTOR(0   to   6);
			  LED			: out STD_LOGIC_VECTOR(15 downto 0));  -- 15-12 A, 11-8 B, 7-4 C, 3-0 D


end Lab03_Kjb5568_rjl5336_top;

architecture structural of Lab03_Kjb5568_rjl5336_top is

signal LT_out  : STD_LOGIC_VECTOR (3 downto 0);
signal EQ_out  : STD_LOGIC_VECTOR (3 downto 0);
signal max  	: STD_LOGIC_VECTOR (3 downto 0);
signal min  	: STD_LOGIC_VECTOR (3 downto 0);
signal Sum     : STD_LOGIC_VECTOR (3 downto 0);
signal Hex_int : STD_LOGIC_VECTOR (3 downto 0);
signal Hex 		: STD_LOGIC_VECTOR (3 downto 0);
signal AVG 		: STD_LOGIC_VECTOR (3 downto 0);
signal sel		: STD_LOGIC_VECTOR (1 downto 0);
signal en 		: STD_LOGIC;
signal A_int 	: STD_LOGIC_VECTOR(2 downto 0);


begin

GRTR: maximum port map (
	Switch	=> Switch,
	max 		=> max);
	
LSTS: minimum port map (
	Switch => Switch,
	min	 => min);
AVGR: Average port map (
	Switch => Switch,
	AVG 	 => AVG);
	
ADDER: addersubtractor_nbit generic map (4) port map (
	A 			=> SWITCH (15 downto 12),
	B 			=> SWITCH (11 downto 8),
	Subtract => BTNR,
	Overflow => Open,
	Sum 		=> Sum);
	
HEX2SEVEN: hextosevenseg port map (
	hex 	  => hex,
	segment => segment);
	
A_int <= switch(14 downto 12);

encoder: threeto8encoder port map (
	A  => A_int,
	en => en,
	output => anode);
	
mux: mux4to1 port map (
	 x0  => sum,
	 x1  => max,
	 x2  => min,
	 x3  => avg,
	 sel => sel,
	 y   => hex_int);

hex <= SWITCH (15 downto 12) when en = '1' else
		 hex_int when en = '0' else
		 SWITCH (15 downto 12);
		 
en <= '1' when ( (btnu = '0') and (btnd = '0') and (btnl = '0') and (btnr = '0') and (btnc = '0')) else
		'0';
		
sel <= "00" when ((btnl = '1') or (btnr = '1')) else
		 "01" when (btnu = '1') else
		 "10" when (btnd = '1') else
		 "11" when (btnc = '1') else
		 "00";
LED <= Switch;
 







end structural;

