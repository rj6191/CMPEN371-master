--------------------------------------------------------------------------------
-- Entity:        Ripple Carry Adder Test Bench
-- Written By:    Kevin Brenneman Richard Lucas
-- Date Created:  8/26/15
-- Description:   Ripple Carry Adder Test Bench
--
-- Revision History (date, initials, description): 8/26/15, KB RL, Initial Build
-- 
-- Dependencies:
--		<List entities, one per line.  Type (none) if none are required.>
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Rippl_Carry_Adde_TB IS
END Rippl_Carry_Adde_TB;
 
ARCHITECTURE behavior OF Rippl_Carry_Adde_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ripple_Carry_Adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C_in : IN  std_logic;
         C_out : OUT  std_logic;
         SUM : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C_in : std_logic := '0';

 	--Outputs
   signal C_out : std_logic;
   signal SUM : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ripple_Carry_Adder PORT MAP (
          A => A,
          B => B,
          C_in => C_in,
          C_out => C_out,
          SUM => SUM
        );

   stim_proc: process
   begin	
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		A(0) <= '0'; A(1) <= '0'; A(2) <= '0'; A(3) <= '0';  B(0) <= '0';   B(1) <= '0';  B(2) <= '0'; B(3) <= '0';  C_in <= '0';
		wait for 10 ns;
		assert (C_out = '0' and SUM(0) = '0' and SUM(1) = '0' and SUM(2) = '0' and SUM(3) = '0') 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;

	A(0) <= '0'; A(1) <= '1'; A(2) <= '1'; A(3) <= '0';  B(0) <= '0';   B(1) <= '0';  B(2) <= '1'; B(3) <= '0';  C_in <= '1';
		wait for 10 ns;
		assert (C_out = '0' and SUM(0) = '1' and SUM(1) = '0' and SUM(2) = '0' and SUM(3) = '0') 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
				
	A(0) <= '1'; A(1) <= '1'; A(2) <= '0'; A(3) <= '0';  B(0) <= '0';   B(1) <= '1';  B(2) <= '1'; B(3) <= '0';  C_in <= '1';
		wait for 10 ns;
		assert (C_out = '1' and SUM(0) = '0' and SUM(1) = '0' and SUM(2) = '1' and SUM(3) = '0') 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
			
	A(0) <= '1'; A(1) <= '0'; A(2) <= '0'; A(3) <= '1';  B(0) <= '0';   B(1) <= '1';  B(2) <= '1'; B(3) <= '1';  C_in <= '1';
		wait for 10 ns;
		assert (C_out = '1' and SUM(0) = '0' and SUM(1) = '0' and SUM(2) = '0' and SUM(3) = '0') 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
      
	A(0) <= '0'; A(1) <= '1'; A(2) <= '0'; A(3) <= '0';  B(0) <= '0';   B(1) <= '0';  B(2) <= '1'; B(3) <= '1';  C_in <= '1';
		wait for 10 ns;
		assert (C_out = '1' and SUM(0) = '0' and SUM(1) = '1' and SUM(2) = '1' and SUM(3) = '1') 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
	
	A(0) <= '0'; A(1) <= '1'; A(2) <= '1'; A(3) <= '0';  B(0) <= '1';   B(1) <= '0';  B(2) <= '1'; B(3) <= '1';  C_in <= '1';
		wait for 10 ns;
		assert (C_out = '1' and SUM(0) = '0' and SUM(1) = '0' and SUM(2) = '0' and SUM(3) = '1') 
			report "FAILURE: C_out and/or SUM does not equal expected value." 
			severity failure;
      wait;
   end process;

END;
