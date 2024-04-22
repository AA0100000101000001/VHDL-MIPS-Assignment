library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity fsm is
port (
	clk, reset : in std_logic;
	sm_in : in std_logic_vector(7 downto 0);
	sm_out : out std_logic_vector(7 downto 0)
);
end entity;

architecture behavioral of fsm is

	-- register
	--component reg1bit port (
	--	D: in std_logic;
	--	Resetn, Clock: in std_logic;
	--	Q: out std_logic);
	--end component;

	-- register signals
	--signal res_in, clk_in : std_logic;
	--signal reg_in, reg_sm_out: std_logic;

	--signal cnt_0 : integer range 0 to 255 := 0;
	signal cnt_0 : std_logic_vector(7 downto 0) := x"00";
	signal duplication : std_logic_vector(15 downto 0);
	
	-- state signals
	type state_type is (s1, s2, s3, s4, s5);
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
			sm_out <= sm_in;
		else
			case state is
				when s1 =>
					-- data : 0
					if sm_in = x"00" then
						state <= s2;
						sm_out <= sm_in;
					-- duplicate third
					elsif sm_in = x"ff" then
						state <= s3;
						sm_out <= sm_in;
					else
						state <= s1;
						sm_out <= sm_in;
					end if;
				-- data : 0
				when s2 =>
					-- data : 0 when inside state
					if sm_in = x"00" then
						state <= s2;
						cnt_0 <= x"00"; -- reset counter
						sm_out <= sm_in;
					-- clipping
					elsif sm_in = x"ff" then
						state <= s2;
						sm_out <= sm_in;
						cnt_0 <= std_logic_vector(signed(cnt_0) + 1);
					else
						if cnt_0 <= x"09" then 
							state <= s2;
							sm_out <= std_logic_vector(signed(sm_in) + 1);
							cnt_0 <= std_logic_vector(signed(cnt_0) + 1);
						else
							state <= s1;
							sm_out <= sm_in;
							cnt_0 <= x"00";
						end if;
					end if;
				-- duplicate third: first number
				when s3 =>
					state <= s4;
					sm_out <= sm_in;
				-- duplicate third: second number
				when s4 =>
					state <= s5;
					sm_out <= sm_in;
				-- duplicate third: third number
				when s5 =>
					state <= s1;
					sm_out <= std_logic_vector(signed(sm_in) + 1);
				when others =>
					state <= s1;
					sm_out <= sm_in;
			end case;
		end if;
	end if;
	end process;

end behavioral;