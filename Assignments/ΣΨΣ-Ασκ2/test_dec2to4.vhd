library IEEE;
use IEEE.std_logic_1164.all;

entity test_dec2to4 is
end test_dec2to4;

architecture test of test_dec2to4 is
  signal A1: std_logic_vector(2 downto 1);
  signal d1: std_logic_vector(4 downto 1);
  
  component dec2to4 port (
    a: in std_logic_vector(2 downto 1); 
    d: out std_logic_vector(4 downto 1));
  end component;

begin
  M1: dec2to4 PORT MAP (a=>A1, d=>d1);
  process
  begin
    A1 <= "00"; wait for 20 ps;
    A1 <= "01"; wait for 20 ps;
    A1 <= "10"; wait for 20 ps;
    A1 <= "11"; wait for 20 ps;
  end process;
end test;
