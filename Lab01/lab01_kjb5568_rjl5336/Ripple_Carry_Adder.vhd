----------------------------------------------------------------------------
-- Entity:        Ripple Carry Adder
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/26/15
-- Description:   Ripple Carry Adder
--
-- Revision History (date, initials, description): 8/26/15, KB RL, Initial Build
-- 
-- Dependencies:
--		<List entities, one per line.  Type (none) if none are required.>
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ripple_Carry_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           SUM : out  STD_LOGIC);
end Ripple_Carry_Adder;

architecture Dataflow of Ripple_Carry_Adder is
 signal c01 : STD_LOGIC;
 signal c02 : STD_LOGIC;
 signal c03 : STD_LOGIC;
begin


end Behavioral;

