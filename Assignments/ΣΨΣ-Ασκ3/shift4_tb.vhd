LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity shift4_tb is
end shift4_tb;

architecture test of shift4_tb is
	signal clock_t: std_logic;
	signal Q_t: std_logic_vector(3 downto 0);
	signal enable_t, sin_t: std_logic;

	component shift4 port(
		Enable : IN STD_LOGIC;
		Sin : IN STD_LOGIC;
		Clock : IN STD_LOGIC;
		Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) );
	end component;

begin
	S1: shift4 port map (
		Enable => enable_t,
		Sin => sin_t,
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
		enable_t <= '1';
		sin_t <= '1';
		wait for 500 ns;
		sin_t <= '0';
		wait for 500 ns;
	end process stim_p;

end test;
