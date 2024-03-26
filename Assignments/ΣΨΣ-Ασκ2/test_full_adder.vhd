entity test_fa is
end test_fa;

architecture test of test_fa is
  
 signal a1, b1, ci1, s1, co1: bit;

component fa port (
  A, B, Cin : in bit;
  S, Cout : out bit);
end component;

begin
  M1: fa PORT MAP (A=>a1, B=>b1, Cin=>ci1, S=>s1, Cout=>co1);
  process
  begin
    a1 <= '0'; b1 <= '0'; ci1 <= '0'; wait for 20 ps;
    a1 <= '0'; b1 <= '0'; ci1 <= '1'; wait for 20 ps;
    a1 <= '0'; b1 <= '1'; ci1 <= '0'; wait for 20 ps;
    a1 <= '0'; b1 <= '1'; ci1 <= '1'; wait for 20 ps;
    a1 <= '1'; b1 <= '0'; ci1 <= '0'; wait for 20 ps;
    a1 <= '1'; b1 <= '0'; ci1 <= '1'; wait for 20 ps;
    a1 <= '1'; b1 <= '1'; ci1 <= '0'; wait for 20 ps;
    a1 <= '1'; b1 <= '1'; ci1 <= '1'; wait for 20 ps;
  end process;
end test;


