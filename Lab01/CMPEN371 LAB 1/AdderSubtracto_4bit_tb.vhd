----------------------------------------------------------------------------
-- Entity:        AdderSubtractor_4bit_tb
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/28/15
-- Description:   AdderSubtractor_4bit test bench
--
-- Revision History (date, initials, description): 8/27/15, KB RL, test bench
-- 
-- Dependencies:
--		<List entities, one per line.  Type (none) if none are required.>
----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY AdderSubtracto_4bit_tb IS
END AdderSubtracto_4bit_tb;
 
ARCHITECTURE behavior OF AdderSubtracto_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AdderSubtractor_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         SUBTRACT : IN  std_logic;
         OVERFLOW : OUT  std_logic;
         SUM : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal SUBTRACT : std_logic := '0';

 	--Outputs
   signal OVERFLOW : std_logic;
   signal SUM : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AdderSubtractor_4bit PORT MAP (
          A => A,
          B => B,
          SUBTRACT => SUBTRACT,
          OVERFLOW => OVERFLOW,
          SUM => SUM
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		--test cases for addition
 		A(3) <= '0'; A(2) <= '0'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '0'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '0' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
   	A(3) <= '1'; A(2) <= '0'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '0'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '0'; A(2) <= '1'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '0'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '0' and SUM(2) = '1' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '0'; A(2) <= '0'; A(1) <= '1'; A(0) <= '0';   B(3) <= '0'; B(2) <= '0'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '0' and SUM(2) = '0' and SUM(1) = '1' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '1'; A(2) <= '1'; A(1) <= '0'; A(0) <= '0';   B(3) <= '1'; B(2) <= '1'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '0')
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
 		A(3) <= '1'; A(2) <= '0'; A(1) <= '1'; A(0) <= '0';   B(3) <= '1'; B(2) <= '0'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '0' and SUM(2) = '0' and SUM(1) = '1' and SUM(0) = '0')
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
   	A(3) <= '1'; A(2) <= '0'; A(1) <= '0'; A(0) <= '1';   B(3) <= '1'; B(2) <= '0'; B(1) <= '0'; B(0) <= '1';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '0' and SUM(2) = '0' and SUM(1) = '1' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '0'; A(2) <= '1'; A(1) <= '1'; A(0) <= '0';   B(3) <= '0'; B(2) <= '1'; B(1) <= '1'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '1' and SUM(2) = '1' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;  
 		A(3) <= '0'; A(2) <= '1'; A(1) <= '0'; A(0) <= '1';   B(3) <= '0'; B(2) <= '1'; B(1) <= '0'; B(0) <= '1';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '1' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value."  
			severity failure; 
 		A(3) <= '0'; A(2) <= '0'; A(1) <= '1'; A(0) <= '1';   B(3) <= '0'; B(2) <= '0'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '0' and SUM(2) = '1' and SUM(1) = '1' and SUM(0) = '0')
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
 		A(3) <= '1'; A(2) <= '1'; A(1) <= '1'; A(0) <= '0';   B(3) <= '1'; B(2) <= '1'; B(1) <= '1'; B(0) <= '0';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '1' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '1'; A(2) <= '1'; A(1) <= '0'; A(0) <= '1';   B(3) <= '1'; B(2) <= '1'; B(1) <= '0'; B(0) <= '1';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '1' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
   	A(3) <= '1'; A(2) <= '0'; A(1) <= '1'; A(0) <= '1';   B(3) <= '1'; B(2) <= '0'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '0' and SUM(2) = '1' and SUM(1) = '1' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '0'; A(2) <= '1'; A(1) <= '1'; A(0) <= '1';   B(3) <= '0'; B(1) <= '0'; B(1) <= '0'; B(0) <= '1';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '0')
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
		A(3) <= '1'; A(2) <= '1'; A(1) <= '1'; A(0) <= '1';   B(3) <= '1'; B(2) <= '1'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '0';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '1' and SUM(1) = '1' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;	
			
		--test cases for subtraction
		A(3) <= '0'; A(2) <= '0'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '0'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '0' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
   	A(3) <= '1'; A(2) <= '0'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '0'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '0'; A(2) <= '1'; A(1) <= '1'; A(0) <= '1';   B(3) <= '0'; B(2) <= '0'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '0' and SUM(2) = '1' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '0'; A(2) <= '0'; A(1) <= '1'; A(0) <= '1';   B(3) <= '0'; B(2) <= '1'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '1' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '1'; A(2) <= '1'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '1'; B(1) <= '1'; B(0) <= '0';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '0' and SUM(2) = '1' and SUM(1) = '1' and SUM(0) = '0')
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;--works
 		A(3) <= '1'; A(2) <= '0'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '1'; B(1) <= '0'; B(0) <= '0';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '0' and SUM(2) = '1' and SUM(1) = '0' and SUM(0) = '0')
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
   	A(3) <= '1'; A(2) <= '1'; A(1) <= '0'; A(0) <= '1';   B(3) <= '0'; B(2) <= '0'; B(1) <= '0'; B(0) <= '1';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '1' and SUM(1) = '0' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '1'; A(2) <= '1'; A(1) <= '1'; A(0) <= '1';   B(3) <= '0'; B(2) <= '1'; B(1) <= '0'; B(0) <= '1';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '1' and SUM(0) = '0') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;  
 		A(3) <= '1'; A(2) <= '1'; A(1) <= '1'; A(0) <= '0';   B(3) <= '0'; B(2) <= '1'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '0' and SUM(2) = '1' and SUM(1) = '1' and SUM(0) = '1') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value."  
			severity failure; 
 		A(3) <= '1'; A(2) <= '0'; A(1) <= '0'; A(0) <= '1';   B(3) <= '0'; B(2) <= '1'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '1' and SUM(3) = '0' and SUM(2) = '0' and SUM(1) = '1' and SUM(0) = '0')
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
 		A(3) <= '1'; A(2) <= '1'; A(1) <= '0'; A(0) <= '0';   B(3) <= '0'; B(2) <= '0'; B(1) <= '1'; B(0) <= '1';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '1') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure; 
 		A(3) <= '1'; A(2) <= '0'; A(1) <= '1'; A(0) <= '1';   B(3) <= '0'; B(2) <= '0'; B(1) <= '1'; B(0) <= '0';   SUBTRACT <= '1';
		wait for 10 ns;
		assert (OVERFLOW = '0' and SUM(3) = '1' and SUM(2) = '0' and SUM(1) = '0' and SUM(0) = '1') 
			report "FAILURE: OVERFLOW and/or SUM does not equal expected value." 
			severity failure;
			
			 
			 
      -- insert stimulus here 

      wait;
   end process;

END;
