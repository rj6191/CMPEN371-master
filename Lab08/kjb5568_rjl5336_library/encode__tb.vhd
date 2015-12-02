----------------------------------------------------------------------------
-- Entity:        encoder block tesbench
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   computes the maximum of 4 numbers
--
-- Revision History (date, initials, description): 9/15/15, KB RL, Initial Build
-- 
-- Dependencies:
--		none
----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY encode IS
END encode;
 
ARCHITECTURE behavior OF encode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT threeto8encoder
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         en : IN  std_logic;
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
  type test_vector_type is array (0 to 15) of STD_LOGIC_VECTOR (11 downto 0);
   constant test_vector : test_vector_type := (
      -- A    en    output
      "000" & "0" & "00000000",
      "001" & "0" & "00000000",
      "010" & "0" & "00000000",
      "011" & "0" & "00000000",
      "100" & "0" & "00000000",
      "101" & "0" & "00000000",
      "110" & "0" & "00000000",
      "111" & "0" & "00000000",
		"000" & "1" & "00000000",
      "001" & "1" & "00000001",
      "010" & "1" & "00000010",
      "011" & "1" & "00000100",
      "100" & "1" & "00001000",
	   "101" & "1" & "00010000",
      "110" & "1" & "00100000",
      "111" & "1" & "01000000"


   );
   --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal en : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: threeto8encoder PORT MAP (
          A => A,
          en => en,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		-- run through all test vectors
      for i in test_vector'Range loop
      
         -- Assign test inputs
         A <= test_vector(i)(11 downto 9);
			en <= test_vector(i)(8);

         -- Compare outputs to expected values
         wait for 2ns;
         assert (output = test_vector(i)(7 downto 0))
            report "***** Test failed. *****"
            severity Failure;
      end loop;
      
      -- insert stimulus here 

      wait;
   end process;

END;
