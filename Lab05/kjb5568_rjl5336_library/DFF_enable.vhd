----------------------------------------------------------------------------
-- Entity:        DFF_CE
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   flip flop with an enable
--
-- Revision History (date, initials, description): 9/16/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
	if(clk'event and clk='1') then
		if( CE ='1')then
			q<=d;
		end if;
	end if;
end process;

end Behavioral;

