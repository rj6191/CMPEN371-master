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
		Code_Ready		: out std_logic);
end KB_Read_FSM;

architecture Behavioral of KB_Read_FSM is

type state_type is (int,idle,compare,wait1,wait2,load1,inc,Ready,reset);

signal presentstate : state_type;
signal nextstate	  : state_type;
signal count		  : integer :=0;

begin
process (clk) is
begin
	if(clk'event and clk = '1') then
		if(clr ='1') then
			presentstate <= reset;
		else 
			presentstate <= nextstate;
		end if;
	end if;
end process;

process(presentstate, PS2KBD_CLK_in,clr,count)
begin
	Case presentstate is
		when reset =>
			Code_Ready <='0';
			load <='0';
			count <= 0;
			if(CLR = '0') then
				nextState 	<= Idle;
			else
				nextState <= Reset;
			end if;
		when idle => 
			Code_Ready <='0';
			load <='0';
			count <= 0;
			if(PS2KBD_CLK_in='0') then
				nextstate <= compare;
			else 
				nextstate <= presentstate;
			end if;
		when compare =>
			Code_Ready <='0';
			load <='0';
			if(count <9) then
				nextstate <= wait1;
			elsif(not(count < 9)) then
				nextstate <= Ready;
			else
				nextstate <= presentstate;
			end if;
		when wait1 =>
			Code_Ready <='0';
			load <='0';
			if(PS2KBD_CLK_in='1') then
				nextstate <= wait2;
			else 
				nextstate <= presentstate;
			end if;
		when wait2 =>
			Code_Ready <='0';
			load <='0';
			if(PS2KBD_CLK_in = '0') then
				nextstate <= load1;
			else 
				nextstate <= presentstate;
			end if;
		when load1 =>
			Code_Ready <='0';
			load <='1';
			nextstate <= inc;
		when inc =>
			Code_Ready <='0';
			load <='0';
			count <= count + 1;
			nextstate <= compare;
		when Ready =>
			Code_Ready <='1';
			load <='0';
			if(PS2KBD_CLK_in='1') then
			nextstate <= idle;
			else
			nextstate <= presentstate;
			end if;
		when others =>
			Code_Ready <='0';
			load <='0';
			nextstate <= reset;
	end case;
				
end process;


end Behavioral;

