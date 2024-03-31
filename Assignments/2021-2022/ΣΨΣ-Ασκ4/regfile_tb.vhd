LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regfile_tb is
END regfile_tb;

ARCHITECTURE test OF regfile_tb IS

	CONSTANT dw : natural := 4;
	CONSTANT size : natural := 4;
	CONSTANT adrw : natural := 2;

	COMPONENT regfile PORT(
		A : in std_logic_vector(dw-1 downto 0);
		Addr : in std_logic_vector(adrw-1 downto 0);
		we : in std_logic;
		clk : in std_logic;
 		C : out std_logic_vector(dw-1 downto 0));
	END COMPONENT;

	SIGNAL A_tb : std_logic_vector(dw-1 downto 0);
	SIGNAL Addr_tb : std_logic_vector(adrw-1 downto 0);
	SIGNAL we_tb : std_logic;
	SIGNAL clk_tb : std_logic;
 	SIGNAL C_tb : std_logic_vector(dw-1 downto 0);

BEGIN
	
	U1: regfile PORT MAP (
		A => A_tb,
		Addr => Addr_tb,
		we => we_tb,
		clk => clk_tb,
		C => C_tb);

	-- clock process
	clk_p: PROCESS
	BEGIN

		clk_tb <= '0';
		WAIT FOR 300 ns;
		clk_tb <= '1';
		WAIT FOR 300 ns;

	END PROCESS clk_p;

	-- stimulus process
	PROCESS
	BEGIN

		-- write to register
		we_tb <= '1';
		Addr_tb <= "00";
		A_tb <= "0101";
		WAIT FOR 600 ns;

		Addr_tb <= "01";
		A_tb <= "1101";
		WAIT FOR 600 ns;

		Addr_tb <= "10";
		A_tb <= "0010";
		WAIT FOR 600 ns;

		Addr_tb <= "11";
		A_tb <= "1001";
		WAIT FOR 600 ns;

		-- read from register
		we_tb <= '0';
		Addr_tb <= "01";
		WAIT FOR 600 ns;

		Addr_tb <= "11";
		WAIT FOR 600 ns;

	END PROCESS;

END test;
