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
    
    signal add_alu_out : std_logic_vector(N-1 downto 0);
    signal sub_alu_out : std_logic_vector(N-1 downto 0);
    signal and_alu_out : std_logic_vector(N-1 downto 0);
    signal or_alu_out : std_logic_vector(N-1 downto 0);
    signal oper_reg1, oper_reg2 : std_logic_vector(3 downto 0);

    signal res_alu_out : std_logic_vector(N-1 downto 0);

begin
	
	alu_res <= res_alu_out;
	oper_reg1 <= operation;
	zero <= '1' when unsigned(res_alu_out) = 0 else
		  '0';

	process(clock)
	begin
	   
	   if rising_edge(clock) then
	   
        	add_alu_out <= std_logic_vector(unsigned(D1) + unsigned(D2));
        	sub_alu_out <= std_logic_vector(unsigned(D1) - unsigned(D2));
        	and_alu_out <= D1 and D2;
        	or_alu_out <= D1 OR D2;
        
        	oper_reg2 <= oper_reg1;
           
		-- operation check
		case oper_reg2 is
			-- addittion
			when "0011" => 
				res_alu_out <= add_alu_out;
			-- subtract
			when "0110" => 
				res_alu_out <= sub_alu_out;
			-- AND
			when "1000" => 
				res_alu_out <= and_alu_out;
			-- OR
			when "1001" => 
				res_alu_out <= or_alu_out;
			when others => 
			      null;
			--    res_alu_out <= (others => '0');
		end case;
	   end if;
	   
	end process;
end behavioral;
