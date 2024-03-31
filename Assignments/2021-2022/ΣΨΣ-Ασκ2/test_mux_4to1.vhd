library IEEE;
use IEEE.std_logic_1164.all;

entity test_mux_4to1 is
end test_mux_4to1;

architecture test of test_mux_4to1 is
signal A1: std_logic_vector(4 downto 1);
signal s1: std_logic_vector(2 downto 1);
signal d1: std_logic;
component mux_4to1 port (a: in std_logic_vector(4 downto 1); s: in std_logic_vector(2 downto 1); d: out std_logic);
end component;

begin
  M1: mux_4to1 PORT MAP (a=>A1, s=>s1, d=>d1);
  process
  begin
    A1 <= "0000"; S1 <= "00"; wait for 20 ps;
    A1 <= "0101"; S1 <= "01"; wait for 20 ps;
    A1 <= "1010"; S1 <= "10"; wait for 20 ps;
    A1 <= "1100"; S1 <= "11"; wait for 20 ps;
  end process;
end test;
