----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:59:54 11/28/2015 
-- Design Name: 
-- Module Name:    CircleROM - Behavioral 
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
use ieee.numeric_std.ALL;

entity CircleROM is
	port(	ADDRESS	:	in std_logic_vector(8 downto 0);
			CLK		:	in std_logic;
			DATA_OUT	:	out std_logic_vector(11 downto 0)
	);
end CircleROM;

architecture Behavioral of CircleROM is
	type ROM_TYPE is ARRAY(0 to 511) of std_logic_vector(11 downto 0);
	constant ROM : ROM_TYPE := (


						-- first row
		x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", 
						-- second row
		x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", 
						-- third row
		x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", 
						-- forth row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- fifth row
		x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- sixth row
		x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", 
						-- seventh row
		x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", 
						-- eigth row
		x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", 
						-- nineth row
		x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", 
						-- tenth row
		x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", 
						-- eleventh row
		x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", 
						-- twelth row
		x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"fff", x"fff", x"000", x"000", x"000", 
						-- thirteenth row
		x"000", x"000", x"000", x"000", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"000", x"000", x"000", 
						--14th row
		x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"fff", x"000", x"000", x"fff", x"fff", x"000", x"000", x"000", x"000", 
						-- 15th row
		x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", 
						-- 16th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- 17th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- 18th row
		x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", 
						-- 19th row
		x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", 
						-- 20th row
		x"fff", x"fff", x"fff", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"fff", x"fff", x"fff", 
						-- 21th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- 22th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- 23th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- 24th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- 25th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", 
						-- 26th row
		x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000", x"000"
	);		

begin
	
	process(CLK) is
		begin
			if(CLK'event and CLK = '1') then
				DATA_OUT <= ROM(to_integer(unsigned(ADDRESS)));
			end if;
	end process;

end Behavioral;

