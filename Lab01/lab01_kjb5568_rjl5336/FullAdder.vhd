----------------------------------------------------------------------------
-- Entity:        Full Adder
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/26/15
-- Description:   Full Adder
--
-- Revision History (date, initials, description): 8/26/15, KB RL, Initial Build
-- 
-- Dependencies:
--		<List entities, one per line.  Type (none) if none are required.>
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
end FullAdder;

architecture Dataflow of FullAdder is
 signal wire1 : STD_LOGIC;
 signal wire2 : STD_LOGIC;
 signal wire3 : STD_LOGIC;

begin
 wire1 <= A and B;
 wire2 <= A xor B;
 wire3 <= C_in and wire2;
 Sum <= wire2 xor C_in;
 C_out <= wire1 or wire3;
end Dataflow;

