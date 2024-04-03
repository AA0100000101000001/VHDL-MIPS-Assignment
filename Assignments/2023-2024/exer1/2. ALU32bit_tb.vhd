library IEEE;
use IEEE.std_logic_1164.all;

entity ALU32bit_tb is
generic (
	N : integer := 32
);
end ALU32bit_tb;

architecture test of ALU32bit_tb is
  
  component ALUxbit 
  port (
    D1 : in std_logic_vector(N-1 downto 0);
    D2 : in std_logic_vector(N-1 downto 0);
    operation : in std_logic_vector(3 downto 0);
    alu_res : out std_logic_vector(N-1 downto 0);
    zero : out std_logic -- zero
  );
  end component;
  
  -- inputs
  signal D1_tb : std_logic_vector(N-1 downto 0);
  signal D2_tb : std_logic_vector(N-1 downto 0);
  signal operation_tb : std_logic_vector(3 downto 0);
  
  -- outputs
  signal alu_res_tb : std_logic_vector(N-1 downto 0);
  signal zero_tb : std_logic;

  
begin
  U1: ALUxbit port map (
    D1 => D1_tb,
    D2 => D2_tb,
    operation => operation_tb,
    alu_res => alu_res_tb,
    zero => zero_tb);
    
  -- stimulus process
  process
    begin
      
      -- addition
      D1_tb <= x"00000001";
      D2_tb <= x"00000001";
      operation_tb <= "0011";
      wait for 600 ns;

      -- subtraction
      operation_tb <= "0110";
      wait for 600 ns;

      -- AND
      D1_tb <= x"00000001";
      D2_tb <= x"00000003";
      operation_tb <= "1000";
      wait for 600 ns;

      -- OR
      operation_tb <= "1001";
      wait for 600 ns;

      -- runs for 2400 ns
      
  end process;
end test;

