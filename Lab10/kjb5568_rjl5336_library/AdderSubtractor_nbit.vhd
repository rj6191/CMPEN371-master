----------------------------------------------------------------------------
-- Entity:        AdderSubtractor_nbit
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/27/15
-- Description:   AdderSubtractor_4bit top level
--
-- Revision History (date, initials, description): 8/27/15, KB RL, Initial Build
--                                                 9/10/15, KB RL, Converted the file to become a n bit adder to make it more reusable
-- 
-- Dependencies:
--		<List entities, one per line.  Type (none) if none are required.>
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity AdderSubtractor_nbit is
	generic (n: integer :=4);
    Port ( A        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           SUBTRACT : in  STD_LOGIC;
           OVERFLOW : out STD_LOGIC;
           SUM      : out STD_LOGIC_VECTOR (n-1 downto 0));
end AdderSubtractor_nbit;

architecture Structural of AdderSubtractor_nbit is

	
component Ripple_Carry_Adder is
			generic (n: integer :=4);
		 Port ( A 		: in  STD_LOGIC_VECTOR (n-1 downto 0);
				  B 		: in  STD_LOGIC_VECTOR (n-1 downto 0);
				  C_in 	: in  STD_LOGIC;
				  C_out 	: out  STD_LOGIC;
				  SUM 	: out  STD_LOGIC_VECTOR (n-1 downto 0));
	end component;

--internal signals
signal BXOR 	     : STD_LOGIC_VECTOR (n-1 downto 0);  --wires to send otuput from InvertOrPass to the Ripple Carry Adder
signal Sum_Int      : STD_LOGIC_VECTOR (n-1 downto 0);  --wires to send otuput from the Ripple Carry Adder to OverflowDetect and out to the 4bit SUM
signal A_MSB        : STD_LOGIC ;							--internal signal of A(3) in the OverflowDetector
signal B_MSB        : STD_LOGIC ; 							--internal signal of B(3) in the OverflowDetector
signal SUM_MSB   	  : STD_LOGIC ; 							--internal signal of Sum_Int(3) in the OverflowDetector



begin


RCA: Ripple_Carry_Adder generic map (n) port map (
	A => A,
	B => BXOR,
	C_in=> SUBTRACT,
	C_out => open,
	SUM => Sum_Int
	);

	--generate xors; n bit inver or pass
	genXORS: for i in 0 to n-1 generate
	begin
		BXOR(i) <= B(i) xor SUBTRACT;
	end generate;





--OVERFLOW block
A_MSB <= A(n-1);
B_MSB <= B(n-1);
SUM_MSB <= Sum_Int(n-1);


OVERFLOW <= (( (NOT SUBTRACT) AND (NOT A_MSB) AND (NOT B_MSB) AND (SUM_MSB) ) OR
				 ( (NOT SUBTRACT) AND (A_MSB) AND (B_MSB) AND (NOT SUM_MSB)     ) OR
				 ( (SUBTRACT) AND (NOT A_MSB) AND  (B_MSB) AND (SUM_MSB)        ) OR
				 ( (SUBTRACT) AND (A_MSB) AND (NOT B_MSB) AND (NOT SUM_MSB)     ) 
				);
--output sum
Sum <= Sum_Int;

end Structural;

