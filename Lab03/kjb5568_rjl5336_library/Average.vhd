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

entity Average is
	port ( SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0); -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			 AVG			: out	STD_LOGIC_VECTOR(3 downto 0));
end Average;

architecture structural of Average is

signal a : integer;
signal b : integer;
signal c : integer;
signal d : integer;
signal total : integer;
signal average_int : integer; 
signal check_overflow : STD_LOGIC_VECTOR(4 downto 0);


begin


a <= to_integer(signed(SWITCH(15 downto 12)));
b <= to_integer(signed(SWITCH(11 downto 8)));
c <= to_integer(signed(SWITCH(7 downto 4)));
d <= to_integer(signed(SWITCH(3 downto 0)));

total <= a + b + c + d;
check_overflow <= STD_LOGIC_VECTOR(to_signed(total,5));
average_int <= (total/4) + 1 when ((check_overflow(1 downto 0) = "10")) else
					(total/4) + 1 when ((check_overflow(1 downto 0) = "11")) else
				   (total/4);	

AVG<= STD_LOGIC_VECTOR(to_signed(average_int,4));




end structural;

