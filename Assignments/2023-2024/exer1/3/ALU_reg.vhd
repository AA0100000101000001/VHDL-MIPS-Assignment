library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity ALU_reg is port (
	-- ALU inputs
	D1 : in std_logic_vector(31 downto 0);
	D2 : in std_logic_vector(31 downto 0);
	operation : in std_logic_vector(3 downto 0);
	-- ALU outputs
	alu_res : out std_logic_vector(31 downto 0);
	zero : out std_logic
	);
end ALU;

architecture structural of ALU_reg is

	-- Register 1
	component reg1
	port (
		D: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		Resetn, Clock: IN STD_LOGIC
	);
	end component;
		
	-- ALU
	component ALU
	port (
		-- ALU inputs
		D1 : in std_logic_vector(31 downto 0);
		D2 : in std_logic_vector(31 downto 0);
		operation : in std_logic_vector(3 downto 0);
		-- ALU outputs
		alu_res : out std_logic_vector(31 downto 0);
		zero : out std_logic
	);
	end component;
	
	-- Register 2
	component reg2
	port (
		D: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		Q: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		Resetn, Clock: IN STD_LOGIC
	);
	end component;
		
	signal res : std_logic_vector(31 downto 0);

begin
	process(D1, D2, operation)
	begin
		case operation is
				-- addittion
			when "0011" =>
				res <= std_logic_vector(unsigned(D1) + unsigned(D2));
				-- subtract
			when "0110" =>
				res <= std_logic_vector(unsigned(D1) - unsigned(D2));
			when others => NULL;
		end case;
	end process;
	alu_res <= res;
	zero <= '1' when res = x"00000000" else
			'0';
end behavioral;
