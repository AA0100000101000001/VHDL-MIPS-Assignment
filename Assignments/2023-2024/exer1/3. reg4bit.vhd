LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg4bit IS 
PORT (
	D: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Resetn, Clock: IN STD_LOGIC;
	Q: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END reg4bit;

ARCHITECTURE behavioral OF reg4bit IS
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
