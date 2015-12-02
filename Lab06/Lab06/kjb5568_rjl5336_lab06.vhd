----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:07:43 10/12/2015 
-- Design Name: 
-- Module Name:    kjb5568_rjl5336_lab06 - Behavioral 
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

entity kjb5568_rjl5336_lab06 is
port( PS2KBD_DATA_in : in  std_logic;
		PS2KBD_CLK_in 	: in std_logic;
		SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0);
		BUTTON		: in	STD_LOGIC_VECTOR(4 downto 0);
		clk				: in  std_logic;		
		ANODE		: out	STD_LOGIC_VECTOR(7 downto 0);
		SEGMENT	: out STD_LOGIC_VECTOR(0   to   6);
		LED			: out STD_LOGIC_VECTOR(15 downto 0));
end kjb5568_rjl5336_lab06;

architecture Behavioral of kjb5568_rjl5336_lab06 is

signal load : std_logic;
signal strobe : std_logic;
--signal clear : std_logic;
signal Code_Ready : std_logic;
signal pulse_1000 : std_logic;
signal TIMEOUT : std_logic;
signal digit_en		 : STD_LOGIC_VECTOR (7 downto 0);
signal PS2KBD_CLK_in_Debounce : std_logic;
signal PS2KBD_DATA_in_Debounce : std_logic;
signal word_int	: STD_LOGIC_VECTOR (31 downto 0);

begin

Debounce_CLK: Debouncer port map(
			D => PS2KBD_CLK_in,
			CLK => CLK,
			pulse => pulse_1000,
			Q => PS2KBD_CLK_in_Debounce);
			
Debounce_DATA: Debouncer port map(
			D => PS2KBD_DATA_in,
			CLK => CLK,
			pulse => pulse_1000,
			Q => PS2KBD_DATA_in_Debounce);
			
pulse1000: pulse_gen generic map( n => 2,  maxcount => 2) port map(
			en => '1',
			clk => clk,
			clr => button(2),
			pulse => pulse_1000);

KB_FSM: KB_Read_FSM port map (
		PS2KBD_CLK_in => PS2KBD_CLK_in_Debounce,
		clr => '0',			
		clk => clk,
		load => load,			
		Code_Ready => Code_Ready);	
		
KB_Data: FSM_Datapath port map (		
		Code_Ready => Code_Ready,
		load	=> load,
		PS2KBD_DATA_in => PS2KBD_DATA_in_Debounce,
		clk	=> clk,
		clr	=> button(2),
		word	=> word_int);
		
pulse500: pulse_gen generic map( n => 17,  maxcount => 100000) port map(
			en => '1',
			clk => clk,
			clr => '0',
			pulse => strobe);
		
digit_en <= "11111111";

display: wordto8dig7seg port map (
			word => word_int,
			clk => clk,
			strobe => strobe,
			digit_en => digit_en,
			segment => segment,
			anode => anode);

LED <= "0000000000000000";
end Behavioral;

