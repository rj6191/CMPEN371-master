----------------------------------------------------------------------------
-- Entity:        3 to 8 encoder
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   encoder that takes 3 bits and an enable and converrts that into 8 different outputs
--
-- Revision History (date, initials, description): 9/10/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity threeto8encoder is
		port( A			: in STD_LOGIC_VECTOR (2 downto 0);
				en			: in STD_LOGIC;
				output	: out STD_LOGIC_VECTOR (7 downto 0));

end threeto8encoder;

architecture structural of threeto8encoder is
begin


output <="11111101" when ((en = '1') and A = "001") else 
			"11111011" when ((en = '1') and A = "010") else 
			"11110111" when ((en = '1') and A = "011") else 
			"11101111" when ((en = '1') and A = "100") else 
			"11011111" when ((en = '1') and A = "101") else 
			"10111111" when ((en = '1') and A = "110") else 
			"01111111" when ((en = '1') and A = "111") else
			"11111110";


end structural;

