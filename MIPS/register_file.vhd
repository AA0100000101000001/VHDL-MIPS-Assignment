library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity register_file is port (	
    -- number of address bits = 5
		rAddr1: in std_logic_vector(4 downto 0);
		rAddr2: in std_logic_vector(4 downto 0);
		wAddr : in std_logic_vector(4 downto 0);
		--  number of bits = 32
    wD : in std_logic_vector(31 downto 0);
		RegWrite : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		rD1 : out std_logic_vector(31 downto 0);
 		rD2 : out std_logic_vector(31 downto 0));
end register_file;

architecture behavioral of register_file is

	type regArray is array(0 to 15) of std_logic_vector(31 downto 0);

	signal regfile : regArray;
begin
	process(clk, reset)
	begin
	  -- reset
		if reset = '1' then
			regfile <= (others => (others => '0'));
		end if;
 		if (clk'event and clk='1') then
 		  -- write to register
 			if RegWrite='1' then
 				regfile(to_integer(unsigned(wAddr))) <= wD;
 			end if;
 		end if;
	end process;
	-- read from register
	rD1 <= regfile(to_integer(unsigned(rAddr1)));
	rD2 <= regfile(to_integer(unsigned(rAddr2)));
end behavioral;
