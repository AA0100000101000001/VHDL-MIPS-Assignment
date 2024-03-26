library IEEE;
use IEEE.std_logic_1164.all;

entity sign_extender_tb is
end sign_extender_tb;

architecture test of sign_extender_tb is
  
  -- sign extender 32 bit
  component sign_extender 
  port (
    sin : in std_logic_vector(15 downto 0);
    sout: out std_logic_vector(31 downto 0)
  );
  end component;
  
  -- input
  signal sin_tb: std_logic_vector(15 downto 0) := (others => '0');
  
  -- output
  signal sout_tb: std_logic_vector(31 downto 0);

  
begin
  U1: sign_extender port map (
    sin => sin_tb,
    sout => sout_tb);
    
  -- stimulus process
  process
    begin
      
      sin_tb <= x"FFFF";
      wait for 300 ns;
      
      sin_tb <= x"0000";
      wait for 300 ns;
      
  end process;
end test;
