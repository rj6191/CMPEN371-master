----------------------------------------------------------------------------
-- Entity:        n bit register
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   generic register that allows for the storing of n bits
--
-- Revision History (date, initials, description): 9/16/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_nbit is
 generic (n : integer := 16);
 port (     D : in STD_LOGIC_VECTOR(n-1 downto 0);
			LOAD : in STD_LOGIC;
			 CLK : in STD_LOGIC;
			 CLR : in STD_LOGIC;
				Q : out STD_LOGIC_VECTOR(n-1 downto 0) := (OTHERS => '0'));
end Reg_nbit;


architecture Behavioral of Reg_nbit is

begin

process(CLK) is 
begin
	if(clk'event and clk = '1') then
		if(clr = '1') then
			Q <= (others => '0');
		elsif(load ='1') then
			Q <= D;
		end if;
	end if;
end process;	


end Behavioral;

