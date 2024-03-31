LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY upcount IS PORT (
	Clear, Clock : IN STD_LOGIC ;
	Q : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) ) ;
END upcount ;

architecture behavioral of upcount is
	signal count: std_logic_vector(1 downto 0);
begin
	process (clock, clear)
	begin
		if rising_edge(clock) then
			if Clear = '1' then
				count <= "00";
			else
				count <= count + 1;
			end if;
		end if;
	end process;
	Q <= count;
end behavioral;