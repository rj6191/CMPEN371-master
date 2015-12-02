----------------------------------------------------------------------------
-- Entity:        Mux4to1_testbench
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  9/6/15
-- Description:   Mux4to1_testbench
--
-- Revision History (date, initials, description): 09/06/15, KB RL, Initial Build
-- 																09/07/15, KB RL, Revised Build
-- Dependencies:
--		mux.vhd
----------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mux4to1_tb IS
END Mux4to1_tb;
 
ARCHITECTURE behavior OF Mux4to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4to1
    PORT(
         x0  : IN  std_logic_vector(3 downto 0);
         x1  : IN  std_logic_vector(3 downto 0);
         x2  : IN  std_logic_vector(3 downto 0);
         x3  : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         y   : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;
      
	type test_vector_type is array (0 to 3) of STD_LOGIC_VECTOR (21 downto 0);
   constant test_vector : test_vector_type := (
   --Mux_Input  	 									Select			out
      "0001" & "0000" & "0000" & "0000" &		"00" & 			"0001", 
      "0000" & "0010" & "0000" & "0000" &		"01" &			"0010",			 
      "0000" & "0000" & "0011" & "0000" &		"10" &			"0011", 
      "0000" & "0000" & "0000" & "0100" &		"11" &			"0100"
   );
 

   --Inputs
   signal x0  : std_logic_vector(3 downto 0) := (others => '0');
   signal x1  : std_logic_vector(3 downto 0) := (others => '0');
   signal x2  : std_logic_vector(3 downto 0) := (others => '0');
   signal x3  : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal y   : std_logic_vector(3 downto 0);

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4to1 PORT MAP (
          x0  => x0,
          x1  => x1,
          x2  => x2,
          x3  => x3,
          sel => sel,
          y   => y
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      for i in test_vector'Range loop
    
         -- Assign test inputs
         x0  <= test_vector(i)(21 downto 18);
         x1  <= test_vector(i)(17 downto 14);
			x2  <= test_vector(i)(13 downto 10);
			x3  <= test_vector(i)(9 downto 6);
			sel <= test_vector(i)(5 downto 4);
         -- Compare outputs to expected values
         wait for 2ns;
			assert (y = test_vector(i)(3 downto 0))
            report "***** Test failed. *****"
            severity Failure;
      end loop;
 

      -- insert stimulus here 

      wait;
   end process;

END;
