----------------------------------------------------------------------------
-- Entity:        Lab 4 Top Level
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/16/15
-- Description:   Top level for getting aquanited with registers
--
-- Revision History (date, initials, description): 9/16/15, KB RL, Initial Build
-- 
-- Dependencies:
--		kjb5568_rjl5336_compnents.vhd
----------------------------------------------------------------------------
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

entity Shift_Register is
	port ( D : in std_logic;
		load : in std_logic;
		clk: in std_logic;
		q : out std_logic_vector(15 downto 0));
end Shift_Register;

architecture Behavioral of Shift_Register is

signal q_int : std_logic_vector(15 downto 0);

begin

Flip1: DFF_CE port map (
	D => d,
	CE => load,
	CLK => CLK,
	Q => q_int(15));
	
Flip2: DFF_CE port map (
	D => q_int(15),
	CE => load,
	CLK => CLK,
	Q => q_int(14));
	
Flip3: DFF_CE port map (
	D => q_int(14),
	CE => load,
	CLK => CLK,
	Q => q_int(13));
Flip4: DFF_CE port map (
	D => q_int(13),
	CE => load,
	CLK => CLK,
	Q => q_int(12));
Flip5: DFF_CE port map (
	D => q_int(12),
	CE => load,
	CLK => CLK,
	Q => q_int(11));
Flip6: DFF_CE port map (
	D => q_int(11),
	CE => load,
	CLK => CLK,
	Q => q_int(10));
Flip7: DFF_CE port map (
	D => q_int(10),
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

