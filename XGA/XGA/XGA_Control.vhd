----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:01 11/29/2015 
-- Design Name: 
-- Module Name:    XGA_Control - Behavioral 
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
use IEEE.numeric_STD.ALL; 
library kjb5568_rjl5336_Library;
use     kjb5568_rjl5336_Library.kjb5568_rjl5336_Components.all;

entity XGA_Control is
    Port ( X_out 		: out  STD_LOGIC_VECTOR (10 downto 0);
           Y_out 		: out  STD_LOGIC_VECTOR (10 downto 0);
           RGB_in 	: in  STD_LOGIC_VECTOR (11 downto 0);
           Clk 		: in  STD_LOGIC;
           pixelCLK	: in  STD_LOGIC;
           HSYNC 		: out  STD_LOGIC;
           VSYNC 		: out  STD_LOGIC;
           RGB_out 	: out  STD_LOGIC_VECTOR (11 downto 0));
end XGA_Control;

architecture Behavioral of XGA_Control is

--signal pixelCLK : std_logic;
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
signal H_lt_1048 : std_logic;
signal V_lt_771 : std_logic;
signal V_gt_776 : std_logic;
signal H_gt_1183 : std_logic;
signal RGB_enable_Reg		 : std_logic;
signal X_out_int : STD_LOGIC_VECTOR (10 downto 0);
signal y_out_int : STD_LOGIC_VECTOR (10 downto 0);

begin

--Pulse50 : Pulse_Gen generic map (1, 1) port map (
--		EN    => '1',
--		CLK   => CLK,
--		CLR   => '0',
--		PULSE => pixelCLK );

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
		
EQ1344 : CompareEQU generic map (11) port map ( -- total count
		X => X_out_int,
		Y => "10101000000",
		EQU => RollH);
		
LES1048 : LST generic map (11) port map (
		A =>	X_out_int,
		B =>	"10000011000",
		OUTPUT =>	 H_lt_1048);
		
LES1024 : LST generic map (11) port map (
		A =>	X_out_int,
		B =>	"10000000000",
		OUTPUT =>	HActive);
		
GRT1183 : CompareGRT generic map (11) port map (
		A =>	X_out_int,
		B =>	"10010011111",
		OUTPUT =>	H_gt_1183);
		
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
		
EQ806 : CompareEQU generic map (11) port map (
		X => Y_out_int,
		Y => "01100100110",
		EQU => RollV);
		
LES768 : LST generic map (11) port map (
		A =>	Y_out_int,
		B =>	"01100000000",
		OUTPUT =>	VActive);
		
LES771 : LST generic map (11) port map (
		A =>	Y_out_int,
		B =>	"01100000011",
		OUTPUT =>	V_lt_771 );
		
GRT776 : CompareGRT generic map (11) port map (
		A =>	Y_out_int,
		B =>	"01100001000",
		OUTPUT =>	V_gt_776 );	
		
y_out <= y_out_int;		

----------------------------------------------------------------
--flip flops

DholdH <= '1' when ( H_gt_1183 = '1' or  H_lt_1048 = '1') else '0';
hold_Hsync : DFF_CE port map (
		D => DholdH,
		CE => pixelCLK,
		CLK => CLK,
		Q => Hsync);
	
DholdV <= '1' when ( V_gt_776  = '1' or V_lt_771  = '1') else '0';
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

