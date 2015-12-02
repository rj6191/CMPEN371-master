----------------------------------------------------------------------------
-- Entity:        lab02 top level
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/27/15
-- Description:   top level to combine lab 1 with a 7 segment display
--
-- Revision History (date, initials, description): 9/2/15, KB RL, Initial Build
-- 
-- Dependencies:
--		mux.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab02_kjb5568_rjl5336 is
    Port ( BTNU 		: in  STD_LOGIC;
           BTNC	 	: in  STD_LOGIC;
           BTND	 	: in  STD_LOGIC;
			  SWITCH		: in	STD_LOGIC_VECTOR(7 downto 0);
			  ANODE		: out	STD_LOGIC_VECTOR(7 downto 0);
			  SEGMENT	: out STD_LOGIC_VECTOR(0   to   6);
			  LED			: out STD_LOGIC_VECTOR(7 downto 0));
end lab02_kjb5568_rjl5336;

architecture Behavioral of lab02_kjb5568_rjl5336 is

component mux4to1 is
	 Port( x0		 : in  STD_LOGIC_VECTOR(3 downto 0);
			 x1		 : in  STD_LOGIC_VECTOR(3 downto 0);
			 x2		 : in  STD_LOGIC_VECTOR(3 downto 0);
			 x3		 : in  STD_LOGIC_VECTOR(3 downto 0);
			 sel		 : in  STD_LOGIC_VECTOR(1 downto 0);
			 y			 : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component hextosevenseg is
	 Port( Hex 		 : in  STD_LOGIC_VECTOR(3 downto 0);
			 Segment  : out STD_LOGIC_VECTOR(0   to   6));
end component;

Component addersubtractor_4bit is
	Port(   A        : in  STD_LOGIC_VECTOR (3 downto 0);
           B        : in  STD_LOGIC_VECTOR (3 downto 0);
           SUBTRACT : in  STD_LOGIC;
           OVERFLOW : out STD_LOGIC;
           SUM      : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--internal signals
signal SEL		  	 : STD_LOGIC_VECTOR (1 downto 0);
signal mux_out		 : STD_LOGIC_VECTOR (3 downto 0);
signal sum_int			 : STD_LOGIC_VECTOR (3 downto 0);
signal overflow	 : STD_LOGIC;
begin


--implementation of lab 1 (4bit adder/subtractor)
addersubtractor: addersubtractor_4bit port map (
		A => switch ( 7 downto 4),
		B => switch ( 3 downto 0),
		Subtract => BTND,
		Overflow => overflow,
		sum => sum_int);


--implementation of hex to seven seg
hexto7: hextosevenseg port map (
		hex => mux_out,
		segment => segment);

--implementation of the 4:1 mux
MUX:    mux4to1 port map (
		x0 => sum_int,
		x1 => sum_int,
		x2 => switch(7 downto 4),
		x3 => switch(3 downto 0),
		sel => sel,
		y => mux_out);

--logic for sel signal (2 bits)
sel <= "10" when (BTNC = '1') else
		 "11" when (BTNU = '1') else
		 "00";
		
Anode <="11111110";
LED (3 downto 0) <= sum_int;
LED(7) <= overflow;
end Behavioral;

