LIBRARY ieee ;
USE ieee.std_logic_1164.all;

entity latch_TB is
end latch_TB;

architecture test of latch_TB is
  
  signal en_t, d_t, q_t: std_logic;
  
  component latch is port ( 
    D : in std_logic;
    EN : in std_logic; 
    Q : out std_logic);
  end component;
  
begin
  L1: latch port map (D => d_t, EN => en_t, Q => q_t);
  
  en_p: process
    begin
      en_t <= '1'; 
      wait for 200 ns;
      en_t <= '0'; 
      wait for 200 ns;
  end process en_p;
  
  d_p: process
    begin
      d_t <= '1';
      wait for 250 ns;
      d_t <= '0';
      wait for 400 ns;
      d_t <= '1';
      wait for 300 ns;
      d_t <= '0';
      wait for 160 ns;
      d_t <= '1';
      wait for 60 ns;
      d_t <= '0';
      wait for 180 ns;
      d_t <= '1';
      wait for 200 ns;
      d_t <= '0';
      wait for 100 ns;
  end process d_p;
end test;
