library IEEE;
use IEEE.std_logic_1164.all;

entity adder_32bit_tb is
end adder_32bit_tb;

architecture test of adder_32bit_tb is
  
  -- adder 32 bit
  component adder_32bit 
  port (
    a, b : in std_logic_vector(31 downto 0);
    cout: out std_logic_vector(31 downto 0)
  );
  end component;
  
  -- inputs
  signal a_tb, b_tb: std_logic_vector(31 downto 0) := (others => '0');
  
  -- outputs
  signal cout_tb: std_logic_vector(31 downto 0);

  
begin
  U1: adder_32bit port map (
    a => a_tb,
    b => b_tb,
    cout => cout_tb);
    
  -- stimulus process
  process
    begin
      
      a_tb <= x"22222222";
      b_tb <= x"11111111";
      wait for 600 ns;
      
      a_tb <= x"33333333";
      b_tb <= x"22222222";
      wait for 600 ns;
      
  end process;
end test;
