library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity data_memory is port(
	-- data memory inputs
	address : in std_logic_vector(31 downto 0);
	write_data : in std_logic_vector(31 downto 0);
	clk : in std_logic;
	reset : in std_logic;
	MemWrite : in std_logic;
	MemRead : in std_logic;
	-- data memory output
	read_data : out std_logic_vector(31 downto 0)
	);
end data_memory;

architecture behavioral of data_memory is

	type data_mem_array is array(0 to 15) of std_logic_vector(31 downto 0);

	-- data memory file to zero
	signal data_mem_file : data_mem_array := ((others => (others => '0')));
	
begin
  
	process(clk, reset)
	begin
	  -- reset
		if reset = '1' then
			data_mem_file <= (others => (others => '0'));
		end if;
		-- clock
 		if (clk'event and clk='1') then
 		  
 		  if (MemWrite = '1') then
			 -- write data to address
			 data_mem_file(to_integer(unsigned(address))) <= write_data;
		  end if;
		  
		  if (MemRead = '1') then
			 -- read data from address
			 read_data <= data_mem_file(to_integer(unsigned(address)));
		  else read_data <= x"00000000";
		  end if;
 		end if;
 		
	end process;
end behavioral;
