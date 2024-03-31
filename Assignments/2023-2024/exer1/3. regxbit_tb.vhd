LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg32_tb is
END reg32_tb;

ARCHITECTURE test OF reg32_tb IS

	COMPONENT regxbit PORT(
		D: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		Resetn, Clock: IN STD_LOGIC;
		Q: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;

	SIGNAL D_tb, Q_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL Resetn_tb, Clock_tb: STD_LOGIC;

BEGIN
	
	U1: regxbit PORT MAP (
		D => D_tb,
		Resetn => Resetn_tb,
		Clock => Clock_tb,
		Q => Q_tb);

	-- clock process
	clk_p: PROCESS
	BEGIN

		Clock_tb <= '1';
		WAIT FOR 300 ns;
		Clock_tb <= '0';
		WAIT FOR 300 ns;

	END PROCESS clk_p;

	-- stimulus process
	PROCESS
	BEGIN

		--One cycle equals 3000 ns

		-- write to register
		Resetn_tb <= '1';
		WAIT FOR 600 ns;
		
		D_tb <= x"00000010";
		WAIT FOR 600 ns;

		D_tb <= x"00001110";
		WAIT FOR 600 ns;

		D_tb <= x"00001010";
		WAIT FOR 600 ns;

		-- reset
		Resetn_tb <= '0';
		WAIT FOR 600 ns;


	END PROCESS;

END test;
