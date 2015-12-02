----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:15 11/07/2015 
-- Design Name: 
-- Module Name:    BCD_Adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;

entity BCD_Adder is
Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
       B : in  STD_LOGIC_VECTOR (15 downto 0);
       sub : in  STD_LOGIC;
       cbi : in  STD_LOGIC;
       cbo : out  STD_LOGIC;
       sum : out  STD_LOGIC_VECTOR (15 downto 0));
end BCD_Adder;

architecture Behavioral of BCD_Adder is
signal cb_1 : STD_LOGIC;
signal cb_2 : STD_LOGIC;
signal cb_3 : STD_LOGIC;

COMPONENT BCD_Adder_slice
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		sub : IN std_logic;
		cbi : IN std_logic;          
		cbo : OUT std_logic;
		sum : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;


begin

Inst_BCD_Adder1: BCD_Adder_slice PORT MAP(
		A => A(3 downto 0),
		B => B(3 downto 0),
		sub => sub,
		cbi => cbi,
		cbo => cb_1,
		sum => Sum(3 downto 0)
	);

Inst_BCD_Adder2: BCD_Adder_slice PORT MAP(
		A => A(7 downto 4),
		B => B(7 downto 4),
		sub => sub,
		cbi => cb_1,
		cbo => cb_2,
		sum => Sum(7 downto 4)
	);
	
Inst_BCD_Adder3: BCD_Adder_slice PORT MAP(
		A => A(11 downto 8),
		B => B(11 downto 8),
		sub => sub,
		cbi => cb_2,
		cbo => cb_3,
		sum => Sum(11 downto 8)
	);
	
Inst_BCD_Adder4: BCD_Adder_slice PORT MAP(
		A => A(15 downto 12),
		B => B(15 downto 12),
		sub => sub,
		cbi => cb_3,
		cbo => cbo,
		sum => Sum(15 downto 12) 
	);


end Behavioral;

