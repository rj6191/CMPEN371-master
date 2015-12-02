----------------------------------------------------------------------------
-- Entity:        hextosevemseg
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/27/15
-- Description:   converts hexadecimal to seven segment display
--
-- Revision History (date, initials, description): 9/3/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hextosevenseg is
	Port ( Hex 		 : in  STD_LOGIC_VECTOR(3 downto 0);
			 Segment  : out STD_LOGIC_VECTOR(0   to   6));
	
end hextosevenseg;

architecture Behavioral of hextosevenseg is

begin

Segment <=	"0000001" when (Hex = "0000") else -- 0
				"1001111" when (Hex = "0001") else -- 1
				"0010010" when (Hex = "0010") else -- 2
				"0000110" when (Hex = "0011") else -- 3
				"1001100" when (Hex = "0100") else -- 4
				"0100100" when (Hex = "0101") else -- 5
				"0100000" when (Hex = "0110") else -- 6
				"0001111" when (Hex = "0111") else -- 7
				"0000000" when (Hex = "1000") else -- 8
				"0000100" when (Hex = "1001") else -- 9
				"0001000" when (Hex = "1010") else -- A
				"1100000" when (Hex = "1011") else -- B
				"0110001" when (Hex = "1100") else -- C
				"1000010" when (Hex = "1101") else -- D
				"0110000" when (Hex = "1110") else -- E
				"0111000" when (Hex = "1111") else  -- F
				"0000001";

end Behavioral;

