----------------------------------------------------------------------------
-- Entity:        DFF
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   flip flop
--
-- Revision History (date, initials, description): 9/16/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
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

