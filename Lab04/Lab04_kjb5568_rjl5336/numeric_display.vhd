----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:14:16 09/27/2015 
-- Design Name: 
-- Module Name:    numeric_display - Behavioral 
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

entity WordTo8dig7seg is
port ( word 		: in std_logic_vector(31 downto 0);
		 clk			: in std_logic;
		 strobe		: in std_logic;
		 Digit_en	: in std_logic_vector (7 downto 0);
		 segment		: out std_logic_vector (6 downto 0);
		 anode 		: out std_logic_vector (7 downto 0));
end WordTo8dig7seg;

architecture Behavioral of WordTo8dig7seg is

signal sel : std_logic_vector (2 downto 0);
signal clr_int : std_logic;
signal w2h : std_logic_vector (3 downto 0);
signal   count : integer := 0 ;
signal   count_track : integer := 0 ;



begin

cnt: counter_nbit generic map (3) port map (
	EN => Strobe,
	CLK => CLK,
	CLR => clr_int,
	Q => sel);
	
clr_int <= '1' when (to_integer(unsigned( sel(2 downto 0))))= 7 else
		     '0';
w2h <= word( 31 downto 28) when sel = "111" else
		 word( 27 downto 24) when sel = "110" else
		 word( 23 downto 20) when sel = "101" else
		 word( 19 downto 16) when sel = "100" else
		 word( 15 downto 12) when sel = "011" else
		 word( 11 downto 8)  when sel = "010" else
		 word( 7 downto 4)   when sel = "001" else
		 word( 3 downto 0)   when sel = "000" else
		 word( 3 downto 0);

h27: hextosevenseg port map(
	hex => w2h,
	segment => segment);
	
				 
anode (7 downto 0) <= "01111111" when(digit_en(7)='1' and sel = "111") else
							 "10111111" when(digit_en(6)='1' and sel = "110") else
							 "11011111" when(digit_en(5)='1' and sel = "101") else
							 "11101111" when(digit_en(4)='1' and sel = "100") else
							 "11110111" when(digit_en(3)='1' and sel = "011") else
							 "11111011" when(digit_en(2)='1' and sel = "010") else
							 "11111101" when(digit_en(1)='1' and sel = "001") else
							 "11111110" when(digit_en(0)='1' and sel = "000") else
							 "11111110";

end Behavioral;

