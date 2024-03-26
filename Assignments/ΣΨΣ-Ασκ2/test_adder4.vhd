library IEEE;
use IEEE.std_logic_1164.all;

entity test_adder4 is
end test_adder4;

architecture test of test_adder4 is
  
  signal A, B, s1: std_logic_vector(3 DOWNTO 0);
  signal ci1, co1: std_logic;
  
  component adder4 port (
    Cin : IN std_logic;
    X, Y : IN std_logic_vector(3 DOWNTO 0);
    S : OUT std_logic_vector(3 DOWNTO 0);
    Cout : OUT std_logic);
  end component;
  
begin
  a1: adder4 port map (
    Cin => ci1,
    X => A,
    Y => B,
    S => s1,
    Cout => co1);
    
  process
  begin
    A <= "0000"; B <= "0000"; ci1 <= '0'; wait for 20 ps;
    A <= "1111"; B <= "1111"; ci1 <= '0'; wait for 20 ps;
    A <= "1111"; B <= "1111"; ci1 <= '1'; wait for 20 ps;
    
    A <= "0011"; B <= "0101"; ci1 <= '0'; wait for 20 ps;
    A <= "1110"; B <= "0011"; ci1 <= '0'; wait for 20 ps;
    A <= "1000"; B <= "0111"; ci1 <= '0'; wait for 20 ps;
    
  end process;
end test;
