library ieee;
use ieee.std_logic_1164.all;

entity control_unit is port (
	-- operation code for 31-26 of instruction memory
	opcode : in std_logic_vector(5 downto 0);
	-- control signals of operation
	RegDst : out std_logic;
	Branch : out std_logic;
	MemRead : out std_logic;
	MemtoReg : out std_logic;
	ALUOp : out std_logic_vector(1 downto 0);
	MemWrite : out std_logic;
	ALUSrc : out std_logic;
	RegWrite : out std_logic
	);
end control_unit;

architecture behavioral of control_unit is
begin
	process(opcode)
	begin
		
		case opcode is
			-- Register type instructions : add, sub
			when "000000" =>
				RegDst <= '1'; -- register address 15-11 to write
				Branch <= '0';
				MemRead <= '0';
				MemtoReg <= '0';
				ALUOp <= "10";
				MemWrite <= '0';
				ALUSrc <= '0';
				RegWrite <= '1'; -- write data to register address
			-- Immediate type instructions
			when "001000" => -- addi (add immediate word)
				RegDst <= '0'; -- register address 20-16 to write
				Branch <= '0';
				MemRead <= '0';
				MemtoReg <= '0';
				ALUOp <= "11";
				MemWrite <= '0';
				ALUSrc <= '1'; -- alu uses integer value 15-0
				RegWrite <= '1'; -- write data to register address
			when "100011" => -- lw (load word)
				RegDst <= '0';
				Branch <= '0';
				MemRead <= '1'; -- read from data memory
				MemtoReg <= '1';
				ALUOp <= "00";
				MemWrite <= '0';
				ALUSrc <= '1'; -- alu uses offset value 15-0
				RegWrite <= '1'; -- write data to register address
			when "101011" => -- sw (store word)
				RegDst <= 'X';
				Branch <= '0';
				MemRead <= '0';
				MemtoReg <= 'X';
				ALUOp <= "00";
				MemWrite <= '1'; -- write to data memory
				ALUSrc <= '1'; -- alu uses offset value 15-0
				RegWrite <= '0';
			when "000101" => -- bne (branch not equal)
				RegDst <= 'X';
				Branch <= '1'; -- add value to program counter if zero
				MemRead <= '0';
				MemtoReg <= 'X';
				ALUOp <= "01";
				MemWrite <= '0';
				ALUSrc <= '0'; 
				RegWrite <= '0';
			when others => NULL;
		end case;
	end process;
end behavioral;
