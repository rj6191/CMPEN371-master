----------------------------------------------------------------------------
-- Entity:        UP Down Counter
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   counnter that can count up or down depending on input, both up and down is not handled
--
-- Revision History (date, initials, description): 9/10/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

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

signal   count : integer := 0 ;

begin

process (CLK) is 
begin 
	if (CLK'event and CLK='1' and en = '1') then 
		if(up = '1') then
			count <= count + 1 ;
		elsif (down = '1') then 
			count <= count - 1 ;
		elsif(CLR = '1') then 
			count <= 0;
		end if;
	end if;
	Q <= STD_LOGIC_VECTOR (to_unsigned(count, Q'length)); 
end process;


end Behavioral;

