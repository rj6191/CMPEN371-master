
-- VHDL Instantiation Created from source file Image_Generator.vhd -- 21:15:05 10/24/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Image_Generator
	PORT(
		Switch : IN std_logic_vector(11 downto 0);
		Button : IN std_logic_vector(0 to 4);
		X_in : IN std_logic_vector(9 downto 0);
		Y_in : IN std_logic_vector(9 downto 0);          
		RGB_out : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;

	Inst_Image_Generator: Image_Generator PORT MAP(
		Switch => ,
		Button => ,
		X_in => ,
		Y_in => ,
		RGB_out => 
	);


