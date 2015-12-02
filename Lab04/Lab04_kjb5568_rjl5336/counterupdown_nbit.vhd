----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:32:57 09/17/2015 
-- Design Name: 
-- Module Name:    counterupdown_nbit - Behavioral 
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

entity CounterUpDown_nbit is
  generic (n : integer := 8);
	  port (EN : in STD_LOGIC;
			  UP : in STD_LOGIC;
			DOWN : in STD_LOGIC;
			 CLK : in STD_LOGIC;
			 CLR : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR (n-1 downto 0));
end CounterUpDown_nbit;


architecture Behavioral of counterupdown_nbit is

begin


end Behavioral;

