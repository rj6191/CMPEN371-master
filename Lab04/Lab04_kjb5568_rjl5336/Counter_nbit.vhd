----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:33 09/17/2015 
-- Design Name: 
-- Module Name:    Counter_nbit - Behavioral 
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

entity Counter_nbit is
 generic (n : integer := 8);
 port (EN : in STD_LOGIC;
 CLK : in STD_LOGIC;
 CLR : in STD_LOGIC;
 Q : out STD_LOGIC_VECTOR (n-1 downto 0));
end Counter_nbit;

architecture Behavioral of Counter_nbit is

begin


end Behavioral;

