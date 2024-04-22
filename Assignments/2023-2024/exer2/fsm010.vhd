library ieee;
use ieee.std_logic_1164.all;

entity fsm010 is
port (
	clk, reset, sm_in : in std_logic;
	sm_out : out std_logic
);
end entity;

architecture behavioral of fsm010 is

	-- register
	--component reg1bit port (
	--	D: in std_logic;
	--	Resetn, Clock: in std_logic;
	--	Q: out std_logic);
	--end component;

	-- register signals
	--signal res_in, clk_in : std_logic;
	--signal reg_in, reg_sm_out: std_logic;
	
	-- state signals
	type state_type is (s1, s2, s3, s4);
	signal state : state_type;

begin

	--clk_in <= clk;
	--res_in <= reset;

	--reg_input: reg1bit port map (
	--	D => sm_in,
	--	Resetn => reset,
	--	Clock => clk_in,
	--	Q => reg_in);

	--reg_out: reg1bit port map (
	--	D => reg_sm_out,
	--	Resetn => reset,
	--	Clock => clk_in,
	--	Q => sm_out);

	process(clk)
	begin
	
	if rising_edge(clk) then
		if (reset = '1') then
			state <= s1;
			sm_out <= '1';
		else
			case state is
				when s1 =>
					if sm_in = '1' then
						state <= s1;
						sm_out <= '0';
					else
						state <= s2;
						sm_out <= '0';
					end if;
				when s2 =>
					if sm_in = '1' then
						state <= s3;
						sm_out <= '0';
					else
						state <= s2;
						sm_out <= '0';
					end if;
				when s3 =>
					if sm_in = '1' then
						state <= s1;
						sm_out <= '0';
					else
						state <= s4;
						sm_out <= '1';
					end if;
				when s4 =>
					if sm_in = '1' then
						state <= s1;
						sm_out <= '0';
					else
						state <= s2;
						sm_out <= '0';
					end if;
				when others =>
					state <= s1;
					sm_out <= '0';
			end case;
		end if;
	end if;
	end process;

end behavioral;