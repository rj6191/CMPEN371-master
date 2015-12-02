
-- VHDL Instantiation Created from source file BCD_Adder_slice.vhd -- 12:46:56 11/07/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT BCD_Adder_slice
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		sub : IN std_logic;
		cbi : IN std_logic;          
		cbo : OUT std_logic;
		sum : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_BCD_Adder_slice: BCD_Adder_slice PORT MAP(
		A => ,
		B => ,
		sub => ,
		cbi => ,
		cbo => ,
		sum => 
	);


