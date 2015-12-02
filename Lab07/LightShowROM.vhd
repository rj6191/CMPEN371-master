----------------------------------------------------------------------------
-- Entity:        LightShowROM 
-- Written By:    E. George Walters
-- Date Created:  7 Oct 14
-- Description:   VHDL model of ROM for CMPEN 371 FA15 Lab07 programmable 
--    light show.
--
-- Revision History (date, initials, description):
--    11 Oct 15, egw100, updated for FA 15
-- Dependencies:
--		(none)
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.NUMERIC_STD.ALL;

----------------------------------------------------------------------------
entity LightShowROM is
	port (ADDRESS  : in  STD_LOGIC_VECTOR (9 downto 0);
         CLK      : in  STD_LOGIC;
		   DATA_out : out STD_LOGIC_VECTOR (19 downto 0));
end LightShowROM;
----------------------------------------------------------------------------

architecture Behavioral of LightShowROM is

	type ROM_TYPE is ARRAY (0 to 1023) of STD_LOGIC_VECTOR(19 downto 0);
	constant ROM : ROM_TYPE := (
      -- opCode   Data
          x"4"  & "1000000000000001", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0100000000000010", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0010000000000100", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0001000000001000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0000100000010000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0000010000100000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0000001001000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0000000110000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0000001001000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0000010000100000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0000100000010000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0001000000001000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0010000000000100", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0100000000000010", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "1000000000000001", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"9"  & "0000000000100010", -- Branch if right is pushed (
			 x"A"  & "0000000001000011", -- Branch if center is pushed
			 x"C"  & "0000000010000100", -- Branch if left is pushed
			 x"8"  & "0000000000000000", -- Jump 0
			 x"4"  & "1010101010101010", -- Load LED --should jump to here###########block 34
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1010101010101010", -- Load LED 
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1010101010101010", -- Load LED 
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1010101010101010", -- Load LED 
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1010101010101010", -- Load LED 
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1010101010101010", -- Load LED 
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1010101010101010", -- Load LED 
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1010101010101010", -- Load LED 
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
          x"4"  & "0101010101010101", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec) ==16
			 x"8"  & "0000000000011110", -- Jump 30						################block 66
			 x"4"  & "1100000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0011000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000110000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000001100000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000011000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000110000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000001100", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000000011", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec) ##82
			 x"4"  & "1100000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0011000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000110000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000001100000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000011000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000110000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000001100", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000000011", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec) ##98
			 x"4"  & "1100000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0011000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000110000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000001100000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000011000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000110000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000001100", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000000011", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec) ##114
			 x"4"  & "1100000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
          x"4"  & "0011000000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000110000000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000001100000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000011000000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000110000", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000001100", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec)
			 x"4"  & "0000000000000011", -- Load LED
          x"1"  & "0000000000001111", -- Delay 31 ms (approx 1/64 sec) #130
			 x"8"  & "0000000000011110", -- Jump 30
			 x"4"  & "1000000000000000", -- Load LED			#132
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1100000000000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1110000000000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1111000000000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1111100000000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1111110000000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1111111000000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1111111100000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1111111110000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "1111111111000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0111111111100000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0011111111110000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0001111111111000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000111111111100", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000011111111110", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000001111111111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000111111111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000011111111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000001111111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000000111111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000000011111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000000001111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000000000111", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000000000011", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000000000001", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"4"  & "0000000000000000", -- Load LED
          x"1"  & "0000000001111111", -- Delay 127 ms (approx 1/8 sec)
			 x"8"  & "0000000000011110", -- Jump 30
			 x"8"  & "0000000000000000", -- Jump 0				##186
          
          
          others => (others => '0')
	);
   
begin

	process (CLK)
	begin
      if (CLK'event and CLK = '1') then
         DATA_out <= ROM(to_integer(unsigned(ADDRESS)));
      end if;
	end process;
	
end Behavioral;

