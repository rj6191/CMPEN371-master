----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:12 09/27/2015 
-- Design Name: 
-- Module Name:    OneShot - Behavioral 
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

entity OneShot is
	port( D 		: in   STD_LOGIC;
			CLK	: in STD_LOGIC;
         Q	 	: out  STD_LOGIC);
end OneShot;

architecture Behavioral of OneShot is

signal q_int : STD_LOGIC;

begin

Flip: DFF port map (
	D => D,
	CLK => CLK,
	Q =>qint);

Q <= (not q_int) and D;


end Behavioral;

