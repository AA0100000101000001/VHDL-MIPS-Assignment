library IEEE;
use IEEE.std_logic_1164.all;

entity PC_tb is
end PC_tb;

architecture test of PC_tb is
  
  component PC
  port (
    PCin : in std_logic_vector(31 downto 0);
	  reset : in std_logic;
    clk : in std_logic;
    PCout : out std_logic_vector(31 downto 0)
  );
  end component;
  
  -- inputs
  signal PCin_tb : std_logic_vector(31 downto 0);
  signal reset_tb : std_logic;
  signal clk_tb : std_logic;
  
  -- output
  signal PCout_tb : std_logic_vector(31 downto 0);

  
begin
  U1: PC port map (
    PCin => PCin_tb,
    reset => reset_tb,
    clk => clk_tb,
    PCout => PCout_tb);

  -- clock process
	clk_p: process
	begin
		clk_tb <= '1';
		wait for 300 ns;
		clk_tb <= '0';
		wait for 300 ns;
	end process clk_p;
    
  -- stimulus process
  process
    begin
      
      reset_tb <= '1';
      wait for 600 ns;

      reset_tb <= '0';
      PCin_tb <= x"00000001";
      wait for 600 ns;
      
      PCin_tb <= x"00000002";
      wait for 600 ns;

      -- runs for 1800 ns
      
  end process;
end test;

