----------------------------------------------------------------------------
-- Entity:        TopLevel_testbench
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/6/15
-- Description:   TopLevel_testbench
--
-- Revision History (date, initials, description): 09/06/15, KB RL, Initial Build
-- 																09/07/15, KB RL, Revised Build
--																	09/09/15, KB RL, Revision 2, fixed errors
-- Dependencies:
--		lab02_kjb5568_rjl5336.vhd
----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TopLevel_tb IS
END TopLevel_tb;
 
ARCHITECTURE behavior OF TopLevel_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
   
    COMPONENT lab02_kjb5568_rjl5336
    PORT(
         BTNU    : IN   STD_LOGIC;
         BTNC    : IN   STD_LOGIC;
         BTND    : IN   STD_LOGIC;
         SWITCH  : IN   STD_LOGIC_VECTOR(7 downto 0);
         ANODE   : OUT  STD_LOGIC_VECTOR(7 downto 0);
         SEGMENT : OUT  STD_LOGIC_VECTOR(0 to 6);
         LED     : OUT  STD_LOGIC_VECTOR(4 downto 0)
        );
    END COMPONENT;
	 
   type test_vector_type is array (0 to 9) of STD_LOGIC_VECTOR (30 downto 0);
   constant test_vector : test_vector_type := (
      -- BTNU	BTNC	BTND	SWITCH			ANODE				SEGMENT			LED
			"0" &	"0" & "0" & "00000000" &   "11111110" &   "0000001"  &	"00000",--works
			"0" &	"0" & "0" & "00010001" &   "11111110" &   "0010010"  &	"00010",--works
			"0" &	"1" & "0" & "00100001" &   "11111110" &   "0010010"  &	"00011",--works
			"0" &	"0" & "0" & "00110010" &   "11111110" &   "0100100"  &	"00101",--works
			"0" &	"0" & "1" & "00110010" &   "11111110" &   "1001111"  &	"00001",--works
			"0" &	"0" & "0" & "01110111" &   "11111110" &   "0110000"  &	"11110",--works
			"1" &	"0" & "0" & "01110111" &   "11111110" &   "0001111"  &	"11110",--works
			"0" &	"0" & "0" & "00100110" &   "11111110" &   "0000000"  &	"11000",--works
			"0" &	"0" & "1" & "11100111" &   "11111110" &   "0001111"  &	"10111",--works
			"0" &	"0" & "0" & "01001111" &   "11111110" &   "0000110"  &	"00011" 
   );
  

   --Inputs
   signal BTNU    : STD_LOGIC := '0';
   signal BTNC    : STD_LOGIC := '0';
   signal BTND    : STD_LOGIC := '0';
   signal SWITCH  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

 	--Outputs
   signal ANODE   : STD_LOGIC_VECTOR(7 downto 0);
   signal SEGMENT : STD_LOGIC_VECTOR(0 to 6);
   signal LED     : STD_LOGIC_VECTOR(4 downto 0); 

 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab02_kjb5568_rjl5336 PORT MAP (
          BTNU    => BTNU,
          BTNC    => BTNC,
          BTND    => BTND,
          SWITCH  => SWITCH,
          ANODE   => ANODE,
          SEGMENT => SEGMENT,
          LED     => LED
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      for i in test_vector'Range loop
         -- Assign test inputs
         BTNU    <= test_vector(i)(30);
         BTNC    <= test_vector(i)(29);
			BTND    <= test_vector(i)(28);
			SWITCH  <= test_vector(i)(27 downto 20);
         
         -- Compare outputs to expected values
         wait for 2ns;
		
			assert (ANODE  = test_vector(i)(19 downto 12))
				report "***** ANODE Test failed. *****"
            severity FAILURE;
			assert (SEGMENT = test_vector(i)(11 downto  5))
				report "***** SEGMENT Test failed. *****"
            severity FAILURE;
			assert (LED     = test_vector(i)(4 downto 0))
            report "***** LED Test failed. *****"
            severity FAILURE;
      end loop;
     

      -- insert stimulus here 

      wait;
   end process;

END;
