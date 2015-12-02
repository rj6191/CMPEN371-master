----------------------------------------------------------------------------
-- Entity:        minimum block testbench
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   computes the minimum of 4 numbers
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
 
ENTITY min IS
END min;
 
ARCHITECTURE behavior OF min IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LST
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         OUTPUT : OUT  std_logic
        );
    END COMPONENT;
   type test_vector_type is array (0 to 14) of STD_LOGIC_VECTOR (8 downto 0);
   constant test_vector : test_vector_type := (
      -- A    B    	output
      "0000" & "0000" & "0",
      "0001" & "0000" & "0",
      "0010" & "0001" & "0",
      "0011" & "0001" & "0",
      "0100" & "0010" & "0",
      "0101" & "0001" & "0",
      "0110" & "0010" & "0",
      "0111" & "0011" & "0",
		"0000" & "0001" & "1",
      "0001" & "0010" & "1",
      "0010" & "0011" & "1",
      "0011" & "0100" & "1",
      "0100" & "0101" & "1",
	   "0101" & "0110" & "1",
      "0110" & "0111" & "1"
  
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
   uut: LST PORT MAP (
          A => A,
          B => B,
          OUTPUT => OUTPUT
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      for i in test_vector'Range loop
      
         -- Assign test inputs
         A <= test_vector(i)(8 downto 5);
			B <= test_vector(i)(4 downto 1);

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
