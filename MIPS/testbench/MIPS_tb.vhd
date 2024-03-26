library IEEE;
use IEEE.std_logic_1164.all;

entity MIPS_tb is
end MIPS_tb;

architecture test of MIPS_tb is
  
  component MIPS
  port (
    reset : in std_logic;
	  clk : in std_logic
	);
  end component;
  
  -- inputs
  signal reset_tb : std_logic;
  signal clk_tb : std_logic;

  
begin
  U1: MIPS port map (
    reset => reset_tb,
    clk => clk_tb);

  -- clock process
	clk_p: process
	begin
		clk_tb <= '1';
		wait for 5 ns;
		clk_tb <= '0';
		wait for 5 ns;
	end process clk_p;
    
  -- stimulus process
  process
    begin
      
      reset_tb <= '1';
      wait for 10 ns;
      
      reset_tb <= '0';
      wait for 220 ns;
      
      -- branch not equal
      wait for 50 ns;
      
      -- runs for 280 ns
      
  end process;
end test;
