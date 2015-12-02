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
		generic (n: integer :=4);
    Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (n-1 downto 0));
end Ripple_Carry_Adder;

architecture Structural of Ripple_Carry_Adder is
 
	component FullAdder is
		Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
	end component;
	
 signal carry : STD_LOGIC_VECTOR( n downto 0);
 
begin

--4 full adders to make up the 4 bit adder


carry(0) <= c_in;
c_out <= carry(n);
genADDERS: for i in 0 to n-1 generate
	begin
		FA0: FullAdder port map (
			A => A(i),
			B => B(i),
			C_in => carry(i),
			C_out => carry(i+1),
			SUM => SUM(i)
		);
	end generate;

end Structural;

