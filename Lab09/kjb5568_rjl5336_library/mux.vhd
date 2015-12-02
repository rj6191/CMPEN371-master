----------------------------------------------------------------------------
-- Entity:        4 to 1 mux 
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/27/15
-- Description:   4 to 1 mux with 4 bits out
--
-- Revision History (date, initials, description): 9/2/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux4to1 is
	Port ( x0		: in  STD_LOGIC_VECTOR(3 downto 0);
			 x1		: in  STD_LOGIC_VECTOR(3 downto 0);
			 x2		: in  STD_LOGIC_VECTOR(3 downto 0);
			 x3		: in  STD_LOGIC_VECTOR(3 downto 0);
			 sel		: in  STD_LOGIC_VECTOR(1 downto 0);
			 y	: out STD_LOGIC_VECTOR(3 downto 0));			 
end mux4to1;

architecture Structural of mux4to1 is

begin

with sel select
	y	 <= x0 when "00",
			 x1 when "01",
			 x2 when "10",
			 x3 when "11",
			 x0 when others;


end Structural;

