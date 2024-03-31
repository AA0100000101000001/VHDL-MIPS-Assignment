library IEEE;
use IEEE.std_logic_1164.all;

entity ALU_reg_tb is
generic (
	N : integer := 32
);
end ALU_reg_tb;

architecture test of ALU_reg_tb is
  
  component ALU_reg 
  port (
    D1 : in std_logic_vector(N-1 downto 0);
    D2 : in std_logic_vector(N-1 downto 0);
    operation : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    res : in std_logic;
    alu_reg_out : out std_logic_vector(N-1 downto 0);
    zero : out std_logic -- zero
  );
  end component;
  
  -- inputs
  signal D1_tb : std_logic_vector(N-1 downto 0);
  signal D2_tb : std_logic_vector(N-1 downto 0);
  signal operation_tb : std_logic_vector(3 downto 0);
  signal clk_tb : std_logic;
  signal res_tb : std_logic;
  
  -- outputs
  signal alu_reg_out_tb : std_logic_vector(N-1 downto 0);
  signal zero_tb : std_logic;

  
begin
  U1: ALU_reg port map (
    D1 => D1_tb,
    D2 => D2_tb,
    operation => operation_tb,
    clk => clk_tb,
    res => res_tb,
    alu_reg_out => alu_reg_out_tb,
    zero => zero_tb);

  -- clock process
  clk_p: process
    begin

      clk_tb <= '1';
      wait for 300 ns;
      clk_tb <= '0';
      wait for 300 ns;

  end process clk_p;
    
  -- stimulus process
  process
    begin

      res_tb <= '1'; -- registers on
      wait for 600 ns;
      
      -- addition
      D1_tb <= x"00000001";
      D2_tb <= x"00000002";
      operation_tb <= "0011";
      wait for 1200 ns;

      -- subtract
      operation_tb <= "0110";
      wait for 1200 ns;

      -- subtract equal
      D1_tb <= x"11111111";
      D2_tb <= x"11111111";
      operation_tb <= "0110";
      wait for 1200 ns;

      -- runs for 4200 ns
      
  end process;
end test;

