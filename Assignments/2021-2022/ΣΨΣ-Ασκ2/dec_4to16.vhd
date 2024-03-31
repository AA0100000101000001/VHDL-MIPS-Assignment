library IEEE;
use IEEE.std_logic_1164.all;

entity dec_4to16 is port (
  a: in std_logic_vector( 4 downto 1);
  d: out std_logic_vector(16 downto 1));
end dec_4to16;

architecture structural of dec_4to16 is
  
  signal en1: std_logic_vector( 4 downto 1);
  
  component dec_2to4 is port (
    a: in std_logic_vector(2 downto 1);
    en: in std_logic;
    d: out std_logic_vector(4 downto 1));
  end component;
  
begin
  u4: dec_2to4 port map (a(2 downto 1) => a(2 downto 1),
                         en => en1(1),
                         d(4 downto 1) => d(4 downto 1));
                         
  u3: dec_2to4 port map (a(2 downto 1) => a(2 downto 1),
                         en => en1(2),
                         d(4 downto 1) => d(8 downto 5));
                         
  u2: dec_2to4 port map (a(2 downto 1) => a(2 downto 1),
                         en => en1(3),
                         d(4 downto 1) => d(12 downto 9));
                         
  u1: dec_2to4 port map (a(2 downto 1) => a(2 downto 1),
                         en => en1(4),
                         d(4 downto 1) => d(16 downto 13));
                         
  u0: dec_2to4 port map (a(2 downto 1) => a(4 downto 3),
                         en => '1',
                         d(4 downto 1) => en1(4 downto 1));
                         
end structural;