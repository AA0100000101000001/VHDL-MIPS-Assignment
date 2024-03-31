LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity my_register_tb is
end my_register_tb;

architecture test of my_register_tb is
  
  signal CLK_p: std_logic;
  signal D_p, Q_p: std_logic_vector(3 downto 0);
  signal clr_p: std_logic;
  
  component my_register is port ( 
    D : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    clr : in std_logic;
    Q : out std_logic_vector(3 downto 0));
  end component;
  
begin
  R1: my_register port map (D => D_p, CLK => CLK_p, clr => clr_p, Q => Q_p);
  
  clock_p: process
    begin
      CLK_p <= '1';
      wait for 300 ns;
      CLK_p <= '0';
      wait for 300 ns;
  end process clock_p;
  
  d_proc: process
    begin
      D_p <= "1111";
      wait for 400 ns;
      D_p <= "0000";
      wait for 600 ns;
      D_p <= "1111";
      wait for 300 ns;
      D_p <= "0000";
      wait for 300 ns;
      D_p <= "1111";
      wait for 650 ns;
      D_p <= "0000";
      wait for 150 ns;
  end process d_proc;
  
  clr_proc: process
  begin
    clr_p <= '1';
    wait for 1100 ns;
    clr_p <= '0';
    wait for 1300 ns;
  end process clr_proc;
end test;
