LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity shiftn_tb is
  GENERIC ( N : INTEGER := 8 );
end shiftn_tb;

architecture test of shiftn_tb is
	signal clock_t: std_logic;
	signal Q_t, D_t: std_logic_vector(N-1 downto 0);
	signal enable_t, load_t, sin_t: std_logic;

	component shiftn port(
		D : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Enable : IN STD_LOGIC ;
		Load : IN STD_LOGIC ;
		Sin : IN STD_LOGIC ;
		Clock : IN STD_LOGIC ;
		Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
	end component;

begin
	S1: shiftn port map (
		D => D_t,
		Enable => enable_t,
		Load => load_t,
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
		sin_t <= '1';
		wait for 600 ns;
		sin_t <= '0';
		wait for 600 ns;
	end process stim_p;
	
	--enable process
	en_p: process
	begin
		enable_t <= '0';
		wait for 600 ns;
		enable_t <= '1';
		wait for 5400 ns;
	end process en_p;
	  
	
	--enable parallel load procces
	load_p: process
	begin
		D_t <= "11111111";
		load_t <= '0';
		wait for 5400 ns;
		load_t <= '1';
		wait for 600 ns;
	end process load_p;

end test;
