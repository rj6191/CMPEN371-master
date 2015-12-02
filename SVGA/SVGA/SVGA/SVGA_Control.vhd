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

entity SVGA_Control is
    Port ( X_out 		: out  STD_LOGIC_VECTOR (10 downto 0);
           Y_out 		: out  STD_LOGIC_VECTOR (10 downto 0);
           RGB_in 	: in  STD_LOGIC_VECTOR (11 downto 0);
           Clk 		: in  STD_LOGIC;
           HSYNC 		: out  STD_LOGIC;
           VSYNC 		: out  STD_LOGIC;
           RGB_out 	: out  STD_LOGIC_VECTOR (11 downto 0));
end SVGA_Control;

architecture Behavioral of SVGA_Control is

component clk_wiz_v3_6 is
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic;
  CLK_OUT2          : out    std_logic;
  CLK_OUT3          : out    std_logic;
  CLK_OUT4          : out    std_logic;
  CLK_OUT5          : out    std_logic;
  CLK_OUT6          : out    std_logic
 );
end component;


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
signal H_lt_840 : std_logic;
signal V_lt_601 : std_logic;
signal V_gt_604 : std_logic;
signal H_gt_967 : std_logic;
signal RGB_enable_Reg		 : std_logic;
signal X_out_int : STD_LOGIC_VECTOR (10 downto 0);
signal y_out_int : STD_LOGIC_VECTOR (10 downto 0);

begin




Pulse33 : Pulse_Gen generic map (2, 2) port map (
		EN    => '1',
		CLK   => CLK,
		CLR   => '0',
		PULSE => pixelCLK );

----using clock from ip core generator
--clocks: clk_wiz_v3_6 port map (
--	CLK_IN1 => clk,
--	CLK_OUT1 =>  open,
--	CLK_OUT2 =>  pixelCLK,
--	CLK_OUT3 =>  open,
--	CLK_OUT4 =>  open,
--	CLK_OUT5 =>  open,
--	CLK_OUT6 =>  open);
	
	
		
------------------------------------------------------------------
Hcount_clear <= '1' when ( pixelCLK = '1' and RollH = '1') else '0';
--horizontal
		
Hcount : Counter_nbit generic map (11) port map (
		EN    => pixelCLK,
		CLK   => CLK,
		CLR   => Hcount_clear,
		Q		=> X_out_int );
		
EQ1055 : CompareEQU generic map (11) port map ( -- total count
		X => X_out_int,
		Y => "10000011111",
		EQU => RollH);
		
LES840 : LST generic map (11) port map (
		A =>	X_out_int,
		B =>	"01101001000",
		OUTPUT =>	H_LT_840);
		
LES800 : LST generic map (11) port map (
		A =>	X_out_int,
		B =>	"01100100000",
		OUTPUT =>	HActive);
		
GRT967 : CompareGRT generic map (11) port map (
		A =>	X_out_int,
		B =>	"01111000111",
		OUTPUT =>	H_GT_967);
		
x_out <= X_out_int;
		
-----------------------------------------------------------------
Vcount_clear <= '1' when (pixelCLK = '1' and RollV = '1' and RollH = '1') else '0';
Vcount_en <= '1' when (pixelCLK = '1' and RollH = '1') else '0';	
--vertical		
		
Vcount : Counter_nbit generic map (11) port map (
		EN    => Vcount_en,
		CLK   => CLK,
		CLR   => Vcount_clear,
		Q		=> Y_out_int );
		
EQ628 : CompareEQU generic map (11) port map (
		X => Y_out_int,
		Y => "01001110100",
		EQU => RollV);
		
LES600 : LST generic map (11) port map (
		A =>	Y_out_int,
		B =>	"01001011000",
		OUTPUT =>	VActive);
		
LES601 : LST generic map (11) port map (
		A =>	Y_out_int,
		B =>	"01001011001",
		OUTPUT =>	V_LT_601);
		
GRT604 : CompareGRT generic map (11) port map (
		A =>	Y_out_int,
		B =>	"01001011100",
		OUTPUT =>	V_GT_604);	
		
y_out <= y_out_int;		

----------------------------------------------------------------
--flip flops

DholdH <= '1' when ( H_GT_967 = '1' or H_LT_840 = '1') else '0';
hold_Hsync : DFF_CE port map (
		D => DholdH,
		CE => pixelCLK,
		CLK => CLK,
		Q => Hsync);
	
DholdV <= '1' when ( V_GT_604 = '1' or V_LT_601 = '1') else '0';
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

