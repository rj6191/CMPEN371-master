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

type state_type is (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,init,comp,start);

signal presentstate : state_type;
signal nextstate	  : state_type;
signal r : std_logic := '0';

begin
process (clk) is
begin
	if(clk'event and clk = '1') then
		if(clr ='1') then
			presentstate <= start;
		else 
			presentstate <= nextstate;
		end if;
	end if;
end process;

process(presentstate,r,enable)
begin
	Case presentstate is
		when start =>
			if(enable ='1') then
			r<='1';
			nextstate <= init;
			else
			nextstate <= presentstate;
			end if;
			led <="1000011111100000";
		when init =>
			if(enable ='1') then
			r<='1';
			nextstate <= p9;
			else
			nextstate <= presentstate;
			end if;
			led <="1000011111100000";
		when p9 =>
			if(enable ='1' and r='0') then
			nextstate <= init;
			r<='1';
			elsif (r='1' and enable ='1') then
				nextstate <= p8;
			else
			nextstate <= presentstate;
			end if;
			led <="1000011111100000";
		when p8 =>
			if(r='0' and enable ='1') then
				nextstate <= p9;
			elsif (r='1' and enable ='1') then
				nextstate <= p7;
			else
			nextstate <= presentstate;
			end if;
			led <="0100011111100000";
		when p7 =>
			if(r='0' and enable ='1') then
				nextstate <= p8;
			elsif (r='1' and enable ='1') then
				nextstate <= p6;
			else
			nextstate <= presentstate;
			end if;
			led <="0010011111100000";
		when p6 =>
			if(r='0' and enable ='1') then
				nextstate <= p7;
			elsif (r='1' and enable ='1') then
				nextstate <= p5;
			else
			nextstate <= presentstate;
			end if;
			led <="0001011111100000";
		when p5 =>
			if(r='0' and enable ='1') then
				nextstate <= p6;
			elsif (r='1' and enable ='1') then
				nextstate <= p4;
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111100000";
		when p4 =>
			if(r='0' and enable ='1') then
				nextstate <= p5;
			elsif (r='1' and enable ='1') then
				nextstate <= p3;
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111010000";
		when p3 =>
			if(r='0' and enable ='1') then
				nextstate <= p4;
			elsif (r='1' and enable ='1') then
				nextstate <= p2;
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111001000";
		when p2 =>
			if(r='0' and enable ='1') then
				nextstate <= p3;
			elsif (r='1' and enable ='1') then
				nextstate <= p1;
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111000100";
		when p1 =>
			if(r='0' and enable ='1') then
				nextstate <= p2;
			elsif (r='1' and enable ='1') then
				nextstate <= p0;
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111000010";
		when p0 =>
			if(r='0' and enable ='1') then
				nextstate <= p1;
			elsif (r='1' and enable ='1') then
				nextstate <= comp;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111000001";
		when comp =>
			if(enable = '1') then
			nextstate <= p0;
			r<= '0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111000001";

	end case;
end process;


end Behavioral;

