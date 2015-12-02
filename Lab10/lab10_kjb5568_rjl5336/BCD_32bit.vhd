----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:38:59 11/09/2015 
-- Design Name: 
-- Module Name:    BCD_32bit - Behavioral 
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

entity BCD_32bit is
Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
       B : in  STD_LOGIC_VECTOR (31 downto 0);
       sub : in  STD_LOGIC;
       cbi : in  STD_LOGIC;
       cbo : out  STD_LOGIC;
       sum : out  STD_LOGIC_VECTOR (31 downto 0));
end BCD_32bit;

architecture Behavioral of BCD_32bit is

COMPONENT BCD_Adder
	PORT(
		A : IN std_logic_vector(15 downto 0);
		B : IN std_logic_vector(15 downto 0);
		sub : IN std_logic;
		cbi : IN std_logic;          
		cbo : OUT std_logic;
		sum : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
signal cb_1 : std_logic;

begin

Inst_BCD_Adder1: BCD_Adder PORT MAP(
		A => A(15 downto 0),
		B => B(15 downto 0),
		sub => sub,
		cbi => cbi,
		cbo => cb_1,
		sum => Sum(15 downto 0)
	);
	
Inst_BCD_Adder2: BCD_Adder PORT MAP(
		A => A(31 downto 16),
		B => B(31 downto 16),
		sub => sub,
		cbi => cb_1,
		cbo => cbo,
		sum => Sum(31 downto 16)
	);end Behavioral;

