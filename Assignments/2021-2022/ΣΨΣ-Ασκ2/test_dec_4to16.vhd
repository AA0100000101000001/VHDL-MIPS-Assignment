library IEEE;
use IEEE.std_logic_1164.all;

entity test_dec_4to16 is
end test_dec_4to16;

architecture test of test_dec_4to16 is
  
signal A1: std_logic_vector( 4 downto 1);
signal d1: std_logic_vector(16 downto 1);

component dec_4to16 port (
  a: in std_logic_vector( 4 downto 1);
  d: out std_logic_vector(16 downto 1));
end component;

begin
  M1: dec_4to16 PORT MAP (a=>A1, d=>d1);
  process
  begin
    A1 <= "0000"; wait for 20 ps;
    A1 <= "0001"; wait for 20 ps;
    A1 <= "0010"; wait for 20 ps;
    A1 <= "0011"; wait for 20 ps;
    A1 <= "0100"; wait for 20 ps;
    A1 <= "0101"; wait for 20 ps;
    A1 <= "0110"; wait for 20 ps;
    A1 <= "0111"; wait for 20 ps;
    A1 <= "1000"; wait for 20 ps;
    A1 <= "1001"; wait for 20 ps;
    A1 <= "1010"; wait for 20 ps;
    A1 <= "1011"; wait for 20 ps;
    A1 <= "1100"; wait for 20 ps;
    A1 <= "1101"; wait for 20 ps;
    A1 <= "1110"; wait for 20 ps;
    A1 <= "1111"; wait for 20 ps;
  end process;
end test;
