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
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (3 downto 0));
end Ripple_Carry_Adder;

architecture Structural of Ripple_Carry_Adder is
 
	component FullAdder is
		Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
	end component;
	
 signal c01 : STD_LOGIC; --carryout between fa0 and fa1
 signal c12 : STD_LOGIC; --carryout between fa1 and fa2
 signal c23 : STD_LOGIC; --carryout between fa2 and fa3
 
begin

--4 full adders to make up the 4 bit adder

FA0: FullAdder port map (
	A => A(0),
	B => B(0),
	C_in => C_in,
	C_out => c01,
	SUM => SUM(0)
	);
	
FA1: FullAdder port map (
	A => A(1),
	B => B(1),
	C_in => c01,
	C_out => c12,
	SUM => SUM(1)
	);

FA2: FullAdder port map (
	A => A(2),
	B => B(2),
	C_in => c12,
	C_out => c23,
	SUM => SUM(2)
	);
	
FA3: FullAdder port map (
	A => A(3),
	B => B(3),
	C_in => c23,
	C_out => C_out,
	SUM => SUM(3)
	);
	
	

end Structural;

