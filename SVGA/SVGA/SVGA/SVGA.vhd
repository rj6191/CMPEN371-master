----------------------------------------------------------------------------
-- Entity:        SVGA
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  10/26/15
-- Description:   SVGA VGA Driver
--
-- Revision History (date, initials, description): 10/26/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library kjb5568_rjl5336_Library;
use     kjb5568_rjl5336_Library.kjb5568_rjl5336_Components.all;

entity SVGA is
    Port ( Switch 	: in  STD_LOGIC_VECTOR (11 downto 0);
			  BUTTON 	: in  STD_LOGIC_VECTOR (4 downto 0);
           Clk 		: in  STD_LOGIC;
           HSYNC 		: out  STD_LOGIC;
           VSYNC 		: out  STD_LOGIC;
           RGB_out 	: out  STD_LOGIC_VECTOR (11 downto 0));
end SVGA;

architecture Behavioral of SVGA is

component SVGA_Control is
    Port ( X_out 		: out  STD_LOGIC_VECTOR (10 downto 0);
           Y_out 		: out  STD_LOGIC_VECTOR (10 downto 0);
           RGB_in 	: in  STD_LOGIC_VECTOR (11 downto 0);
           Clk 		: in  STD_LOGIC;
           HSYNC 		: out  STD_LOGIC;
           VSYNC 		: out  STD_LOGIC;
           RGB_out 	: out  STD_LOGIC_VECTOR (11 downto 0));
end component;

COMPONENT Image_Generator
	PORT(
		Switch 	: IN std_logic_vector(11 downto 0);
		Button 	: IN std_logic_vector(4 downto 0);
		clk 	: in 	STD_LOGIC;
		X_in 		: IN std_logic_vector(10 downto 0);
		Y_in 		: IN std_logic_vector(10 downto 0);          
		RGB_out  : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;
	
signal x : std_logic_vector(10 downto 0);
signal y : std_logic_vector(10 downto 0);
signal RGB : std_logic_vector(11 downto 0);

begin

Inst_SVGA_Control: SVGA_Control PORT MAP(
		X_out => x,
		Y_out => y,
		RGB_in => RGB,
		Clk => CLK,
		HSYNC => HSYNC,
		VSYNC => VSYNC,
		RGB_out => RGB_out
	);
	
Inst_Image_Generator: Image_Generator PORT MAP(
		Switch => Switch,
		Button => button,
		clk => clk,
		X_in => x,
		Y_in => y,
		RGB_out => RGB
	);

end Behavioral;

