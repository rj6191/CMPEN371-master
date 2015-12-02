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



end kjb5568_rjl5336_Components;
----------------------------------------------------------------------------



----------------------------------------------------------------------------
package body kjb5568_rjl5336_Components is

end kjb5568_rjl5336_Components;
----------------------------------------------------------------------------
