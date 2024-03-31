library IEEE;
use IEEE.std_logic_1164.all;


entity fa is port ( 
  A, B, Cin : in bit;
  S, Cout : out bit);
end fa;

architecture structural of fa is
  
  signal s1, co1, co2: bit;
  
  component ha is port(
    A, B : in bit;
    S,C : out bit);
  end component;
  
begin
  
  ha1: ha port map(
    A => A,
    B => B,
    S => s1,
    C => co1);
    
  ha2: ha port map(
    A => s1,
    B => Cin,
    S => S,
    C => co2);
    
  Cout <= co1 or co2;
    
end structural;