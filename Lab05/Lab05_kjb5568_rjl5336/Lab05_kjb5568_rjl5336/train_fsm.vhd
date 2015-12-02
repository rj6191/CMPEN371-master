----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:14 10/06/2015 
-- Design Name: 
-- Module Name:    train_fsm - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity train_fsm is
	port(	enable 	: in std_logic;
			clk		: in std_logic;
			reset		: in std_logic;
			LED			: out STD_LOGIC_VECTOR(15 downto 0));
end train_fsm;

architecture Behavioral of train_fsm is
type state_type is (t24,t23,t22,t21,t20,t19,t18,t17,t16,t15,t14,t13,t12,t11,t10,t9,t8,t7,t6,t5,t4,t3,t2,t1,t0);

signal presentstate : state_type;
signal nextstate	  : state_type;

begin
process (clk) is
begin
	if(clk'event and clk = '1') then
		if(reset ='1') then
			presentstate <= t24;
		else 
			presentstate <= nextstate;
		end if;
	end if;
end process;

process(presentstate,enable)
begin
	Case presentstate is
		when t24 =>
			if(enable ='1') then
			nextstate <= t23;
			else
			nextstate <= presentstate;
			end if;
			led <="1000000000000000";
		when t23 =>
			if(enable ='1') then
			nextstate <= t22;
			else
			nextstate <= presentstate;
			end if;
			led <="1100000000000000";
		when t22 =>
			if(enable ='1') then
			nextstate <= t21;
			else
			nextstate <= presentstate;
			end if;
			led <="1110000000000000";
		when t21 =>
			if(enable ='1') then
			nextstate <= t20;
			else
			nextstate <= presentstate;
			end if;
			led <="1111000000000000";
		when t20 =>
			if(enable ='1') then
			nextstate <= t19;
			else
			nextstate <= presentstate;
			end if;
			led <="1111100000000000";
		when t19 =>
			if(enable ='1') then
			nextstate <= t18;
			else
			nextstate <= presentstate;
			end if;
			led <="1111110000000000";
		when t18 =>
			if(enable ='1') then
			nextstate <= t17;
			else
			nextstate <= presentstate;
			end if;
			led <="1111111000000000";
		when t17 =>
			if(enable ='1') then
			nextstate <= t16;
			else
			nextstate <= presentstate;
			end if;
			led <="1111111110000000";
		when t16 =>
			if(enable ='1') then
			nextstate <= t15;
			else
			nextstate <= presentstate;
			end if;
			led <="1111111111000000";
		when t15 =>
			if(enable ='1') then
			nextstate <= t14;
			else
			nextstate <= presentstate;
			end if;
			led <="0111111111100000";
		when t14 =>
			if(enable ='1') then
			nextstate <= t13;
			else
			nextstate <= presentstate;
			end if;
			led <="0011111111110000";
		when t13 =>
			if(enable ='1') then
			nextstate <= t12;
			else
			nextstate <= presentstate;
			end if;
			led <="0001111111111000";
		when t12 =>
			if(enable ='1') then
			nextstate <= t11;
			else
			nextstate <= presentstate;
			end if;
			led <="0000111111111100";
		when t11 =>
			if(enable ='1') then
			nextstate <= t10;
			else
			nextstate <= presentstate;
			end if;
			led <="0000011111111110";
		when t10 =>
			if(enable ='1') then
			nextstate <= t9;
			else
			nextstate <= presentstate;
			end if;
			led <="0000001111111111";
		when t9 =>
			if(enable ='1') then
			nextstate <= t8;
			else
			nextstate <= presentstate;
			end if;
			led <="00000001111111111";
		when t8 =>
			if(enable ='1') then
			nextstate <= t7;
			else
			nextstate <= presentstate;
			end if;
			led <="00000000111111111";
		when t7 =>
			if(enable ='1') then
			nextstate <= t6;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000001111111";
		when t6 =>
			if(enable ='1') then
			nextstate <= t5;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000111111";
		when t5 =>
			if(enable ='1') then
			nextstate <= t4;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000011111";
		when t4 =>
			if(enable ='1') then
			nextstate <= t3;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000001111";
		when t3 =>
			if(enable ='1') then
			nextstate <= t2;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000111";
		when t2 =>
			if(enable ='1') then
			nextstate <= t1;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000011";
		when t1 =>
			if(enable ='1') then
			nextstate <= t0;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000001";
		when t0 =>
			if(enable ='1') then
			nextstate <= t24;
			else
			nextstate <= presentstate;
			end if;
			led <="0000000000000000";
	end case;
end process;


end Behavioral;

