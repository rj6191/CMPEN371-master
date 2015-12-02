----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:22 09/16/2015 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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

entity DFF is
 port ( D : in STD_LOGIC;
		CLK : in STD_LOGIC;
		  Q : out STD_LOGIC:= '0');
end DFF;

architecture Behavioral of DFF is

begin

Process(CLK) is
begin
	if(clk'event and clk='1') then
	q<=d;
	end if;
end process;

end Behavioral;

