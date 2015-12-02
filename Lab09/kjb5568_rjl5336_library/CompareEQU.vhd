----------------------------------------------------------------------------
-- Entity:        equal to comparator
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   compares 2 numbers and outputs the higher number
--
-- Revision History (date, initials, description): 9/10/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CompareEQU is
	generic (n: integer :=4);
    Port ( X        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Y        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           EQU   : out STD_LOGIC);
end CompareEQU;

architecture structural of CompareEQU is

begin

EQU <= '1' when (X = Y) else
			 '0' ;


end structural;