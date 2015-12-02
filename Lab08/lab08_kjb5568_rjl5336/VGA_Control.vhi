
-- VHDL Instantiation Created from source file VGA_Control.vhd -- 16:25:15 10/21/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT VGA_Control
	PORT(
		RGB_in : IN std_logic_vector(11 downto 0);
		Clk : IN std_logic;          
		X_out : OUT std_logic_vector(9 downto 0);
		Y_out : OUT std_logic_vector(9 downto 0);
		HSYNC : OUT std_logic;
		VSYNC : OUT std_logic;
		RGB_out : OUT std_logic_vector(11 downto 0)
		);
	END COMPONENT;

	Inst_VGA_Control: VGA_Control PORT MAP(
		X_out => ,
		Y_out => ,
		RGB_in => ,
		Clk => ,
		HSYNC => ,
		VSYNC => ,
		RGB_out => 
	);


