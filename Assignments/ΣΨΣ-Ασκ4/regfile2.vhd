library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity regfile2 is
	generic ( dw : natural := 4;
		size : natural := 4;
		adrw : natural := 2);
	port (	A : in std_logic_vector(dw-1 downto 0);
		rAddr1: in std_logic_vector(adrw-1 downto 0);
		rAddr2: in std_logic_vector(adrw-1 downto 0);
		wAddr : in std_logic_vector(adrw-1 downto 0);
		we : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		B : out std_logic_vector(dw-1 downto 0);
 		C : out std_logic_vector(dw-1 downto 0));
end regfile2;

architecture behavioral of regfile2 is

	type regArray is array(0 to size-1) of std_logic_vector(dw-1 downto 0);

	signal regfile : regArray;
begin
	process(clk)
	begin
		if reset = '1' then
			regfile <= (others => (others => '0'));
		end if;
 		if (clk'event and clk='0') then
 			if we='1' then
 				regfile(to_integer(unsigned(wAddr))) <= A;
 			end if;
 		end if;
		B <= regfile(to_integer(unsigned(rAddr1)));
		C <= regfile(to_integer(unsigned(rAddr2)));
	end process;
end behavioral;