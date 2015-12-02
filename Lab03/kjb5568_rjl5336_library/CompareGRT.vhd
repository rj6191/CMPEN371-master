----------------------------------------------------------------------------
-- Entity:        greater than
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CompareGRT is
	generic (n: integer :=4);
    Port ( A        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           OUTPUT   : out STD_LOGIC);
end CompareGRT;

architecture structural of CompareGRT is

begin

OUTPUT <= '1' when (A> B) else
			 '0' when (B> A) else
			 '1';


end structural;

