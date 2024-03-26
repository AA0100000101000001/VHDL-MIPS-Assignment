LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit_tb is
END control_unit_tb;

ARCHITECTURE test OF control_unit_tb IS

	COMPONENT control_unit PORT(
	   opcode : in std_logic_vector(5 downto 0);
	   RegDst : out std_logic;
	   Branch : out std_logic;
	   MemRead : out std_logic;
	   MemtoReg : out std_logic;
	   ALUOp : out std_logic_vector(1 downto 0);
	   MemWrite : out std_logic;
	   ALUSrc : out std_logic;
	   RegWrite : out std_logic);
	END COMPONENT;

  -- input
	SIGNAL opcode_tb : std_logic_vector(5 downto 0);
	
	-- outputs
	SIGNAL RegDst_tb : std_logic;
	SIGNAL Branch_tb : std_logic;
	SIGNAL MemRead_tb : std_logic;
	SIGNAL MemtoReg_tb : std_logic;
	SIGNAL ALUOp_tb : std_logic_vector(1 downto 0);
	SIGNAL MemWrite_tb : std_logic;
	SIGNAL ALUSrc_tb : std_logic;
	SIGNAL RegWrite_tb : std_logic;

BEGIN
	
	U1: control_unit PORT MAP (
		opcode => opcode_tb,
		RegDst => RegDst_tb,
		Branch => Branch_tb,
		MemRead => MemRead_tb,
		MemtoReg => MemtoReg_tb,
		ALUOp => ALUOp_tb,
		MemWrite => MemWrite_tb,
		ALUSrc => ALUSrc_tb,
		RegWrite => RegWrite_tb);

	-- stimulus process
	PROCESS
	BEGIN

    -- add, sub
		opcode_tb <= "000000";
		WAIT FOR 600 ns;
		
		-- addi
		opcode_tb <= "001000";
		WAIT FOR 600 ns;
		
		-- lw (load word)
		opcode_tb <= "100011";
		WAIT FOR 600 ns;
		
		-- sw (store word)
		opcode_tb <= "101011";
		WAIT FOR 600 ns;
		
		-- bne (branch not equal)
		opcode_tb <= "000101";
		WAIT FOR 600 ns;
		
		-- runs for 3000 ns

	END PROCESS;

END test;

