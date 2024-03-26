entity test_ha is
end test_ha;

architecture test of test_ha is
  
  signal A1, B1, S1, C1: bit;

  component ha port (
    A, B: in bit; 
    S, C: out bit);
  end component;

begin
  M1: ha PORT MAP (A=>A1, B=>B1, S=>s1, C=>c1);
  process
  begin
    A1 <= '0'; B1 <= '0'; wait for 20 ps;
    A1 <= '0'; B1 <= '1'; wait for 20 ps;
    A1 <= '1'; B1 <= '0'; wait for 20 ps;
    A1 <= '1'; B1 <= '1'; wait for 20 ps;
  end process;
end test;

