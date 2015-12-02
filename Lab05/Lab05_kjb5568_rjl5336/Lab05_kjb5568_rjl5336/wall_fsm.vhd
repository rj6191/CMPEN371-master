----------------------------------------------------------------------------
-- Entity:        wall FSM
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/30/15
-- Description:   FSM for controlling the wall state
--
-- Revision History (date, initials, description): 9/30/15, KB RL, Initial Build
-- not completely functionally, only is able to be trapped on the one side when it is trapped from the left.
--
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wall_fsm is
	port(	enable 	: in std_logic;
			clk		: in std_logic;
			clr		: in std_logic;
			Switch	: in STD_LOGIC_VECTOR(15 downto 0);
			LED		: out STD_LOGIC_VECTOR(15 downto 0));
end wall_fsm;

architecture Behavioral of wall_fsm is

type state_type is (p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,init,comp,start);

signal presentstate : state_type;
signal nextstate	  : state_type;
signal r : std_logic := '0';

begin
process (clk,enable) is
begin
	if(clk'event and clk = '1' and enable='1') then
		if(clr ='1') then
			presentstate <= start;
		else 
			presentstate <= nextstate;
		end if;
	end if;
end process;

process(presentstate,r,enable,switch)
begin
	Case presentstate is
		when start =>
			r<='1';
			nextstate <= init;
			led <="1000000000000000";
		when init =>
			r<='1';
			nextstate <= p15;
			led <="1000000000000000";
		when p15 =>
			if(r='0') then
			nextstate <= init;
			r<='1';
			elsif (r='1' ) then
				nextstate <= p14;
			else
			nextstate <= presentstate;
			end if;
			led <="1000000000000000";
		when p14 =>
			if(r='0' and switch(15)='0') then
				nextstate <= p15;
			elsif(r='0' and switch(15)='1') then
				nextstate <= p13;
				r<='1';
			elsif (r='1' and switch(13)='0') then
				nextstate <= p13;
			elsif (r='1' and switch(13)='1') then
				nextstate <= p15;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0100000000000000";
		when p13 =>
			if(r='0' and switch(14)='0') then
				nextstate <= p14;
			elsif(r='0' and switch(14)='1') then
				nextstate <= p12;
				r<='1';
			elsif (r='1' and switch(12)='0') then
				nextstate <= p12;
			elsif (r='1' and switch(12)='1') then
				nextstate <= p14;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0010000000000000";
		when p12 =>
			if(r='0' and switch(13)='0') then
				nextstate <= p13;
			elsif(r='0' and switch(13)='1') then
				nextstate <= p11;
				r<='1';
			elsif (r='1' and switch(11)='0') then
				nextstate <= p11;
			elsif (r='1' and switch(11)='1') then
				nextstate <= p13;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0001000000000000";
		when p11 =>
			if(r='0' and switch(12)='0') then
				nextstate <= p12;
			elsif(r='0' and switch(12)='1') then
				nextstate <= p10;
				r<='1';
			elsif (r='1' and switch(10)='0') then
				nextstate <= p10;
			elsif (r='1' and switch(10)='1') then
				nextstate <= p12;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000100000000000";
		when p10 =>
			if(r='0' and switch(11)='0') then
				nextstate <= p11;
			elsif(r='0' and switch(11)='1') then
				nextstate <= p9;
				r<='1';
			elsif (r='1' and switch(9)='0') then
				nextstate <= p9;
			elsif (r='1' and switch(9)='1') then
				nextstate <= p11;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000010000000000";
		when p9 =>
			if(r='0' and switch(10)='0') then
				nextstate <= p10;
			elsif(r='0' and switch(10)='1') then
				nextstate <= p8;
				r<='1';
			elsif (r='1' and switch(8)='0') then
				nextstate <= p8;
			elsif (r='1' and switch(8)='1') then
				nextstate <= p10;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000001000000000";
		when p8 =>
			if(r='0' and switch(9)='0') then
				nextstate <= p9;
			elsif(r='0' and switch(9)='1') then
				nextstate <= p7;
				r<='1';
			elsif (r='1' and switch(7)='0') then
				nextstate <= p7;
			elsif (r='1' and switch(7)='1') then
				nextstate <= p9;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000100000000";
		when p7 =>
			if(r='0' and switch(8)='0') then
				nextstate <= p8;
			elsif(r='0' and switch(8)='1') then
				nextstate <= p6;
				r<='1';
			elsif (r='1' and switch(6)='0') then
				nextstate <= p6;
			elsif (r='1' and switch(6)='1') then
				nextstate <= p8;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000010000000";
		when p6 =>
			if(r='0' and switch(7)='0') then
				nextstate <= p7;
			elsif(r='0' and switch(7)='1') then
				nextstate <= p5;
				r<='1';
			elsif (r='1' and switch(5)='0') then
				nextstate <= p5;
			elsif (r='1' and switch(5)='1') then
				nextstate <= p7;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000001000000";
		when p5 =>
			if(r='0' and switch(6)='0') then
				nextstate <= p6;
			elsif(r='0' and switch(6)='1') then
				nextstate <= p4;
				r<='1';
			elsif (r='1' and switch(4)='0') then
				nextstate <= p4;
			elsif (r='1' and switch(4)='1') then
				nextstate <= p6;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000100000";
		when p4 =>
			if(r='0' and switch(5)='0') then
				nextstate <= p5;
			elsif(r='0' and switch(5)='1') then
				nextstate <= p3;
				r<='1';
			elsif (r='1' and switch(3)='0') then
				nextstate <= p3;
			elsif (r='1' and switch(3)='1') then
				nextstate <= p5;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000010000";
		when p3 =>
			if(r='0' and switch(4)='0') then
				nextstate <= p4;
			elsif(r='0' and switch(4)='1') then
				nextstate <= p2;
				r<='1';
			elsif (r='1' and switch(2)='0') then
				nextstate <= p2;
			elsif (r='1' and switch(2)='1') then
				nextstate <= p4;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000001000";
		when p2 =>
			if(r='0' and switch(3)='0') then
				nextstate <= p3;
			elsif(r='0' and switch(3)='1') then
				nextstate <= p1;
				r<='1';
			elsif (r='1' and switch(1)='0') then
				nextstate <= p1;
			elsif (r='1' and switch(1)='1') then
				nextstate <= p3;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000100";
		when p1 =>
			if(r='0' and switch(2)='0') then
				nextstate <= p2;
			elsif(r='0' and switch(2)='1') then
				nextstate <= p0;
				r<='1';
			elsif (r='1' and switch(0)='0') then
				nextstate <= p0;
			elsif (r='1' and switch(0)='1') then
				nextstate <= p2;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000010";
		when p0 =>
			if(r='0' ) then
				nextstate <= p1;
			elsif (r='1' ) then
				nextstate <= comp;
				r<='0';
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000001";
		when comp =>
			nextstate <= p0;
			r<= '0';
			led <="0000000000000001";
		when others =>
			nextstate <= p15;
			r<='1';
	end case;
end process;


end Behavioral;

