library ieee;
use ieee.std_logic_1164.all;

entity MIPS is port (
	-- MIPS inputs
	reset : in std_logic;
	clk : in std_logic
	);
end MIPS;

architecture structural of MIPS is
  
  signal MIPS_clk : std_logic;
  signal MIPS_reset : std_logic;
  
  -- 1. ALU component
  component ALU
  port (
    D1 : in std_logic_vector(31 downto 0);
    D2 : in std_logic_vector(31 downto 0);
    operation : in std_logic_vector(3 downto 0);
    alu_res : out std_logic_vector(31 downto 0);
    zero : out std_logic); -- zero
  end component;
  
  -- ALU inputs and outputs
  signal ALU_D1 : std_logic_vector(31 downto 0);
  signal ALU_D2 : std_logic_vector(31 downto 0);
  signal ALU_alu_res : std_logic_vector(31 downto 0);
  signal ALU_zero : std_logic;
  
  -- 2. Register file component
  component register_file
  port (
    rAddr1: in std_logic_vector(4 downto 0);
		rAddr2: in std_logic_vector(4 downto 0);
		wAddr : in std_logic_vector(4 downto 0);
    wD : in std_logic_vector(31 downto 0);
		RegWrite : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		rD1 : out std_logic_vector(31 downto 0);
 		rD2 : out std_logic_vector(31 downto 0));
 	end component;
 	
 	-- Register file inputs and outputs
 	signal RF_rAddr1 : std_logic_vector(4 downto 0);
	signal RF_rAddr2 : std_logic_vector(4 downto 0);
	signal RF_wAddr : std_logic_vector(4 downto 0);
	signal RF_wD : std_logic_vector(31 downto 0);
 	signal RF_rD2 : std_logic_vector(31 downto 0);
 	
 	-- 3. Data memory component
 	component data_memory 
  port (
    address : in std_logic_vector(31 downto 0);
    write_data : in std_logic_vector(31 downto 0);
	  clk : in std_logic;
	  reset : in std_logic;
    MemWrite : in std_logic;
    MemRead : in std_logic;
    read_data : out std_logic_vector(31 downto 0));
  end component;
  
  -- Data memory output
  signal DM_read_data : std_logic_vector(31 downto 0);
  
  -- 4. Instruction memory component
  component instruction_memory
  port (
    read_address : in std_logic_vector(31 downto 0);
	  clk : in std_logic;
	  reset: in std_logic;
	  instruction : out std_logic_vector(31 downto 0));
  end component;
  
  -- Instruction memory output
  signal IM_instruction : std_logic_vector(31 downto 0);
  
  -- 5. Control unit component
  component control_unit
  port (
     opcode : in std_logic_vector(5 downto 0);
	   RegDst : out std_logic;
	   Branch : out std_logic;
	   MemRead : out std_logic;
	   MemtoReg : out std_logic;
	   ALUOp : out std_logic_vector(1 downto 0);
	   MemWrite : out std_logic;
	   ALUSrc : out std_logic;
	   RegWrite : out std_logic);
	 end component;
	 
	 -- Control unit input and outputs
	signal CU_opcode : std_logic_vector(5 downto 0);
	signal CU_RegDst : std_logic;
	signal CU_Branch : std_logic;
	signal CU_MemRead : std_logic;
	signal CU_MemtoReg : std_logic;
	signal CU_ALUOp : std_logic_vector(1 downto 0);
	signal CU_MemWrite : std_logic;
	signal CU_ALUSrc : std_logic;
	signal CU_RegWrite : std_logic;
	
	-- 6. ALU Control unit component
	component ALU_control 
  port (
    ALUop : in std_logic_vector(1 downto 0);
    funct : in std_logic_vector(5 downto 0);
    operation : out std_logic_vector(3 downto 0));
  end component;
  
  	-- ALU Control unit output
  signal ALUcu_operation : std_logic_vector(3 downto 0);
  
  -- 7. PC component
  component PC
  port (
    PCin : in std_logic_vector(31 downto 0);
	  reset : in std_logic;
    clk : in std_logic;
    PCout : out std_logic_vector(31 downto 0));
  end component;
  
  -- PC inputs and output
  signal PC_PCin : std_logic_vector(31 downto 0);
  signal PC_PCout : std_logic_vector(31 downto 0);
  
  -- 8. Mux 2to1 5 bit component
  component mux2to1_5bit 
  port (
    a1: in std_logic_vector(4 downto 0);
    a2: in std_logic_vector(4 downto 0);
    s : in std_logic;
    d: out std_logic_vector(4 downto 0));
  end component;
  
  -- 9. Sign extender component
  component sign_extender 
  port (
    sin : in std_logic_vector(15 downto 0);
    sout: out std_logic_vector(31 downto 0));
  end component;
  
  -- Sign extender output
  signal SE_sout: std_logic_vector(31 downto 0);
  
  -- 10, 11, 12. Mux 2to1 32 bit component
  component mux2to1_32bit 
  port (
    a1: in std_logic_vector(31 downto 0);
    a2: in std_logic_vector(31 downto 0);
    s : in std_logic;
    d: out std_logic_vector(31 downto 0));
  end component;
  
  -- 12. Mux 2to1 32 bit output
  signal Mux2to132b_2s : std_logic;
  
  -- 13. Shift left by 2 component
  component shift_left2_32bit 
  port (
    sin : in std_logic_vector(31 downto 0);
    sout: out std_logic_vector(31 downto 0));
  end component;
  
  -- Shift left by 2 output
  -- signal SL_sout: std_logic_vector(31 downto 0);
  
  -- 14, 15. Adder component
  component adder_32bit 
  port (
    a, b : in std_logic_vector(31 downto 0);
    cout: out std_logic_vector(31 downto 0));
  end component;
  
  -- Adder outputs
  signal Add_cout: std_logic_vector(31 downto 0);
  signal Add1_cout: std_logic_vector(31 downto 0);
  
