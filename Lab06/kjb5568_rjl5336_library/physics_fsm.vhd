----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:03:15 10/07/2015 
-- Design Name: 
-- Module Name:    physics_fsm - Behavioral 
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

entity physics_fsm is
	Port (enable 	: in std_logic;
			clk		: in std_logic;
			clr		: in std_logic;
			LED		: out STD_LOGIC_VECTOR(15 downto 0));
end physics_fsm;

architecture Behavioral of physics_fsm is

type state_type is (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,init,comp,start);

signal presentstate : state_type;
signal nextstate	  : state_type;
signal r : std_logic := '0';

begin
process (clk, enable) is
begin
	if(clk'event and clk = '1' and enable ='1') then
		if(clr ='1') then
			presentstate <= start;
		else 
			presentstate <= nextstate;
		end if;
	end if;
end process;

process(presentstate,r)
begin
	Case presentstate is
		when start =>
			nextstate <= p17;
			led <="1000011111100000";
		when p17 =>
			nextstate <= p16;
			led <="1000011111100000";
		when p16 =>
			nextstate <= p15;
			led <="0100011111100000";
		when p15 =>
			nextstate <= p14;
			led <="0010011111100000";
		when p14 =>
			nextstate <= p13;
			led <="0001011111100000";
		when p13 =>
			nextstate <= p12;
			led <="0000111111100000";
		when p12 =>
			nextstate <= p11;
			led <="0000111111010000";
		when p11 =>
			nextstate <= p10;
			led <="0000111111001000";
		when p10 =>
			nextstate <= p9;
			led <="0000111111000100";
		when p9 =>
			nextstate <= p8;
			led <="0000111111000010";
		when p8 =>
			nextstate <= p7;
			led <="0000111111000001";
		when p7 =>
			nextstate <= p6;
			led <="0000111111000010";
		when p6 =>
			nextstate <= p5;
			led <="0000111111000100";
		when p5 =>
			nextstate <= p4;
			led <="0000111111001000";
		when p4 =>
			nextstate <= p3;
			led <="0000111111010000";
		when p3 =>
			nextstate <= p2;
			led <="0000111111100000";
		when p2 =>
			nextstate <= p1;
			led <="0001011111100000";
		when p1 =>
			nextstate <= p0;
			led <="0010011111100000";
		when p0 =>
			nextstate <= p17;  -- go to beginning
			led <="0100011111100000";
		when others =>
			nextstate <=p17;
			led <="1000011111100000";
			


	end case;
end process;


end Behavioral;

