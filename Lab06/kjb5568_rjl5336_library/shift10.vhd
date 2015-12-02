----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:14:36 10/13/2015 
-- Design Name: 
-- Module Name:    shift10 - Behavioral 
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
library kjb5568_rjl5336_library;
use kjb5568_rjl5336_library.kjb5568_rjl5336_components.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift10 is
	port ( D : in std_logic;
		load : in std_logic;
		clk: in std_logic;
		q : out std_logic_vector(9 downto 0));
end shift10;

architecture Behavioral of shift10 is
signal q_int : std_logic_vector(9 downto 0);
begin
Flip7: DFF_CE port map (
	D => d,
	CE => load,
	CLK => CLK,
	Q => q_int(9));
Flip8: DFF_CE port map (
	D => q_int(9),
	CE => load,
	CLK => CLK,
	Q => q_int(8));
Flip9: DFF_CE port map (
	D => q_int(8),
	CE => load,
	CLK => CLK,
	Q => q_int(7));
Flip10: DFF_CE port map (
	D => q_int(7),
	CE => load,
	CLK => CLK,
	Q => q_int(6));
	
Flip11: DFF_CE port map (
	D => q_int(6),
	CE => load,
	CLK => CLK,
	Q => q_int(5));
	
Flip12: DFF_CE port map (
	D => q_int(5),
	CE => load,
	CLK => CLK,
	Q => q_int(4));
Flip13: DFF_CE port map (
	D => q_int(4),
	CE => load,
	CLK => CLK,
	Q => q_int(3));
	
Flip14: DFF_CE port map (
	D => q_int(3),
	CE => load,
	CLK => CLK,
	Q => q_int(2));
	
Flip15: DFF_CE port map (
	D => q_int(2),
	CE => load,
	CLK => CLK,
	Q => q_int(1));
Flip16: DFF_CE port map (
	D => q_int(1),
	CE => load,
	CLK => CLK,
	Q => q_int(0));
	
Q <= q_int;


end Behavioral;

