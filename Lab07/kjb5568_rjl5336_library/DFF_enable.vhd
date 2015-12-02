----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:21 09/16/2015 
-- Design Name: 
-- Module Name:    DFF_enable - Behavioral 
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
entity DFF_CE is
 port ( D : in STD_LOGIC;
 CE : in STD_LOGIC;
 CLK : in STD_LOGIC;
 Q : out STD_LOGIC:= '0');
end DFF_CE;


architecture Behavioral of DFF_CE is

begin

Process(CLK) is
begin
	if(clk'event and clk='1' and CE = '1') then
	q<=d;
	end if;
end process;

end Behavioral;

