----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:15 10/28/2015 
-- Design Name: 
-- Module Name:    PWM - Behavioral 
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
library kjb5568_rjl5336_Library;
use     kjb5568_rjl5336_Library.kjb5568_rjl5336_Components.all;

entity PWM is
	port( PD 		: in  STD_LOGIC_VECTOR (13 downto 0) ;
			PW			: in  STD_LOGIC_VECTOR (13 downto 0);
			CLK		: in  STD_LOGIC;
			PMW_out  : out STD_LOGIC);
end PWM;

architecture Behavioral of PWM is

signal eq9999 : STD_LOGIC;
signal count_out : STD_LOGIC_VECTOR (13 DOWNTO 0);
signal les_out : std_logic;



begin
		
Hcount : Counter_nbit generic map (14) port map (
		EN    => '1',
		CLK   => CLK,
		CLR   => eq9999,
		Q		=> count_out );

EQU : CompareEQU generic map (14) port map (
		X => count_out,
		Y => PD,
		EQU => eq9999);
		
LES640 : LST generic map (14) port map (
		A 		 =>	count_out,
		B 		 =>	PW,
		OUTPUT =>	les_out);
		
D_PMW_OUT : DFF port map (
		D    =>  les_out,
		CLK  =>  clk,
		Q    =>  PMW_out);		

end Behavioral;

