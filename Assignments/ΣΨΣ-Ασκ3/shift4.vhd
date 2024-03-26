LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY shift4 IS PORT ( 
	Enable : IN STD_LOGIC;
	Sin : IN STD_LOGIC;
	Clock : IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) );
END shift4;

architecture behavioral of shift4 is
	signal qt: std_logic_vector(3 downto 0);
begin
	process(clock)
	begin
		if rising_edge(clock) then
			if Enable = '0' then
				qt <= "0000";
			else 
				qt(3) <= Sin;
				qt(2) <= qt(3);
				qt(1) <= qt(2);
				qt(0) <= qt(1);
			end if;
		end if;
	end process;
	Q <= qt;
end behavioral;
