
-- VHDL Instantiation Created from source file kjb5568_rjl5336_lab06.vhd -- 01:37:29 10/13/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT kjb5568_rjl5336_lab06
	PORT(
		PS2KBD_DATA_in : IN std_logic;
		PS2KBD_CLK_in : IN std_logic;
		clk : IN std_logic;          
		ANODE : OUT std_logic_vector(7 downto 0);
		SEGMENT : OUT std_logic_vector(0 to 6);
		LED : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_kjb5568_rjl5336_lab06: kjb5568_rjl5336_lab06 PORT MAP(
		PS2KBD_DATA_in => ,
		PS2KBD_CLK_in => ,
		clk => ,
		ANODE => ,
		SEGMENT => ,
		LED => 
	);


