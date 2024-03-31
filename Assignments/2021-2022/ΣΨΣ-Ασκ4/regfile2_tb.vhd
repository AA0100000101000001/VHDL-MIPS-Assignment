LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY regfile2_tb is
END regfile2_tb;

ARCHITECTURE test OF regfile2_tb IS

	CONSTANT dw : natural := 4;
	CONSTANT size : natural := 4;
	CONSTANT adrw : natural := 2;

	COMPONENT regfile2 PORT(
		A : in std_logic_vector(dw-1 downto 0);
		rAddr1: in std_logic_vector(adrw-1 downto 0);
		rAddr2: in std_logic_vector(adrw-1 downto 0);
		wAddr : in std_logic_vector(adrw-1 downto 0);
		we : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		B : out std_logic_vector(dw-1 downto 0);
 		C : out std_logic_vector(dw-1 downto 0));
	END COMPONENT;

	SIGNAL A_tb : std_logic_vector(dw-1 downto 0);
	SIGNAL rAddr1_tb : std_logic_vector(adrw-1 downto 0);
	SIGNAL rAddr2_tb : std_logic_vector(adrw-1 downto 0);
	SIGNAL wAddr_tb : std_logic_vector(adrw-1 downto 0);
	SIGNAL we_tb : std_logic;
	SIGNAL clk_tb : std_logic;
	SIGNAL reset_tb : std_logic;
 	SIGNAL C_tb : std_logic_vector(dw-1 downto 0);
 	SIGNAL B_tb : std_logic_vector(dw-1 downto 0);

BEGIN
	
	U1: regfile2 PORT MAP (
		A => A_tb,
		rAddr1 => rAddr1_tb,
		rAddr2 => rAddr2_tb,
		wAddr => wAddr_tb,
		we => we_tb,
		clk => clk_tb,
		reset => reset_tb,
		C => C_tb,
		B => B_tb);

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
		reset_tb <= '0';
		rAddr1_tb <= "00";
		rAddr2_tb <= "00";
		we_tb <= '1';
		wAddr_tb <= "00";
		A_tb <= "0101";
		WAIT FOR 600 ns;

		wAddr_tb <= "01";
		A_tb <= "1010";
		WAIT FOR 600 ns;

		wAddr_tb <= "10";
		A_tb <= "0000";
		WAIT FOR 600 ns;

		wAddr_tb <= "11";
		A_tb <= "1111";
		WAIT FOR 600 ns;

		-- read from register
		we_tb <= '0';
		rAddr1_tb <= "10";
		rAddr2_tb <= "11";
		WAIT FOR 600 ns;

		-- reset
		reset_tb <= '1';
		rAddr1_tb <= "00";
		rAddr2_tb <= "00";
		WAIT FOR 600 ns;

	END PROCESS;

END test;
