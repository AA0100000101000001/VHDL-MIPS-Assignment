library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity ALU is port (
	-- ALU inputs
	D1 : in std_logic_vector(31 downto 0);
	D2 : in std_logic_vector(31 downto 0);
	operation : in std_logic_vector(3 downto 0);
	-- ALU outputs
	alu_res : out std_logic_vector(31 downto 0);
	zero : out std_logic
	);
end ALU;

architecture behavioral of ALU is

	signal res : std_logic_vector(31 downto 0);

begin
	process(D1, D2, operation)
	begin
		case operation is
			-- addittion
			when "0011" =>
				res <= std_logic_vector(unsigned(D1) + unsigned(D2));
			-- subtraction
			when "0110" =>
				res <= std_logic_vector(unsigned(D1) - unsigned(D2));
			-- mutliplication
			--when "0010" =>
			--	res<= std_logic_vector(to_unsigned((to_integer(unsigned(D1)) * to_integer(unsigned(D2))),8));
			-- AND
			when "1000" =>
				res <= D1 and D2;
			-- OR
			when "1001" =>
				res <= D1 OR D2;
			when others => NULL;
		end case;
	end process;
	alu_res <= res;
	zero <= '1' when res = x"00000000" else
			'0';
end behavioral;
