----------------------------------------------------------------------------
-- Entity:        AdderSubtractor_4bit
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/27/15
-- Description:   AdderSubtractor_4bit top level
--
-- Revision History (date, initials, description): 08/27/15, KB RL, Initial Build
-- 																09/02/15, KB RL, Revised Spacing
-- Dependencies:
--		<List entities, one per line.  Type (none) if none are required.>
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity AdderSubtractor_4bit is
    Port ( A        : in  STD_LOGIC_VECTOR (3 downto 0);
           B        : in  STD_LOGIC_VECTOR (3 downto 0);
           SUBTRACT : in  STD_LOGIC;
           OVERFLOW : out STD_LOGIC;
           SUM      : out STD_LOGIC_VECTOR (3 downto 0));
end AdderSubtractor_4bit;

architecture Structural of AdderSubtractor_4bit is

	component Ripple_Carry_Adder is                   --Architectural component Ripple Carry Adder 
		Port ( A     : in  STD_LOGIC_VECTOR (3 downto 0);
				 B     : in  STD_LOGIC_VECTOR (3 downto 0);
				 C_in  : in  STD_LOGIC;
				 C_out : out STD_LOGIC;
				 SUM   : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
--internal signals
signal BXOR 	     : STD_LOGIC_VECTOR (3 downto 0);  --wires to send otuput from InvertOrPass to the Ripple Carry Adder
signal Sum_Int      : STD_LOGIC_VECTOR (3 downto 0);  --wires to send otuput from the Ripple Carry Adder to OverflowDetect and out to the 4bit SUM
signal A_MSB        : STD_LOGIC 							;	--internal signal of A(3) in the OverflowDetector
signal B_MSB        : STD_LOGIC 							; 	--internal signal of B(3) in the OverflowDetector
signal SUM_MSB   	  : STD_LOGIC 							; 	--internal signal of Sum_Int(3) in the OverflowDetector
signal hold_c_out   : STD_LOGIC 							; 	--something to hold the RCA C_out



begin

RCA: Ripple_Carry_Adder port map (
	A 		=> A,
	B 		=> BXOR,
	C_in	=> SUBTRACT,
	C_out => hold_c_out,
	SUM 	=> Sum_Int
	);

--InvertOrPass block
BXOR(3) 	<= B(3) xor SUBTRACT;
BXOR(2)	<= B(2) xor SUBTRACT;
BXOR(1)	<= B(1) xor SUBTRACT;
BXOR(0)	<= B(0) xor SUBTRACT;

--OVERFLOW block
A_MSB 	<= A(3);
B_MSB		<= B(3);
SUM_MSB	<= Sum_Int(3);

--overflow block doesnt work

OVERFLOW <= (( (NOT SUBTRACT) AND (NOT A_MSB) AND (NOT B_MSB) AND (SUM_MSB) ) OR
				 ( (NOT SUBTRACT) AND (A_MSB) AND (B_MSB) AND (NOT SUM_MSB)     ) OR
				 ( (SUBTRACT) AND (NOT A_MSB) AND  (B_MSB) AND (SUM_MSB)        ) OR
				 ( (SUBTRACT) AND (A_MSB) AND (NOT B_MSB) AND (NOT SUM_MSB)     ) 
				);
--output sum
Sum 		<= Sum_Int;

end Structural;

