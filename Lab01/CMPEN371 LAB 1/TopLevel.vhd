----------------------------------------------------------------------------
-- Entity:        AdderSubtracter_4bit
-- Written By:    Kevin Brenneman, Richard Lucas
-- Date Created:  27 Aug 15
-- Description:   VHDL top level for the AdderSubtracter_4bit
--
-- Revision History (date, initials, description):
--   27 Aug 15, kjb5568 rjl536, Modified port signal names to reflect course standard
-- 
-- Dependencies:
--   FullAdder, RippleCarryAdder
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity TopLevel is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           SUBTRACT : in  STD_LOGIC;
           OVERFLOW : out  STD_LOGIC;
           SUM : out  STD_LOGIC);
end TopLevel;

architecture Structural of TopLevel is

begin


end Structural;

