----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:21 09/27/2015 
-- Design Name: 
-- Module Name:    Debouncer - Behavioral 
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

entity Debouncer is
	port( D 		: in   STD_LOGIC;
			CLK	: in STD_LOGIC;
			Pulse	: in STD_LOGIC;
         Q	 	: out  STD_LOGIC);

end Debouncer;

architecture Behavioral of Debouncer is

signal q_int1 : STD_LOGIC;
signal q_int2 : STD_LOGIC;
signal q_int3 : STD_LOGIC;

begin

Flip1: DFF_CE port map (
	D => D,
	CE => Pulse,
	CLK => CLK,
	Q => q_int1);
	
Flip2: DFF_CE port map (
	D => q_int1,
	CE => Pulse,
	CLK => CLK,
	Q => q_int2);
	
Flip3: DFF_CE port map (
	D => q_int2,
	CE => Pulse,
	CLK => CLK,
	Q => q_int3);

Q <= q_int2 and q_int3;

end Behavioral;

