----------------------------------------------------------------------------
-- Entity:        Lab 4 Top Level
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   Top level for getting aquanited with registers
--
-- Revision History (date, initials, description): 9/16/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;

entity lab04_kjb5568_rjl5336 is
	 Port ( BTNL 		: in  STD_LOGIC;
           BTNR	 	: in  STD_LOGIC;
           BTNU	 	: in  STD_LOGIC;
           BTND	 	: in  STD_LOGIC;
           BTNC	 	: in  STD_LOGIC;
			  CLK			: in  STD_LOGIC;
			  SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0);
			  ANODE		: out	STD_LOGIC_VECTOR(7 downto 0);
			  SEGMENT	: out STD_LOGIC_VECTOR(0   to   6);
			  LED			: out STD_LOGIC_VECTOR(15 downto 0));
end lab04_kjb5568_rjl5336;

architecture Structural of lab04_kjb5568_rjl5336 is

signal Register0_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Register1_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Register2_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Register3_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Register4_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Register5_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Register6_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Register7_out  : STD_LOGIC_VECTOR (15 downto 0);
signal Reg_display	 : STD_LOGIC_VECTOR (15 downto 0);
signal word_int		 : STD_LOGIC_VECTOR (31 downto 0);
signal digit_en		 : STD_LOGIC_VECTOR (7 downto 0);
signal reg_sel			 : STD_LOGIC_VECTOR (3 downto 0);
signal pulse_16		 : STD_LOGIC;
signal pulse_50		 : STD_LOGIC;
signal strobe			 : STD_LOGIC;
signal pulse_1000		 : STD_LOGIC;
signal UP_oneshotted  : STD_LOGIC;
signal UP_debounced   : STD_LOGIC;
signal Down_debounced : STD_LOGIC;
signal Center_debounced  : STD_LOGIC;
signal UP_corrected   : STD_LOGIC;
signal Down_corrected : STD_LOGIC;
signal Center_corrected  : STD_LOGIC;

begin


Center_debounce: Debouncer port map(
	D => BTNC,
	CLK => CLK,
	pulse => pulse_1000,
	Q => Center_Debounced);
	
Center_steady: OneShot port map(
	D => Center_debounced,
	CLK => CLK,
	Q => Center_corrected);
	
Register0: shift_register port map(
	d => switch(0),
	load => center_corrected,
	clk => clk,
	q => Register0_out);

Register1: counter_nbit generic map (n=>16) port map (
	EN => pulse_16,
	CLK => CLK,
	CLR => BTNR,
	Q => register1_out);

Register2: counter_nbit generic map (n=>16) port map (
	EN => pulse_50,
	CLK => CLK,
	CLR => BTNR,
	Q => register2_out);
	
Register3: Reg_nbit generic map (n=>16) port map (
	D => register2_out,
	LOAD => BTNL,
	CLK => CLK,
	CLR => BTNR,
	Q => Register3_out);

Register4: counter_nbit generic map (n=>16) port map(
	EN => BTNU,
	CLK => CLK,
	CLR => BTNR,
	Q => Register4_out);
	
Register5: counter_nbit generic map (n=>16) port map(
	EN => UP_oneshotted,
	CLK => CLK,
	CLR => BTNR,
	Q => Register5_out);
	
Register6: counter_nbit generic map (n=>16) port map(
	EN => UP_corrected,
	CLK => CLK,
	CLR => BTNR,
	Q => Register6_out);
	
Register7: CounterUpDown_nbit generic map (n=>16) port map(
	EN => '1',
	UP => UP_corrected,
	DOWN => Down_corrected,
	CLK => CLK,
	CLR => BTNR,
	Q => Register7_out);
	
UP_Oneshot: OneShot port map(
	D => BTNU,
	CLK => CLK,
	Q => UP_oneshotted);

UP_steady: OneShot port map(
	D => UP_debounced,
	CLK => CLK,
	Q => UP_corrected);

UP_debounce: Debouncer port map(
	D => BTNU,
	CLK => CLK,
	pulse => pulse_1000,
	Q => UP_Debounced);
	
Down_steady: OneShot port map(
	D => Down_debounced,
	CLK => CLK,
	Q => Down_corrected);

Down_debounce: Debouncer port map(
	D => BTND,
	CLK => CLK,
	pulse => pulse_1000,
	Q => Down_Debounced);
	
pulse16: pulse_gen generic map( n => 16,  maxcount => 6250000) port map(
	en => '1',
	clk => clk,
	clr => BTNR,
	pulse => pulse_16);
pulse50: pulse_gen generic map( n => 16,  maxcount => 2) port map( 
	en => '1',
	clk => clk,
	clr => BTNR,
	pulse => pulse_50);
pulse500: pulse_gen generic map( n => 16,  maxcount => 100000) port map(
	en => '1',
	clk => clk,
	clr => BTNR,
	pulse => strobe);
pulse1000: pulse_gen generic map( n => 16,  maxcount => 10000) port map(
	en => '1',
	clk => clk,
	clr => BTNR,
	pulse => pulse_1000);	

	
Reg_display <= Register0_out when switch(15 downto 13) = "000" else
					Register1_out when switch(15 downto 13) = "001" else
					Register2_out when switch(15 downto 13) = "010" else
					Register3_out when switch(15 downto 13) = "011" else
					Register4_out when switch(15 downto 13) = "100" else
					Register5_out when switch(15 downto 13) = "101" else
					Register6_out when switch(15 downto 13) = "110" else
					Register7_out when switch(15 downto 13) = "111" else
					Register0_out;
					
					
word_int <= "0" & switch(15 downto 13) & "000000000000" & reg_display;
digit_en <= "10001111";
					
display: wordto8dig7seg port map (
	word => word_int,
	clk => clk,
	strobe => strobe,
	digit_en => digit_en,
	segment => segment,
	anode => anode);


LED <= register0_out;

								


	


end Structural;

