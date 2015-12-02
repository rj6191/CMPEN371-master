----------------------------------------------------------------------------
-- Entity:        VGA Control
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  10/26/15
-- Description:   Controls the VGA position and scans through the entire screen.
--
-- Revision History (date, initials, description): 10/26/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_STD.ALL; 
library kjb5568_rjl5336_Library;
use     kjb5568_rjl5336_Library.kjb5568_rjl5336_Components.all;

entity VGA_Control is
    Port ( X_out 		: out  STD_LOGIC_VECTOR (9 downto 0);
           Y_out 		: out  STD_LOGIC_VECTOR (9 downto 0);
           RGB_in 	: in  STD_LOGIC_VECTOR (11 downto 0);
           Clk 		: in  STD_LOGIC;
           HSYNC 		: out  STD_LOGIC;
           VSYNC 		: out  STD_LOGIC;
           RGB_out 	: out  STD_LOGIC_VECTOR (11 downto 0));
end VGA_Control;

architecture Behavioral of VGA_Control is


signal pixelCLK : std_logic;
signal RollH	 : std_logic;
signal RollV	 : std_logic;
signal Vcount_clear	 : std_logic;
signal Hcount_clear	 : std_logic;
signal Vcount_en	 : std_logic;
signal holdActive	 : std_logic;
signal DholdH	 : std_logic;
signal DholdV	 : std_logic;
signal HActive	 : std_logic;
signal VActive	 : std_logic;
signal H_lt_656 : std_logic;
signal V_lt_490 : std_logic;
signal V_gt_491 : std_logic;
signal H_gt_751 : std_logic;
signal RGB_enable_Reg		 : std_logic;
signal X_out_int : STD_LOGIC_VECTOR (9 downto 0);
signal y_out_int : STD_LOGIC_VECTOR (9 downto 0);

begin




Pulse25 : Pulse_Gen generic map (2, 3) port map (
		EN    => '1',
		CLK   => CLK,
		CLR   => '0',
		PULSE => pixelCLK );
		
		
------------------------------------------------------------------
Hcount_clear <= '1' when ( pixelCLK = '1' and RollH = '1') else '0';
--horizontal
		
Hcount : Counter_nbit generic map (10) port map (
		EN    => pixelCLK,
		CLK   => CLK,
		CLR   => Hcount_clear,
		Q		=> X_out_int );
		
EQ799 : CompareEQU generic map (10) port map (
		X => X_out_int,
		Y => "1100011111",
		EQU => RollH);
		
LES640 : LST generic map (10) port map (
		A =>	X_out_int,
		B =>	"1010000000",
		OUTPUT =>	H_LT_656);
		
LES656 : LST generic map (10) port map (
		A =>	X_out_int,
		B =>	"1010010000",
		OUTPUT =>	HActive);
		
GRT751 : CompareGRT generic map (10) port map (
		A =>	X_out_int,
		B =>	"1011101111",
		OUTPUT =>	H_GT_751);
		
x_out <= X_out_int;
		
-----------------------------------------------------------------
Vcount_clear <= '1' when (pixelCLK = '1' and RollV = '1' and RollH = '1') else '0';
Vcount_en <= '1' when (pixelCLK = '1' and RollH = '1') else '0';	
--vertical		
		
Vcount : Counter_nbit generic map (10) port map (
		EN    => Vcount_en,
		CLK   => CLK,
		CLR   => Vcount_clear,
		Q		=> Y_out_int );
		
EQ524 : CompareEQU generic map (10) port map (
		X => Y_out_int,
		Y => "1000001100",
		EQU => RollV);
		
LES480 : LST generic map (10) port map (
		A =>	Y_out_int,
		B =>	"0111100000",
		OUTPUT =>	VActive);
		
LES490 : LST generic map (10) port map (
		A =>	Y_out_int,
		B =>	"0111101010",
		OUTPUT =>	V_LT_490);
		
GRT491 : CompareGRT generic map (10) port map (
		A =>	Y_out_int,
		B =>	"0111101011",
		OUTPUT =>	V_GT_491);	
		
y_out <= y_out_int;		

----------------------------------------------------------------
--flip flops

DholdH <= '1' when ( H_GT_751 = '1' or H_LT_656 = '1') else '0';
hold_Hsync : DFF_CE port map (
		D => DholdH,
		CE => pixelCLK,
		CLK => CLK,
		Q => Hsync);
	
DholdV <= '1' when ( V_GT_491 = '1' or V_LT_490 = '1') else '0';
hold_Vsync : DFF_CE port map (
		D => DholdV,
		CE => pixelCLK,
		CLK => CLK,
		Q => Vsync);


holdActive <= HActive and VActive;
hold_rgb_enable : DFF_CE port map (
		D => holdActive,
		CE => pixelCLK,
		CLK => CLK,
		Q => RGB_enable_Reg);

RGB_out	 <= RGB_in when( RGB_enable_Reg = '1') else
				x"000";
	


end Behavioral;

