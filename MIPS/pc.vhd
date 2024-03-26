library ieee;
use ieee.std_logic_1164.all;

entity PC is port (
	-- PC inputs
	PCin : in std_logic_vector(31 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	-- PC output
	PCout : out std_logic_vector(31 downto 0)
	);
end PC;

architecture behavioral of PC is
  signal pout: std_logic_vector(31 downto 0);
  
begin
	process(clk, reset)
	begin
	  if reset = '1' then
	    pout <= x"00000000";
	  end if;
	  if (clk'event and clk='1') then
		  pout <= PCin;
		end if;
	end process;
	PCout <= pout;
end behavioral;
