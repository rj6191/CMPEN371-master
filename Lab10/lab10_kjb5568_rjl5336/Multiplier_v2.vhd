----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:57:02 11/09/2015 
-- Design Name: 
-- Module Name:    Multiplier_v2 - Behavioral 
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

entity Multiplier_v2 is
Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
       B : in  STD_LOGIC_VECTOR (31 downto 0);
	  CLK	: in STD_LOGIC;
	  clr	: in STD_Logic;
	start_count: in Std_logic;  
 product : out  STD_LOGIC_VECTOR (31 downto 0));
end Multiplier_v2;

architecture Behavioral of Multiplier_v2 is
COMPONENT BCD_32bit
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		sub : IN std_logic;
		cbi : IN std_logic;          
		cbo : OUT std_logic;
		sum : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
signal running_total : STD_LOGIC_VECTOR(31 downto 0);
signal sum : STD_LOGIC_VECTOR(31 downto 0);
signal cnt_b1 : STD_LOGIC_VECTOR(31 downto 0);
signal lsteq_b : std_logic;
signal not_lsteq_b : std_logic;

begin

Inst_BCD_Adder1: BCD_32bit PORT MAP(
		A => A,
		B => running_total,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => sum
		);
hold_running : Reg_nbit generic map (32) port map (
	d => sum,
	load => lsteq_b,
	clk => clk,
	clr => '0',
	q => running_total
	);
less_than_b : LSTEQ generic map (32) port map (
	A =>cnt_b1,
	B => B,
	output => lsteq_b
	);
b1_cnt : counter_nbit generic map (32) port map (
	en => start_count and lsteq_b,
	clk => clk,
	clr => clr,
	q => cnt_b1
	);
not_lsteq_b <= not lsteq_b;
final_answer: Reg_nbit generic map (32) port map (
	d => running_total,
	load => not_lsteq_b,
	clk => clk,
	clr => '0',
	q => product
	);

end Behavioral;

