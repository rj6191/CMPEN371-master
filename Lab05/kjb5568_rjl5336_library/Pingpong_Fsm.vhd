----------------------------------------------------------------------------
-- Entity:        Ping Pong FSM
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/30/15
-- Description:   FSM for controlling the ping pong state
--
-- Revision History (date, initials, description): 9/30/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pingpong_Fsm is
	port(	enable 	: in std_logic;
			clk		: in std_logic;
			clr		: in std_logic;
			LED		: out STD_LOGIC_VECTOR(15 downto 0));
end Pingpong_Fsm;

architecture Behavioral of Pingpong_Fsm is

type state_type is (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,init,comp,start);

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
			led <="1000000000000000";
		when init =>
			if(enable ='1') then
			r<='1';
			nextstate <= p15;
			else
			nextstate <= presentstate;
			end if;
			led <="1000000000000000";
		when p15 =>
			if(enable ='1' and r='0') then
			nextstate <= init;
			r<='1';
			elsif (r='1' and enable ='1') then
				nextstate <= p14;
			else
			nextstate <= presentstate;
			end if;
			led <="1000000000000000";
		when p14 =>
			if(r='0' and enable ='1') then
				nextstate <= p15;
			elsif (r='1' and enable ='1') then
				nextstate <= p13;
			else
			nextstate <= presentstate;
			end if;
			led <="0100000000000000";
		when p13 =>
			if(r='0' and enable ='1') then
				nextstate <= p14;
			elsif (r='1' and enable ='1') then
				nextstate <= p12;
			else
			nextstate <= presentstate;
			end if;
			led <="0010000000000000";
		when p12 =>
			if(r='0' and enable ='1') then
				nextstate <= p13;
			elsif (r='1' and enable ='1') then
				nextstate <= p11;
			else
			nextstate <= presentstate;
			end if;
			led <="0001000000000000";
		when p11 =>
			if(r='0' and enable ='1') then
				nextstate <= p12;
			elsif (r='1' and enable ='1') then
				nextstate <= p10;
			else
			nextstate <= presentstate;
			end if;
			led <="0000100000000000";
		when p10 =>
			if(r='0' and enable ='1') then
				nextstate <= p11;
			elsif (r='1' and enable ='1') then
				nextstate <= p9;
			else
			nextstate <= presentstate;
			end if;
			led <="0000010000000000";
		when p9 =>
			if(r='0' and enable ='1') then
				nextstate <= p10;
			elsif (r='1' and enable ='1') then
				nextstate <= p8;
			else
			nextstate <= presentstate;
			end if;
			led <="0000001000000000";
		when p8 =>
			if(r='0' and enable ='1') then
				nextstate <= p9;
			elsif (r='1' and enable ='1') then
				nextstate <= p7;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000100000000";
		when p7 =>
			if(r='0' and enable ='1') then
				nextstate <= p8;
			elsif (r='1' and enable ='1') then
				nextstate <= p6;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000010000000";
		when p6 =>
			if(r='0' and enable ='1') then
				nextstate <= p7;
			elsif (r='1' and enable ='1') then
				nextstate <= p5;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000001000000";
		when p5 =>
			if(r='0' and enable ='1') then
				nextstate <= p6;
			elsif (r='1' and enable ='1') then
				nextstate <= p4;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000100000";
		when p4 =>
			if(r='0' and enable ='1') then
				nextstate <= p5;
			elsif (r='1' and enable ='1') then
				nextstate <= p3;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000010000";
		when p3 =>
			if(r='0' and enable ='1') then
				nextstate <= p4;
			elsif (r='1' and enable ='1') then
				nextstate <= p2;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000001000";
		when p2 =>
			if(r='0' and enable ='1') then
				nextstate <= p3;
			elsif (r='1' and enable ='1') then
				nextstate <= p1;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000100";
		when p1 =>
			if(r='0' and enable ='1') then
				nextstate <= p2;
			elsif (r='1' and enable ='1') then
				nextstate <= comp;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000010";
		when p0 =>
			if(r='0' and enable ='1') then
				nextstate <= p1;
			elsif (r='1' and enable ='1') then
				nextstate <= comp;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000001";
		when comp =>
			if(enable = '1') then
			nextstate <= p1;
			r<= '0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000001";
		when others =>
			if(enable ='1') then
			nextstate <= p15;
			r<='1';
			else 
			nextstate <= presentstate;
			end if;
	end case;
end process;


end Behavioral;

