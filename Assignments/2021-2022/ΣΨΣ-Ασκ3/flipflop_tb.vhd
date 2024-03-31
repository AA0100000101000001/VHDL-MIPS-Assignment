LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity flipflop_TB is
end flipflop_TB;

architecture test of flipflop_TB is
  
  signal clk_t, d_t, q_t: std_logic;
  
  component flipflop is port ( 
    D : in std_logic;
    CLK : in std_logic; 
    Q : out std_logic);
  end component;
  
begin
  F1: flipflop port map (D => d_t, CLK => clk_t, Q => q_t);
  clock_p: process
    begin
        clk_t <= '1';
        wait for 300 ns;
        clk_t <= '0';
        wait for 300 ns;
  end process clock_p;
  
  d_p: process
    begin
      d_t <= '1';
      wait for 400 ns;
      d_t <= '0';
      wait for 600 ns;
      d_t <= '1';
      wait for 300 ns;
      d_t <= '0';
      wait for 300 ns;
      d_t <= '1';
      wait for 100 ns;
      d_t <= '0';
      wait for 200 ns;
      d_t <= '1';
      wait for 350 ns;
      d_t <= '0';
      wait for 150 ns;
  end process d_p;
end test;
