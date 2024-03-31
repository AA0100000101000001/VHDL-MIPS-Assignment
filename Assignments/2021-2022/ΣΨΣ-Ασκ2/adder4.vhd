library IEEE;
use IEEE.std_logic_1164.all;

ENTITY adder4 IS PORT ( 
  Cin : IN std_logic;
  X, Y : IN std_logic_vector(3 DOWNTO 0);
  S : OUT std_logic_vector(3 DOWNTO 0);
  Cout : OUT std_logic);
END adder4;

architecture structural of adder4 is
  
  signal s1: std_logic_vector(3 downto 0);
  signal co1: std_logic_vector(2 downto 0);
  
  component full_adder is port (
    a, b, cin: in std_logic;
    s, cout: out std_logic);
  end component;
  
begin
  
  fa1: full_adder port map(
    a => X(0),
    b => Y(0),
    cin => Cin,
    s => s1(0),
    cout => co1(0));
    
  fa2: full_adder port map(
    a => X(1),
    b => Y(1),
    cin => co1(0),
    s => s1(1),
    cout => co1(1));
    
  fa3: full_adder port map(
    a => X(2),
    b => Y(2),
    cin => co1(1),
    s => s1(2),
    cout => co1(2));
    
  fa4: full_adder port map(
    a => X(3),
    b => Y(3),
    cin => co1(2),
    s => s1(3),
    cout => Cout);
    
  S(3 downto 0) <= s1(3 downto 0);
  
end structural;

