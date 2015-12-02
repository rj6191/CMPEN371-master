----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:56 10/12/2015 
-- Design Name: 
-- Module Name:    KB_Read_FSM - Behavioral 
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


entity KB_Read_FSM is
port( PS2KBD_CLK_in 	: in std_logic;
		clr				: in std_logic;
		clk				: in std_logic;
		load				: out std_logic;
		clear				: out std_logic;
		Code_Ready		: out std_logic);
end KB_Read_FSM;

architecture Behavioral of KB_Read_FSM is

type state_type is (idle,compare,wait1,wait2,load1,inc,set);

signal presentstate : state_type;
signal nextstate	  : state_type;
signal count		  : integer :=0;

begin
process (clk) is
begin
	if(clk'event and clk = '1') then
		if(clr ='1') then
			presentstate <= idle;
		else 
			presentstate <= nextstate;
		end if;
	end if;
end process;

process(presentstate, PS2KBD_CLK_in)
begin
	Case presentstate is
		when idle => 
			Code_Ready <='0';
			load <='0';
			clear <='1';
			if(PS2KBD_CLK_in = '1') then
				nextstate <= presentstate;
			elsif(PS2KBD_CLK_in='0') then
				nextstate <= compare;
			else 
				nextstate <= presentstate;
			end if;
		when compare =>
			Code_Ready <='0';
			load <='0';
			clear <='0';
			if(count <9) then
				nextstate <= wait1;
			elsif(not(count < 9)) then
				nextstate <= set;
			else
				nextstate <= presentstate;
			end if;
		when wait1 =>
			Code_Ready <='0';
			load <='0';
			clear <='0';
			if(PS2KBD_CLK_in = '1') then
				nextstate <= presentstate;
			elsif(PS2KBD_CLK_in='0') then
				nextstate <= wait2;
			else 
				nextstate <= presentstate;
			end if;
		when wait2 =>
			Code_Ready <='0';
			load <='0';
			clear <='0';
			if(PS2KBD_CLK_in = '1') then
				nextstate <= load1;
			elsif(PS2KBD_CLK_in='0') then
				nextstate <= wait2;
			else 
				nextstate <= presentstate;
			end if;
		when load1 =>
			Code_Ready <='0';
			load <='1';
			clear <='0';
			nextstate <= inc;
		when inc =>
			Code_Ready <='0';
			load <='0';
			clear <='0';
			count <= count + 1;
			nextstate <= compare;
		when set =>
			Code_Ready <='1';
			load <='0';
			clear <='0';
			count <=0;
			nextstate <= idle;
	end case;
				
end process;


end Behavioral;

