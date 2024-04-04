library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity ALU_clkxbit is 
generic (
	N : integer := 32
);
port (
	-- ALU inputs
	D1 : in std_logic_vector(N-1 downto 0);
	D2 : in std_logic_vector(N-1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	resetn, clock: in std_logic;
	-- ALU outputs
	alu_res : out std_logic_vector(N-1 downto 0);
	zero : out std_logic
	);
end ALU_clkxbit;

architecture behavioral of ALU_clkxbit is

	signal res_alu_out : std_logic_vector(N-1 downto 0);
	signal res_reg_out : std_logic_vector(N-1 downto 0);

begin
	process(D1, D2, operation, resetn, clock)
	begin
		-- operation check
		case operation is
			-- addittion
			when "0011" =>
				res_alu_out <= std_logic_vector(unsigned(D1) + unsigned(D2));
			-- subtract
			when "0110" =>
				res_alu_out <= std_logic_vector(unsigned(D1) - unsigned(D2));
			-- AND
			when "1000" =>
				res_alu_out <= D1 and D2;
			-- OR
			when "1001" =>
				res_alu_out <= D1 OR D2;
			when others => NULL;
		end case;
		-- register check
		if resetn = '0' then
			res_reg_out <= (others => '0');
		elsif rising_edge(clock) then
			res_reg_out <= res_alu_out;
		end if;
	end process;
	alu_res <= res_reg_out;
	zero <= '1' when unsigned(res_reg_out) = 0 else
		'0';
end behavioral;
