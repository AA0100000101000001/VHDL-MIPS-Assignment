library ieee;
use ieee.std_logic_1164.all;

entity fsm010_tb is
end fsm010_tb;

architecture test of fsm010_tb is

	component fsm010
	port (
		clk, reset, sm_in : in std_logic;
		sm_out : out std_logic
	);
	end component;

	-- signals
	signal clk_tb, reset_tb, input_tb : std_logic;
	signal sm_out_tb : std_logic;

begin
	U1: fsm010 port map (
		clk => clk_tb,
		reset => reset_tb,
		sm_in => input_tb,
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
		input_tb <= '0';
		wait for 500 ns;

		input_tb <= '1';
		wait for 200 ns;

		input_tb <= '0';
		wait for 800 ns;
		

	end process;
end test;