----------------------------------------------------------------------------
-- Entity:        Average
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   computes the average for 4 numbers rounding up when necessary
--
-- Revision History (date, initials, description): 9/10/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Up_down_with_input_nbit is
  generic (n : integer := 8);
	  port (EN : in STD_LOGIC;
			  UP : in STD_LOGIC;
			DOWN : in STD_LOGIC;
			 CLK : in STD_LOGIC;
			 CLR : in STD_LOGIC;
		  INPUT : in STD_LOGIC_VECTOR (n-1 downto 0);
				Q : out STD_LOGIC_VECTOR (n-1 downto 0));
end Up_down_with_input_nbit;


architecture Behavioral of Up_down_with_input_nbit is

signal   count : STD_LOGIC_VECTOR (n-1 downto 0);

begin

process (CLK) is 
begin 
	if (CLK'event and CLK='1' and en = '1') then 
		if(up = '1') then
			count <= STD_LOGIC_VECTOR(unsigned(input)+1);
		elsif (down = '1') then 
			count <= STD_LOGIC_VECTOR(unsigned(input)+1) ;
		elsif(CLR = '1') then 
			count <= (others => '0');
		end if;
	end if;
	Q <= count; 
end process;


end Behavioral;

