----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:31 09/16/2015 
-- Design Name: 
-- Module Name:    Reg_nbit - Behavioral 
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

--------------------------------------------------------------------------------
entity Reg_nbit is
 generic (n : integer := 8);
 port (     D : in STD_LOGIC_VECTOR(n-1 downto 0);
			LOAD : in STD_LOGIC;
			 CLK : in STD_LOGIC;
			 CLR : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR(n-1 downto 0) := (OTHERS => '0'));
end Reg_nbit;


architecture Behavioral of Reg_nbit is

begin


end Behavioral;

