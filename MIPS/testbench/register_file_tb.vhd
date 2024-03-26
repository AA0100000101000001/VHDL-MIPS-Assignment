LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY register_file_tb is
END register_file_tb;

ARCHITECTURE test OF register_file_tb IS

	COMPONENT register_file PORT(
		rAddr1: in std_logic_vector(4 downto 0);
		rAddr2: in std_logic_vector(4 downto 0);
		wAddr : in std_logic_vector(4 downto 0);
    wD : in std_logic_vector(31 downto 0);
		RegWrite : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		rD1 : out std_logic_vector(31 downto 0);
 		rD2 : out std_logic_vector(31 downto 0));
	END COMPONENT;

  -- inputs
	SIGNAL rAddr1_tb : std_logic_vector(4 downto 0);
	SIGNAL rAddr2_tb : std_logic_vector(4 downto 0);
	SIGNAL wAddr_tb : std_logic_vector(4 downto 0);
	SIGNAL wD_tb : std_logic_vector(31 downto 0);
	SIGNAL RegWrite_tb : std_logic;
	SIGNAL clk_tb : std_logic;
	SIGNAL reset_tb : std_logic;
	
	-- outputs
 	SIGNAL rD1_tb : std_logic_vector(31 downto 0);
 	SIGNAL rD2_tb : std_logic_vector(31 downto 0);

BEGIN
	
	U1: register_file PORT MAP (
		rAddr1 => rAddr1_tb,
		rAddr2 => rAddr2_tb,
		wAddr => wAddr_tb,
		wD => wD_tb,
		RegWrite => RegWrite_tb,
		clk => clk_tb,
		reset => reset_tb,
		rD1 => rD1_tb,
		rD2 => rD2_tb);

	-- clock process
	clk_p: PROCESS
	BEGIN

		clk_tb <= '1';
		WAIT FOR 300 ns;
		clk_tb <= '0';
		WAIT FOR 300 ns;

	END PROCESS clk_p;

	-- stimulus process
	PROCESS
	BEGIN

    -- reset
		reset_tb <= '1';
		rAddr1_tb <= "00000";
		rAddr2_tb <= "00000";
		WAIT FOR 600 ns;

		-- write to register
		reset_tb <= '0';
		RegWrite_tb <= '1';
		
		wAddr_tb <= "00000";
		wD_tb <= x"00000000";
		WAIT FOR 600 ns;

		wAddr_tb <= "00001";
		wD_tb <= x"11111111";
		WAIT FOR 600 ns;

		wAddr_tb <= "00010";
		wD_tb <= x"22222222";
		WAIT FOR 600 ns;

		wAddr_tb <= "00011";
		wD_tb <= x"33333333";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "00100";
		wD_tb <= x"44444444";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "00101";
		wD_tb <= x"55555555";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "00110";
		wD_tb <= x"66666666";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "00111";
		wD_tb <= x"77777777";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01000";
		wD_tb <= x"88888888";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01001";
		wD_tb <= x"99999999";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01010";
		wD_tb <= x"AAAAAAAA";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01011";
		wD_tb <= x"BBBBBBBB";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01100";
		wD_tb <= x"CCCCCCCC";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01101";
		wD_tb <= x"DDDDDDDD";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01110";
		wD_tb <= x"EEEEEEEE";
		WAIT FOR 600 ns;
		
		wAddr_tb <= "01111";
		wD_tb <= x"FFFFFFFF";
		WAIT FOR 600 ns;

		-- read from register
		RegWrite_tb <= '0';
		rAddr1_tb <= "00010";
		rAddr2_tb <= "00011";
		WAIT FOR 600 ns;

		
		-- runs for 10800 ns

	END PROCESS;

END test;
