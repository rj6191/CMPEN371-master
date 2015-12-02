----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:13 11/09/2015 
-- Design Name: 
-- Module Name:    LSTEQ - Behavioral 
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

entity LSTEQ is
	generic (n: integer :=4);
    Port ( A        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           OUTPUT   : out STD_LOGIC);
end LSTEQ;

architecture structural of LSTEQ is

begin

OUTPUT <= '1' when (A< B) else
			 '1' when (A=B) else
			 '0';


end structural;


