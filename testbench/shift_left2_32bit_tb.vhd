library IEEE;
use IEEE.std_logic_1164.all;

entity shift_left2_32bit_tb is
end shift_left2_32bit_tb;

architecture test of shift_left2_32bit_tb is
  
  -- shift left by 2 32 bit
  component shift_left2_32bit 
  port (
    sin : in std_logic_vector(31 downto 0);
    sout: out std_logic_vector(31 downto 0)
  );
  end component;
  
  -- input
  signal sin_tb: std_logic_vector(31 downto 0);
  
  -- output
  signal sout_tb: std_logic_vector(31 downto 0);

  
begin
  U1: shift_left2_32bit port map (
    sin => sin_tb,
    sout => sout_tb);
    
  -- stimulus process
  process
    begin
      
      sin_tb <= x"11111111";
      wait for 300 ns;
      
      sin_tb <= x"FFFFFFFF";
      wait for 300 ns;
      
  end process;
end test;

