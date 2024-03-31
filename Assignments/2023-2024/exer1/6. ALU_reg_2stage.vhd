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
	clk : in std_logic; -- clock
	res : in std_logic; -- reset
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
		
	-- ALU register 1 stage pipeline
	component ALU_reg
	port (
		-- ALU inputs
		D1 : in std_logic_vector(N-1 downto 0);
		D2 : in std_logic_vector(N-1 downto 0);
		operation : in std_logic_vector(3 downto 0);
		clk : in std_logic; -- clock
		res : in std_logic; -- reset
		-- ALU outputs
		alu_reg_out : out std_logic_vector(N-1 downto 0);
		zero : out std_logic
	);
	end component;

	signal clk_in : std_logic; -- clock
	signal res_in : std_logic; -- reset
	signal oper : std_logic_vector(3 downto 0); -- entity operation
	signal input1, input2 : std_logic_vector(N-1 downto 0); -- entity inputs
	signal alu_out : std_logic_vector(N-1 downto 0); -- alu output

begin

	clk_in <= clk;
	res_in <= res;
	oper <= operation;
	input1 <= D1;
	input2 <= D2;
	
	-- ALU
	ALU_reg_U: ALU_reg port map (
		D1 => input1,
		D2 => input2,
		operation => oper,
		clk => clk_in,
		res => res_in,
		alu_reg_out => alu_out, -- 1 stage pipeline
		zero => zero);

	-- Output to second register
	reg_in2: regxbit port map (
		D => alu_out,
		Q => alu_reg_out, -- 2 stage pipeline
		Resetn => res_in,
		Clock => clk_in);
		
	
end structural;
