LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regxbit IS 
GENERIC (
	N : integer := 32
);
PORT (
	D: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	Resetn, Clock: IN STD_LOGIC;
	Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0));
END regxbit;

ARCHITECTURE behavioral OF regxbit IS
BEGIN
	PROCESS (Resetn, Clock)
	 BEGIN
		 IF Resetn = '0' THEN
			 Q <= (others => '0');
		 ELSIF rising_edge(Clock) THEN
			 Q <= D;
		 END IF;
	END PROCESS;
END behavioral;
