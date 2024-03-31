LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity flipflop_re_tb is
end flipflop_re_tb;

architecture test of flipflop_re_tb is
  
  signal CLK_p, D_p, Q_p, Rstn_p: std_logic;
  
  component flipflop_re is port ( 
    D : in std_logic;
    CLK : in std_logic; 
    Rstn: in std_logic; 
    Q : out std_logic);
  end component;
  
begin
  F1: flipflop_re port map (D => D_p, CLK => CLK_p, Rstn => Rstn_p, Q => Q_p);
  
  clock_p: process
    begin
      CLK_p <= '1';
      wait for 300 ns;
      CLK_p <= '0';
      wait for 300 ns;
  end process clock_p;
  
  d_proc: process
    begin
      D_p <= '1';
      wait for 400 ns;
      D_p <= '0';
      wait for 600 ns;
      D_p <= '1';
      wait for 300 ns;
      D_p <= '0';
      wait for 300 ns;
      D_p <= '1';
      wait for 650 ns;
      D_p <= '0';
      wait for 150 ns;
  end process d_proc;
  
  reset_p: process
  begin
    Rstn_p <= '1';
    wait for 1100 ns;
    Rstn_p <= '0';
    wait for 1300 ns;
  end process reset_p;
end test;

