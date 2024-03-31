library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity ALU_reg is 
generic (
	N : integer := 32
);
port (
	-- ALU inputs from registers
	D1 : in std_logic_vector(N-1 downto 0);
	D2 : in std_logic_vector(N-1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	clk : in std_logic; -- clock
	res : in std_logic; -- reset
	-- ALU outputs from register
	alu_reg_out : out std_logic_vector(N-1 downto 0);
	zero : out std_logic
	);
end ALU_reg;

architecture structural of ALU_reg is

	-- Register
	component regxbit
	port (
		D: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Resetn, Clock: IN STD_LOGIC
	);
	end component;
		
	-- ALU
	component ALUxbit
	port (
		-- ALU inputs
		D1 : in std_logic_vector(N-1 downto 0);
		D2 : in std_logic_vector(N-1 downto 0);
		operation : in std_logic_vector(3 downto 0);
		-- ALU outputs
		alu_res : out std_logic_vector(N-1 downto 0);
		zero : out std_logic
	);
	end component;

	signal clk_in : std_logic; -- clock
	signal res_in : std_logic; -- reset
	signal oper : std_logic_vector(3 downto 0); -- entity operation
	signal input1, input2 : std_logic_vector(N-1 downto 0); -- entity inputs
	signal alu_in1, alu_in2 : std_logic_vector(N-1 downto 0); -- alu inputs
	signal alu_out : std_logic_vector(N-1 downto 0); -- alu output

begin

	clk_in <= clk;
	res_in <= res;
	oper <= operation;
	input1 <= D1;
	input2 <= D2;

	-- Input to first register
	reg_in1: regxbit port map (
		D => input1,
		Q => alu_in1,
		Resetn => res_in,
		Clock => clk_in);

	-- Input to second register
	reg_in2: regxbit port map (
		D => input2,
		Q => alu_in2,
		Resetn => res_in,
		Clock => clk_in);
	
	-- ALU
	ALU_U: ALUxbit port map (
		D1 => alu_in1,
		D2 => alu_in2,
		operation => oper,
		alu_res => alu_out,
		zero => zero);

	-- Output to register
	reg_out: regxbit port map (
		D => alu_out,
		Q => alu_reg_out,
		Resetn => res_in,
		Clock => clk_in);
		
	
end structural;
