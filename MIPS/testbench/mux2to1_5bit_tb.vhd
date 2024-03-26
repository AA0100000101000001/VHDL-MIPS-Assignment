library IEEE;
use IEEE.std_logic_1164.all;

entity mux2to1_5bit_tb is
end mux2to1_5bit_tb;

architecture test of mux2to1_5bit_tb is
  
  -- mux2to1 5 bit
  component mux2to1_5bit 
  port (
    a1: in std_logic_vector(4 downto 0);
    a2: in std_logic_vector(4 downto 0);
    s : in std_logic;
    d: out std_logic_vector(4 downto 0)
  );
  end component;
  
  -- inputs
  signal a1_tb, a2_tb: std_logic_vector(4 downto 0) := (others => '0');
  signal s_tb : std_logic := '0';
  
  -- outputs
  signal d_tb: std_logic_vector(4 downto 0);

  
begin
  U1: mux2to1_5bit port map (
    a1 => a1_tb,
    a2 => a2_tb,
    s => s_tb,
    d => d_tb);
    
  -- stimulus process
  process
    begin
      
      a1_tb <= "00000";
      a2_tb <= "11111";
      s_tb <= '0';
      wait for 300 ns;
      
      s_tb <= '1';
      wait for 300 ns;
      
  end process;
end test;

