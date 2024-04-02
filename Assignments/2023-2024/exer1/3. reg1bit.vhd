LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg1bit IS 
PORT (
	D: IN STD_LOGIC;
	Resetn, Clock: IN STD_LOGIC;
	Q: OUT STD_LOGIC);
END reg1bit;

ARCHITECTURE behavioral OF reg1bit IS
BEGIN
	PROCESS (Resetn, Clock)
	 BEGIN
		 IF Resetn = '0' THEN
			 Q <= '0';
		 ELSIF rising_edge(Clock) THEN
			 Q <= D;
		 END IF;
	END PROCESS;
END behavioral;
