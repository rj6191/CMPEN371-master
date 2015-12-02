----------------------------------------------------------------------------
-- Entity:        N bit counter
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   counter that always counts up and will output the count as an n bit vector
--
-- Revision History (date, initials, description): 9/16/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter_nbit is
 generic (n : integer := 8);
	port (EN : in STD_LOGIC;
		  CLK : in STD_LOGIC;
		  CLR : in STD_LOGIC;
			 Q : out STD_LOGIC_VECTOR (n-1 downto 0));
end Counter_nbit;

architecture Behavioral of Counter_nbit is

signal   count : integer := 0 ;

begin
process (CLK) is 
	begin 
		if (CLK'event and CLK='1') then 
			if(CLR = '1') then 
				count <= 0;
				Q <= (others => '0');
			elsif (EN = '1') then
				count <= count + 1 ; 
				Q <= STD_LOGIC_VECTOR(to_unsigned(count, Q'length)); 
			end if;
		end if;
	end process;
end Behavioral;

