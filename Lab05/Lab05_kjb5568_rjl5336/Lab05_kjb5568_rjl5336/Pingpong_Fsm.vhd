----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:24 10/04/2015 
-- Design Name: 
-- Module Name:    Pingpong_Fsm - Behavioral 
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


entity Pingpong_Fsm is
	port(	pulse 	: in std_logic;
			reset		: in std_logic;
			LED			: out STD_LOGIC_VECTOR(15 downto 0));
end Pingpong_Fsm;

architecture Behavioral of Pingpong_Fsm is

type state_type is (start,p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15);

signal presentstate : state_type;
signal nextstate	  : state_type;
signal l : std_logic;
signal r : std_logic;

begin
process (pulse) is
begin
	if(pulse'event and pulse = '1') then
		if(reset ='1') then
			presentstate <= start;
		else 
			presentstate <= nextstate;
		end if;
	end if;
end process;

process(presentstate)
begin
	Case presentstate is
		when start => 
			l<='0';
			r<='1';
			nextstate <= p15;
		when p15 =>
			l<='0';
			r<='1';
			nextstate <= p14;
			led <="1000000000000000";
		when p14 =>
			if(l='1') then
				nextstate <= p15;
			elsif (r='1') then
				nextstate <= p13;
			end if;
			led <="0100000000000000";
		when p13 =>
			if(l='1') then
				nextstate <= p14;
			elsif (r='1') then
				nextstate <= p12;
			end if;
			led <="0010000000000000";
		when p12 =>
			if(l='1') then
				nextstate <= p13;
			elsif (r='1') then
				nextstate <= p11;
			end if;
			led <="0001000000000000";
		when p11 =>
			if(l='1') then
				nextstate <= p12;
			elsif (r='1') then
				nextstate <= p10;
			end if;
			led <="0001000000000000";
		when p10 =>
			if(l='1') then
				nextstate <= p11;
			elsif (r='1') then
				nextstate <= p9;
			end if;
			led <="0000010000000000";
		when p9 =>
			if(l='1') then
				nextstate <= p10;
			elsif (r='1') then
				nextstate <= p8;
			end if;
			led <="0000001000000000";
		when p8 =>
			if(l='1') then
				nextstate <= p9;
			elsif (r='1') then
				nextstate <= p7;
			end if;
			led <="0000000100000000";
		when p7 =>
			if(l='1') then
				nextstate <= p8;
			elsif (r='1') then
				nextstate <= p6;
			end if;
			led <="0000000010000000";
		when p6 =>
			if(l='1') then
				nextstate <= p7;
			elsif (r='1') then
				nextstate <= p5;
			end if;
			led <="0000000001000000";
		when p5 =>
			if(l='1') then
				nextstate <= p6;
			elsif (r='1') then
				nextstate <= p4;
			end if;
			led <="0000000000100000";
		when p4 =>
			if(l='1') then
				nextstate <= p5;
			elsif (r='1') then
				nextstate <= p3;
			end if;
			led <="0000000000010000";
		when p3 =>
			if(l='1') then
				nextstate <= p4;
			elsif (r='1') then
				nextstate <= p2;
			end if;
			led <="0000000000001000";
		when p2 =>
			if(l='1') then
				nextstate <= p3;
			elsif (r='1') then
				nextstate <= p1;
			end if;
			led <="0000000000000100";
		when p1 =>
			if(l='1') then
				nextstate <= p2;
			elsif (r='1') then
				nextstate <= p0;
			end if;
			led <="0000000000000010";
		when p0 =>
			l<='1';
			r<='0';
			nextstate <= p1;
			led <="0000000000000001";	
	end case;
end process;


end Behavioral;

