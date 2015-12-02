
-- VHDL Instantiation Created from source file Multiplier_v2.vhd -- 15:16:28 11/09/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Multiplier_v2
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		CLK : IN std_logic;
		clr : IN std_logic;
		start_count : IN std_logic;          
		product : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Multiplier_v2: Multiplier_v2 PORT MAP(
		A => ,
		B => ,
		CLK => ,
		clr => ,
		start_count => ,
		product => 
	);


