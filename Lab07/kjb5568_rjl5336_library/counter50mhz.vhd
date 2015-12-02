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

entity counter50mhz is
 generic (n : integer := 16);
	port (EN : in STD_LOGIC;
		  CLK : in STD_LOGIC;
		  CLR : in STD_LOGIC;
			 Q : out STD_LOGIC_VECTOR (n-1 downto 0));
end counter50mhz;

architecture Behavioral of counter50mhz is

signal   count : integer := 0 ;
signal   count_int : integer := 0 ;

begin
process (CLK) is 
	begin 
		if (CLK'event and CLK='1') then 
			if(CLR = '1') then 
				count <= 0;
			elsif (EN = '1') then
				count_int <= count_int + 1 ; 
			end if;
			elsif (count_int = 2) then   --100mhz -> 50m hz 
				count <= count +1;
				Q <= STD_LOGIC_VECTOR (to_unsigned(count, Q'length)); 
				count_int <= 0;
		end if;
	end process;

end Behavioral;

