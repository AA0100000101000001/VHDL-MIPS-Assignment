library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity ALU_reg_2stage is 
generic (
	N : integer := 32
);
port (
	-- ALU inputs from registers
	D1 : in std_logic_vector(N-1 downto 0);
	D2 : in std_logic_vector(N-1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	res : in std_logic; -- reset
	clk : in std_logic; -- clock
	-- ALU outputs from register
	alu_reg_out : out std_logic_vector(N-1 downto 0);
	zero : out std_logic
	);
end ALU_reg_2stage;

architecture structural of ALU_reg_2stage is

	-- Register
	component regxbit
	port (
		D: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Resetn, Clock: IN STD_LOGIC
	);
	end component;
	
	-- Register 1 bit
	component reg1bit
	port (
		D: IN STD_LOGIC;
		Q: OUT STD_LOGIC;
		Resetn, Clock: IN STD_LOGIC
	);
	end component;
	
	-- Register 4 bit
	component reg4bit
	port (
		D: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		Resetn, Clock: IN STD_LOGIC
	);
	end component;
		
	-- ALU register 1 stage pipeline
	component ALU_clkxbit
	port (
		-- ALU inputs
		D1 : in std_logic_vector(N-1 downto 0);
		D2 : in std_logic_vector(N-1 downto 0);
		operation : in std_logic_vector(3 downto 0);
		resetn : in std_logic; -- reset
		clock : in std_logic; -- clock
		-- ALU outputs
		alu_res : out std_logic_vector(N-1 downto 0);
		zero : out std_logic
	);
	end component;

	signal clk_in : std_logic; -- clock
	signal res_in : std_logic; -- reset
	signal aluin_oper, regout_oper : std_logic_vector(3 downto 0); -- entity operation
	signal input1, input2 : std_logic_vector(N-1 downto 0); -- entity inputs
	signal alu_in1, alu_in2 : std_logic_vector(N-1 downto 0); -- alu inputs
	signal alu_out : std_logic_vector(N-1 downto 0); -- alu output
	signal zero_out : std_logic; -- zero

begin

	clk_in <= clk;
	res_in <= res;
	aluin_oper <= operation;
	input1 <= D1;
	input2 <= D2;

	-- D1 to register
	reg_in1: regxbit port map (
	  D => input1,
	  Q => alu_in1,
	  Resetn => res_in,
	  Clock => clk_in);

	-- D2 to register
	reg_in2: regxbit port map (
	  D => input2,
	  Q => alu_in2,
	  Resetn => res_in,
	  Clock => clk_in);
		
	-- operation to register
	reg_oper: reg4bit 
	   port map (
	   D => aluin_oper,
	   Q => regout_oper,
	   Resetn => res_in,
	   Clock => clk_in);
	
	-- ALU
	ALU_reg_U: ALU_clkxbit port map (
		D1 => input1,
		D2 => input2,
		operation => regout_oper,
		resetn => res_in,
		clock => clk_in,
		alu_res => alu_out, -- 1 stage pipeline
		zero => zero_out);

	-- ALU Output to second register
	reg_out: regxbit port map (
		D => alu_out,
		Q => alu_reg_out, -- 2 stage pipeline
		Resetn => res_in,
		Clock => clk_in);

	-- Zero Output to register
	ALU_zero_out: reg1bit  
	   port map (
		D => zero_out,
		Q => zero,
		Resetn => res_in,
		Clock => clk_in);
		
	
end structural;
