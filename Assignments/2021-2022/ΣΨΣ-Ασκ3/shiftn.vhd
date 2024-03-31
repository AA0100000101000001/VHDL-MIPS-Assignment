LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY shiftn IS 
	GENERIC ( N : INTEGER := 8 );

	PORT ( 
		D : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable : IN STD_LOGIC ;
		Load : IN STD_LOGIC ;
		Sin : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
END shiftn ;

architecture behavioral of shiftn is
	signal qt: std_logic_vector(N-1 downto 0);
begin
	process(clock)
	begin
		if rising_edge(clock) then
			if Load = '1' then
				qt <= D;
			elsif Enable = '1' then

				for i in 0 to N-2 loop
				  qt(i) <= qt(i+1);
				 end loop;

				qt(N-1) <= Sin;
			else
				qt <= (others => '0');
			end if;
		end if;
	end process;
	Q <= qt;
end behavioral;
