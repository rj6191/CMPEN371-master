----------------------------------------------------------------------------
-- Entity:        maximum block test bench
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
 
ENTITY max IS
END max;
 
ARCHITECTURE behavior OF max IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CompareGRT
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         OUTPUT : OUT  std_logic
        );
    END COMPONENT;
      
	type test_vector_type is array (0 to 14) of STD_LOGIC_VECTOR (6 downto 0);
   constant test_vector : test_vector_type := (
      -- A    B    	output
      "000" & "000" & "1",
      "001" & "000" & "1",
      "010" & "001" & "1",
      "011" & "001" & "1",
      "100" & "010" & "1",
      "101" & "001" & "1",
      "110" & "010" & "1",
      "111" & "011" & "1",
		"000" & "001" & "0",
      "001" & "010" & "0",
      "010" & "011" & "0",
      "011" & "100" & "0",
      "100" & "101" & "0",
	   "101" & "110" & "0",
      "110" & "111" & "0"
  
   );

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CompareGRT PORT MAP (
          A => A,
          B => B,
          OUTPUT => OUTPUT
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		-- run through all test vectors
      for i in test_vector'Range loop
      
         -- Assign test inputs
         A <= test_vector(i)(6 downto 4);
			B <= test_vector(i)(3 downto 1);

         -- Compare outputs to expected values
         wait for 2ns;
         assert (output = test_vector(i)(0))
            report "***** Test failed. *****"
            severity Failure;
      end loop;
 

      -- insert stimulus here 

      wait;
   end process;

END;
