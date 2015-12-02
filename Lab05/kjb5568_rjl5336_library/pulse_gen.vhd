----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:12:07 09/28/2015 
-- Design Name: 
-- Module Name:    pulse_gen - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;


entity pulse_gen is
 generic (n : integer := 4;
	maxCount : natural := 9);
	port (EN : in STD_LOGIC;
	CLK : in STD_LOGIC;
	CLR : in STD_LOGIC;
	PULSE : out STD_LOGIC);
end pulse_gen;
----------------------

architecture Behavioral of pulse_gen is

signal pulse_int : std_logic;
signal clear : std_logic;
signal count : std_logic_vector(n-1 downto 0);

begin

cnt: counter_nbit generic map (n => n) port map(
	EN => EN,
	CLK => CLK,
	CLR => clear,
	Q => count);
	
pulse_int <= '1' when (to_integer(unsigned( count(n-1 downto 0))))= maxcount else
				 '0';
pulse <= pulse_int;

clear <= pulse_int or CLR;



end Behavioral;

