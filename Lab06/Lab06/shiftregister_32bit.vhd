----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:50:52 10/13/2015 
-- Design Name: 
-- Module Name:    shiftregister_32bit - Behavioral 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftregister_32bit is
port ( D 	: in std_logic_vector(7 downto 0);
		q		: in std_logic_vector(31 downto 0);
		load	: in std_logic;
		clk	: in std_logic;
		word_out		: out std_logic_vector(31 downto 0));
end shiftregister_32bit;

architecture Behavioral of shiftregister_32bit is

begin

process(clk)
begin
	if(clk'event and clk = '1') then
		if (load = '1') then
		word_out <= D and q(31 downto 8);
		else
		word_out <= q;
		end if;
	end if;
end process;



end Behavioral;

