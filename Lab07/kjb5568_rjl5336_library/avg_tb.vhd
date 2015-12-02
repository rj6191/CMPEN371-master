----------------------------------------------------------------------------
-- Entity:        average block testbench
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/10/15
-- Description:   computes the average of 4 numbers
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
 
ENTITY avg IS
END avg;
 
ARCHITECTURE behavior OF avg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Average
    PORT(
         SWITCH : IN  std_logic_vector(15 downto 0);
         AVG : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
     type test_vector_type is array (0 to 7) of STD_LOGIC_VECTOR (19 downto 0);
   constant test_vector : test_vector_type := (
   -- Switch    				Avg   	
      "0000000000000000" & "0000",
      "0001000100010001" & "0001",
      "0010001000100010" & "0010",
      "0011001100110011" & "0011",
      "0100010001000100" & "0100",
	   "0101010101010101" & "0101",
      "0110011001100110" & "0110",
		"0111011101110111" & "0111"
  
   );


   --Inputs
   signal SWITCH : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal AVG : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Average PORT MAP (
          SWITCH => SWITCH,
          AVG => AVG
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      for i in test_vector'Range loop
      
         -- Assign test inputs
         switch <= test_vector(i)(19 downto 4);
			

         -- Compare outputs to expected values
         wait for 2ns;
         assert (avg = test_vector(i)(3 downto 0))
            report "***** Test failed. *****"
            severity Failure;
      end loop;
 
   
      

      -- insert stimulus here 

      wait;
   end process;

END;
