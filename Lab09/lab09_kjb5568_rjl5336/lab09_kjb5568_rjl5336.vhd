----------------------------------------------------------------------------
-- Entity:        Lab 09 Top
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  11/2/15
-- Description:   Lab using PWM to control the RGB LED's
--
-- Revision History (date, initials, description): 11/2/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_Library
--		pwm.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library kjb5568_rjl5336_Library;
use     kjb5568_rjl5336_Library.kjb5568_rjl5336_Components.all;

entity lab09_kjb5568_rjl5336 is
		port( SWITCH 	: in STD_LOGIC_VECTOR(15 downto 0);
				CLK		: in STD_LOGIC;
				ANODE		: out STD_LOGIC_VECTOR(7 downto 0);
				SEGMENT	: out STD_LOGIC_VECTOR(0 to 6);
				LED		: out STD_LOGIC_VECTOR(15 downto 0);
				RGB1_RED	: out STD_LOGIC;
				RGB1_BLU	: out STD_LOGIC;
				RGB1_GRN	: out STD_LOGIC;
				RGB2_RED	: out STD_LOGIC;
				RGB2_BLU	: out STD_LOGIC;
				RGB2_GRN	: out STD_LOGIC);
end lab09_kjb5568_rjl5336;

architecture Behavioral of lab09_kjb5568_rjl5336 is

signal digit_en		 : STD_LOGIC_VECTOR (7 downto 0);
signal count			 : STD_LOGIC_VECTOR (3 downto 0);
signal r_int			 : STD_LOGIC_VECTOR (3 downto 0);
signal g_int			 : STD_LOGIC_VECTOR (3 downto 0);
signal b_int			 : STD_LOGIC_VECTOR (3 downto 0);
signal strobe			 : STD_LOGIC;
signal hz16			 	 : STD_LOGIC;
signal clr_int		 	 : STD_LOGIC;

component PWM is
	port( PD 		: in  STD_LOGIC_VECTOR (13 downto 0) ;
			PW			: in  STD_LOGIC_VECTOR (13 downto 0);
			CLK		: in  STD_LOGIC;
			PMW_out  : out STD_LOGIC);
end component;


begin

PWM_INST_R1: PWM port map(
			PD 		=> "10011100001111",
			PW			=> Switch(15 downto 12) & "0000000000",
			CLK		=> CLK,
			PMW_out  =>  RGB1_RED);

PWM_INST_G1: PWM port map(
			PD 		=> "10011100001111",
			PW			=> Switch(11 downto 8) & "0000000000",
			CLK		=> CLK,
			PMW_out  =>  RGB1_GRN);

PWM_INST_B1: PWM port map(
			PD 		=> "10011100001111",
			PW			=> Switch(7 downto 4) & "0000000000",
			CLK		=> CLK,
			PMW_out  =>  RGB1_BLU);
PWM_INST_R2: PWM port map(
			PD 		=> "10011100001111",
			PW			=> '0' & r_int & "000000000",
			CLK		=> CLK,
			PMW_out  =>  RGB2_RED);

PWM_INST_G2: PWM port map(
			PD 		=> "10011100001111",
			PW			=> '0' & g_int & "000000000",
			CLK		=> CLK,
			PMW_out  =>  RGB2_GRN);

PWM_INST_B2: PWM port map(
			PD 		=> "10011100001111",
			PW			=> '0' & b_int & "000000000",
			CLK		=> CLK,
			PMW_out  =>  RGB2_BLU);

pulse_strobe: pulse_gen generic map( n => 16,  maxcount => 50000) port map(
	en => '1',
	clk => clk,
	clr => '0',
	pulse => strobe);
	
pulse_16: pulse_gen generic map( n => 23,  maxcount => 6250000) port map(
	en => '1',
	clk => clk,
	clr => clr_int,
	pulse => hz16);
	
r_int <= count when Switch(2) = '1' else
		     "0000";

g_int <= count when Switch(1) = '1' else
		     "0000";
			  
b_int <= count when Switch(0) = '1' else
		     "0000";
			
digit_en <= "11100001";
sevenseg : WordTo8dig7seg port map(
		 word 		=>Switch ( 15 downto 4) & "0000000000000000" & count,
		 clk			=> clk,
		 strobe		=> strobe,
		 Digit_en	=> digit_en,
		 segment		=> Segment,
		 anode 		=> Anode);
		 
cnt: counter_nbit generic map (n=>4) port map (
	EN => hz16,
	CLK => CLK,
	CLR => clr_int,
	Q => count);
	
clr_int <= '1' when (to_integer(unsigned( count(2 downto 0))))= 8 else
		     '0';
			  
LED <= SWITCH;
end Behavioral;

