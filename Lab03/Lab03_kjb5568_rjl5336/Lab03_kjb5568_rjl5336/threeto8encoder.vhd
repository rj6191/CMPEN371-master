----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:54 09/13/2015 
-- Design Name: 
-- Module Name:    to8encoder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity threeto8encoder is
		port( A			: in STD_LOGIC_VECTOR (3 downto 0);
				en			: in STD_LOGIC;
				output	: out STD_LOGIC_VECTOR (7 downto 0));

end threeto8encoder;

architecture Behavioral of threeto8encoder is

begin

output <="11111101" when ((en = '1') and A = "0001") else 
			"11111011" when ((en = '1') and A = "0010") else 
			"11110111" when ((en = '1') and A = "0011") else 
			"11101111" when ((en = '1') and A = "0100") else 
			"11011111" when ((en = '1') and A = "0101") else 
			"10111111" when ((en = '1') and A = "0110") else 
			"01111111" when ((en = '1') and A = "0111") else
			"11111110";


end Behavioral;

