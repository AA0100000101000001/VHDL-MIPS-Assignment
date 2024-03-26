library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity instruction_memory is port (
	-- MIPS inputs
	read_address : in std_logic_vector(31 downto 0);
	clk : in std_logic;
	reset: in std_logic;
	-- instruction memory output
	instruction : out std_logic_vector(31 downto 0)
	);
end instruction_memory;

architecture behavioral of instruction_memory is

	type instr_mem_array is array(0 to 15) of std_logic_vector(31 downto 0);

	-- instruction memory initilization
	signal instr_mem_file : instr_mem_array := (
		x"20000000", -- 0x0000 0000: addi $0, $0, 0		(001000 00000 00000 00000 00000 000000)
		x"20420000", -- 0x0000 0001: addi $2, $2, 0		(001000 00010 00010 00000 00000 000000)
		x"20820000", -- 0x0000 0002: addi $2, $4, 0		(001000 00100 00010 00000 00000 000000)
		x"20030001", -- 0x0000 0003: addi $3, $0, 1		(001000 00000 00011 00000 00000 000001)
		x"20050003", -- 0x0000 0004: addi $5, $0, 3		(001000 00000 00101 00000 00000 000011)
		x"00603020", -- 0x0000 0005: L1: add $6, $3, $0		(000000 00011 00000 00110 00000 100000)
		x"AC860000", -- 0x0000 0006: sw $6, 0($4)		(101011 00100 00110 00000 00000 000000)
		x"20630001", -- 0x0000 0007: addi $3, $3, 1		(001000 00011 00011 00000 00000 000001)
		x"20840001", -- 0x0000 0008: addi $4, $4, 1		(001000 00100 00100 00000 00000 000001)
		x"20A5FFFF", -- 0x0000 0009: addi $5, $5, -1		(001000 00101 00101 11111 11111 111111)
		x"14A0FFF9", -- 0x0000 000A: bne $5, $0, L1		(000101 00101 00000 11111 11111 111001)
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000");
		
begin
	process(clk, reset)
	begin
	  if (reset = '1') then
	    instruction <= x"00000000";
	  end if;
	  if (clk'event and clk='1') then
		  instruction <= instr_mem_file(to_integer(unsigned(read_address)));
    end if;	
	end process;
end behavioral;
