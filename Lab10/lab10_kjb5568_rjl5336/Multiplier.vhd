----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:10 11/09/2015 
-- Design Name: 
-- Module Name:    Multiplier - Behavioral 
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

entity Multiplier is
Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
       B : in  STD_LOGIC_VECTOR (31 downto 0);
	clear : in std_logic;
	  CLK	: in STD_LOGIC;
 product : out  STD_LOGIC_VECTOR (31 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

signal ones 	 : STD_LOGIC_VECTOR(31 downto 0);
signal ones_reg : STD_LOGIC_VECTOR(31 downto 0);
signal cnt_b1 : STD_LOGIC_VECTOR(3 downto 0);
signal lst_b1	 : STD_logic;

signal tens 	 : STD_LOGIC_VECTOR(31 downto 0);
signal tens_answer 	 : STD_LOGIC_VECTOR(31 downto 0);
signal tens_reg : STD_LOGIC_VECTOR(31 downto 0);
signal cnt_b2 : STD_LOGIC_VECTOR(3 downto 0);
signal lst_b2	 : STD_logic;

signal hund 	 : STD_LOGIC_VECTOR(31 downto 0);
signal hund_answer 	 : STD_LOGIC_VECTOR(31 downto 0);
signal hund_reg : STD_LOGIC_VECTOR(31 downto 0);
signal cnt_b3 : STD_LOGIC_VECTOR(3 downto 0);
signal lst_b3	 : STD_logic;

signal thous	 : STD_LOGIC_VECTOR(31 downto 0);
signal thous_answer 	 : STD_LOGIC_VECTOR(31 downto 0);
signal thous_reg : STD_LOGIC_VECTOR(31 downto 0);
signal cnt_b4 : STD_LOGIC_VECTOR(3 downto 0);
signal lst_b4	 : STD_logic;

signal product_int 	 : STD_LOGIC_VECTOR(31 downto 0);
signal product_int_low 	 : STD_LOGIC_VECTOR(31 downto 0);
signal product_int_high 	 : STD_LOGIC_VECTOR(31 downto 0);

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

begin

Inst_BCD_Adder1: BCD_32bit PORT MAP(
		A => A,
		B => ones_reg,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => ones
	);
ones_register: Reg_nbit generic map (32) PORT MAP (
	d => ones,
	load => lst_b1,
	clk => clk,
	clr => clear,
	q => ones_reg
	);
lst_b1_cmp : LST generic map (4) port map (
	A =>cnt_b1,
	B => B(3 downto 0),
	output => lst_b1
	);
b1_cnt : counter_nbit generic map (4) port map (
	en => lst_b1,
	clk => clk,
	clr => clear,
	q => cnt_b1
	);


	
Inst_BCD_Adder2: BCD_32bit PORT MAP(
		A => A,
		B => tens_reg,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => tens
	);
tens_register: Reg_nbit generic map (32) PORT MAP (
	d => tens,
	load => lst_b2,
	clk => clk,
	clr => clear,
	q => tens_reg
	);
lst_b2_cmp : LST generic map (4) port map (
	A =>cnt_b2,
	B => B(7 downto 4),
	output => lst_b2
	);
b2_cnt : counter_nbit generic map (4) port map (
	en => lst_b2,
	clk => clk,
	clr => clear,
	q => cnt_b2
	);
	
tens_answer <= tens_reg(27 downto 0) & "0000";


Inst_BCD_Adder5: BCD_32bit PORT MAP(
		A => A,
		B => hund_reg,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => hund
	);
hund_register: Reg_nbit generic map (32) PORT MAP (
	d => hund,
	load => lst_b3,
	clk => clk,
	clr => clear,
	q => hund_reg
	);
lst_b3_cmp : LST generic map (4) port map (
	A =>cnt_b3,
	B => B(11 downto 8),
	output => lst_b3
	);
b3_cnt : counter_nbit generic map (4) port map (
	en => lst_b3,
	clk => clk,
	clr => clear,
	q => cnt_b3
	);
	
hund_answer <= hund_reg(23 downto 0) & "00000000";



Inst_BCD_Adder6: BCD_32bit PORT MAP(
		A => A,
		B => thous_reg,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => thous
	);
thous_register: Reg_nbit generic map (32) PORT MAP (
	d => thous,
	load => lst_b4,
	clk => clk,
	clr => clear,
	q => thous_reg
	);
lst_b4_cmp : LST generic map (4) port map (
	A =>cnt_b4,
	B => B(15 downto 12),
	output => lst_b4
	);
b4_cnt : counter_nbit generic map (4) port map (
	en => lst_b4,
	clk => clk,
	clr => clear,
	q => cnt_b4
	);
	
thous_answer <= thous_reg(19 downto 0) & "000000000000";


Inst_BCD_Adder3: BCD_32bit PORT MAP(
		A => ones_reg,
		B => tens_answer,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => product_int_low
	);
	
Inst_BCD_Adder7: BCD_32bit PORT MAP(
		A => thous_answer,
		B => hund_answer,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => product_int_high
	);
	
Inst_BCD_Adder8: BCD_32bit PORT MAP(
		A => product_int_high,
		B => product_int_low,
		sub => '0',
		cbi => '0',
		cbo => open,
		sum => product_int
	);
	
product_register: Reg_nbit generic map (32) PORT MAP (
	d => product_int,
	load => (not lst_b2) and (not lst_b1) and (not lst_b3) and (not lst_b4),
	clk => clk,
	clr => clear,
	q => product
	);

end Behavioral;