begin
  
  MIPS_clk <= clk;
  MIPS_reset <= reset;
  
  -- ALU
  U1: ALU port map (
    D1 => ALU_D1,
    D2 => ALU_D2,
    operation => ALUcu_operation,
    alu_res => ALU_alu_res,
    zero => ALU_zero);
    
  -- Register file
  U2: register_file port map (
		rAddr1 => RF_rAddr1,
		rAddr2 => RF_rAddr2,
		wAddr => RF_wAddr,
		wD => RF_wD,
		RegWrite => CU_RegWrite,
		clk => MIPS_clk,
		reset => MIPS_reset,
		rD1 => ALU_D1,
		rD2 => RF_rD2);
		
		RF_rAddr1 <= IM_instruction(25 downto 21);
		RF_rAddr2 <= IM_instruction(20 downto 16);
		
	-- Data memory
	U3: data_memory port map (
    address  => ALU_alu_res,
    write_data => RF_rD2,
		clk => MIPS_clk,
		reset => MIPS_reset,
    MemWrite => CU_MemWrite,
    MemRead => CU_MemRead,
    read_data => DM_read_data);
    
  -- Instruction memory
  U4: instruction_memory port map (
    read_address => PC_PCout,
    clk => MIPS_clk,
    reset => MIPS_reset,
    instruction => IM_instruction);
    
  -- Control unit
  U5: control_unit PORT MAP (
		opcode => CU_opcode,
		RegDst => CU_RegDst,
		Branch => CU_Branch,
		MemRead => CU_MemRead,
		MemtoReg => CU_MemtoReg,
		ALUOp => CU_ALUOp,
		MemWrite => CU_MemWrite,
		ALUSrc => CU_ALUSrc,
		RegWrite => CU_RegWrite);
		
		CU_opcode <= IM_instruction(31 downto 26);
		
	-- ALU Control unit
	U6: ALU_control port map (
    ALUop => CU_ALUOp,
    funct => IM_instruction(5 downto 0),
    operation => ALUcu_operation);
    
  -- PC
  U7: PC port map (
    PCin => PC_PCin,
    reset => MIPS_reset,
    clk => MIPS_clk,
    PCout => PC_PCout);
    
  -- Register destination Mux 2to1 5 bit
  U8: mux2to1_5bit port map (
    a1 => IM_instruction(15 downto 11),
    a2 => IM_instruction(20 downto 16),
    s => CU_RegDst, -- if 0 then a2 else a1
    d => RF_wAddr);
    
  -- Sign extender
  U9: sign_extender port map (
    sin => IM_instruction(15 downto 0),
    sout => SE_sout); 
    
  -- Muxs 2to1 32 bit
  -- ALU source mux
  U10: mux2to1_32bit port map (
    a1 => SE_sout,
    a2 => RF_rD2,
    s => CU_ALUSrc,  -- if 0 then a2 else a1
    d => ALU_D2);
    
  -- Memory to Register file mux
  U11: mux2to1_32bit port map (
    a1 => DM_read_data,
    a2 => ALU_alu_res,
    s => CU_MemtoReg,  -- if 0 then a2 else a1
    d => RF_wD);
    
  -- Branch mux
  U12: mux2to1_32bit port map (
    a1 => Add_cout,
    a2 => Add1_cout,
    s => Mux2to132b_2s, -- if 0 then a2 else a1
    d => PC_PCin);
    
  -- And
  Mux2to132b_2s <= (not ALU_zero) and CU_Branch;
    
--  -- Shift left by 2
--  U13: shift_left2_32bit port map (
--    sin => SE_sout,
--    sout => SL_sout);
    
  -- Adders
  U14: adder_32bit port map (
    a => PC_PCout,
    b => x"00000001",
    cout => Add1_cout);
    
  U15: adder_32bit port map (
    a => Add1_cout,
    b => SE_sout,
    cout => Add_cout);
  
end structural;
