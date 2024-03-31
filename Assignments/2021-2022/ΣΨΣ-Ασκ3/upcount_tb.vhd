LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity upcount_tb is
end upcount_tb;

architecture test of upcount_tb is
	signal clock_t: std_logic;
	signal Q_t: std_logic_vector(1 downto 0);
	signal clear_t: std_logic;

	component upcount port(
		clear, clock: in std_logic;
		Q: out std_logic_vector(1 downto 0));
	end component;

begin
	U1: upcount port map (
		clear => clear_t,
		clock => clock_t,
		Q => Q_t);

	--clock process
	clock_p: process
	begin
		clock_t <= '1';
		wait for 300 ns;
		clock_t <= '0';
		wait for 300 ns;
	end process clock_p;

	--stimulus process
	stim_p: process
	begin
		clear_t <= '1';
		wait for 2400 ns;
		clear_t <= '0';
		wait for 2400 ns;
	end process stim_p;

end test;
