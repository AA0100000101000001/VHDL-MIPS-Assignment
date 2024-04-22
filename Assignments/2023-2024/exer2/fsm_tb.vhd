library ieee;
use ieee.std_logic_1164.all;

entity fsm_tb is
end fsm_tb;

architecture test of fsm_tb is

	component fsm
	port (
		clk, reset : in std_logic;
		sm_in : in std_logic_vector(7 downto 0);
		sm_out : out std_logic_vector(7 downto 0)
	);
	end component;

	-- signals
	signal clk_tb, reset_tb: std_logic;
	signal sm_in_tb : std_logic_vector(7 downto 0);
	signal sm_out_tb : std_logic_vector(7 downto 0);

begin
	U1: fsm port map (
		clk => clk_tb,
		reset => reset_tb,
		sm_in => sm_in_tb,
		sm_out => sm_out_tb);

	-- clock process
	clk_p: process
	begin
		clk_tb <= '0';
		wait for 100 ns;
		clk_tb <= '1';
		wait for 100 ns;
	end process clk_p;

	-- stimulus process
	process
	begin
		reset_tb <= '0';
		sm_in_tb <= x"08";
		wait for 300 ns;

		sm_in_tb <= x"03";
		wait for 200 ns;

		-- start state
		sm_in_tb <= x"00";
		wait for 200 ns;

		-- start adding 1
		sm_in_tb <= x"01";
		wait for 200 ns;

		sm_in_tb <= x"02";
		wait for 200 ns;

		sm_in_tb <= x"03";
		wait for 200 ns;

		sm_in_tb <= x"04";
		wait for 200 ns;

		sm_in_tb <= x"05";
		wait for 200 ns;

		sm_in_tb <= x"06";
		wait for 200 ns;

		sm_in_tb <= x"07";
		wait for 200 ns;

		sm_in_tb <= x"08";
		wait for 200 ns;

		sm_in_tb <= x"09";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns; -- end of state

		sm_in_tb <= x"0b";
		wait for 200 ns;

		sm_in_tb <= x"0b";
		wait for 200 ns;

		-- start state again
		sm_in_tb <= x"00";
		wait for 200 ns;

		sm_in_tb <= x"0b";
		wait for 200 ns;

		-- start state while inside state
		sm_in_tb <= x"00";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"ff";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns;

		sm_in_tb <= x"0a";
		wait for 200 ns; -- end of state

		sm_in_tb <= x"03";
		wait for 200 ns;

		sm_in_tb <= x"03";
		wait for 200 ns;

		-- duplicate third state
		sm_in_tb <= x"ff";
		wait for 200 ns;

		sm_in_tb <= x"02";
		wait for 200 ns;

		sm_in_tb <= x"02";
		wait for 200 ns;

		sm_in_tb <= x"02";
		wait for 200 ns;

		sm_in_tb <= x"02";
		wait for 200 ns;

		sm_in_tb <= x"02";
		wait for 200 ns;
		
		-- 7300 ns

	end process;
end test;