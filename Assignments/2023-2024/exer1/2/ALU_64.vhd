library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity ALU64 is port (
	-- ALU inputs
	D1 : in std_logic_vector(63 downto 0);
	D2 : in std_logic_vector(63 downto 0);
	operation : in std_logic_vector(3 downto 0);
	-- ALU outputs
	alu_res : out std_logic_vector(63 downto 0);
	zero : out std_logic
	);
end ALU;

architecture behavioral of ALU is

	signal res : std_logic_vector(63 downto 0);

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
