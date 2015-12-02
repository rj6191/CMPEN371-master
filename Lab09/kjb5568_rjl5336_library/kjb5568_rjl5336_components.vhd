----------------------------------------------------------------------------
-- Entity:        kjb5568_rjl5336_components
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   vhdl back end to support the library feature
--
-- Revision History (date, initials, description): 9/10/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

----------------------------------------------------------------------------
package kjb5568_rjl5336_Components is

	component FullAdder is
		port (A     : in  STD_LOGIC;
				B     : in  STD_LOGIC;
				C_in  : in  STD_LOGIC;
				C_out : out STD_LOGIC;
				SUM   : out STD_LOGIC);
	end component;

	component AdderSubtractor_nbit is
	generic (n: integer :=4);
    Port ( A        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           SUBTRACT : in  STD_LOGIC;
           OVERFLOW : out STD_LOGIC;
           SUM      : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component CompareEQU is
	generic (n: integer :=4);
    Port ( X        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           Y        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           EQU   : out STD_LOGIC);
	end component;
	
	component CompareGRT is
	generic (n: integer :=4);
    Port ( A        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           OUTPUT   : out STD_LOGIC);
	end component;
	
	component maximum is
	port ( SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0); -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			 MAX			: out	STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component LST is
	generic (n: integer :=4);
    Port ( A        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B        : in  STD_LOGIC_VECTOR (n-1 downto 0);
           OUTPUT   : out STD_LOGIC);
	end component;
	
	component minimum is
	port ( SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0); -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			 MIN			: out	STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component Average is
	port ( SWITCH		: in	STD_LOGIC_VECTOR(15 downto 0); -- 15-12 A, 11-8 B, 7-4 C, 3-0 D
			 AVG			: out	STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component mux4to1 is
	Port ( x0		: in  STD_LOGIC_VECTOR(3 downto 0);
			 x1		: in  STD_LOGIC_VECTOR(3 downto 0);
			 x2		: in  STD_LOGIC_VECTOR(3 downto 0);
			 x3		: in  STD_LOGIC_VECTOR(3 downto 0);
			 sel		: in  STD_LOGIC_VECTOR(1 downto 0);
			 y	: out STD_LOGIC_VECTOR(3 downto 0));			 
	end component;
	
	component threeto8encoder is
		port( A			: in STD_LOGIC_VECTOR (2 downto 0);
				en			: in STD_LOGIC;
				output	: out STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component hextosevenseg is
	Port ( Hex 		 : in  STD_LOGIC_VECTOR(3 downto 0);
			 Segment  : out STD_LOGIC_VECTOR(0   to   6));
	
	end component;
	
	component Counter_nbit is
		generic (n : integer := 8);
		port (EN : in STD_LOGIC;
			  CLK : in STD_LOGIC;
			  CLR : in STD_LOGIC;
				 Q : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component CounterUpDown_nbit is
		generic (n : integer := 8);
			port (EN : in STD_LOGIC;
					UP : in STD_LOGIC;
				 DOWN : in STD_LOGIC;
				  CLK : in STD_LOGIC;
				  CLR : in STD_LOGIC;
					 Q : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Reg_nbit is
		generic (n : integer := 8);
		port (     D : in STD_LOGIC_VECTOR(n-1 downto 0);
				  LOAD : in STD_LOGIC;
					CLK : in STD_LOGIC;
					CLR : in STD_LOGIC;
					  Q : out STD_LOGIC_VECTOR(n-1 downto 0) := (OTHERS => '0'));
	end component;
	
	component DFF is
		port ( D : in STD_LOGIC;
			  CLK : in STD_LOGIC;
				 Q : out STD_LOGIC:= '0');
	end component;
	
	component DFF_CE is
		port ( D : in STD_LOGIC;
				CE : in STD_LOGIC;
			  CLK : in STD_LOGIC;
				 Q : out STD_LOGIC:= '0');
	end component;
	
	component counter50mhz is
		generic (n : integer := 8);
		port   (EN : in STD_LOGIC;
			 	 CLK : in STD_LOGIC;
				 CLR : in STD_LOGIC;
					Q : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component counter16hz is
		generic (n : integer := 8);
		port   (EN : in STD_LOGIC;
			 	 CLK : in STD_LOGIC;
				 CLR : in STD_LOGIC;
					Q : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component OneShot is
		port( D 		: in   STD_LOGIC;
				CLK	: in STD_LOGIC;
				Q	 	: out  STD_LOGIC);
	end component;
	
	component Debouncer is
		port( D 		: in   STD_LOGIC;
				CLK	: in STD_LOGIC;
				Pulse	: in STD_LOGIC;
				Q	 	: out  STD_LOGIC);

	end component;
	
	component Shift_Register is
	port ( D : in std_logic;
		load : in std_logic;
		clk: in std_logic;
		q : out std_logic_vector(15 downto 0));
	end component;
	
	component WordTo8dig7seg is
		port( word	: in std_logic_vector(31 downto 0);
		 clk			: in std_logic;
		 strobe		: in std_logic;
		 Digit_en	: in std_logic_vector (7 downto 0);
		 segment		: out std_logic_vector (6 downto 0);
		 anode 		: out std_logic_vector (7 downto 0));
	end component;
	
	component pulse_gen is
		generic (n : integer := 4;
		maxCount : natural := 9);
		port (EN : in STD_LOGIC;
			  CLK : in STD_LOGIC;
		     CLR : in STD_LOGIC;
			PULSE : out STD_LOGIC);
	end component;
	
	component Up_down_with_input_nbit is
		generic (n : integer := 8);
	  port (EN : in STD_LOGIC;
			  UP : in STD_LOGIC;
			DOWN : in STD_LOGIC;
			 CLK : in STD_LOGIC;
			 CLR : in STD_LOGIC;
		  INPUT : in STD_LOGIC_VECTOR (n-1 downto 0);
				Q : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component Ripple_Carry_Adder is
		generic (n: integer :=4);
		Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (n-1 downto 0));
	end component;


end kjb5568_rjl5336_Components;
----------------------------------------------------------------------------



----------------------------------------------------------------------------
package body kjb5568_rjl5336_Components is

end kjb5568_rjl5336_Components;
----------------------------------------------------------------------------
