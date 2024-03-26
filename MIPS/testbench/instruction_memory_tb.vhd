library IEEE;
use IEEE.std_logic_1164.all;

entity instruction_memory_tb is
end instruction_memory_tb;

architecture test of instruction_memory_tb is
  
  component instruction_memory
  port (
    read_address : in std_logic_vector(31 downto 0);
	  clk : in std_logic;
	  reset: in std_logic;
	  instruction : out std_logic_vector(31 downto 0)
	);
  end component;
  
  -- inputs
  signal read_address_tb : std_logic_vector(31 downto 0);
  signal clk_tb : std_logic;
  signal reset_tb : std_logic;
  
  -- output
  signal instruction_tb : std_logic_vector(31 downto 0);

  
begin
  U1: instruction_memory port map (
    read_address => read_address_tb,
    clk => clk_tb,
    reset => reset_tb,
    instruction => instruction_tb);

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
      
      
      -- reset
      reset_tb <= '1';
      wait for 600 ns;
      
      -- read instruction
      reset_tb <= '0';
      read_address_tb <= x"00000000";
      wait for 600 ns;

      read_address_tb <= x"00000001";
      wait for 600 ns;
      
      read_address_tb <= x"00000002";
      wait for 600 ns;
      
      read_address_tb <= x"00000003";
      wait for 600 ns;
      
      read_address_tb <= x"00000004";
      wait for 600 ns;
      
      read_address_tb <= x"00000005";
      wait for 600 ns;
      
      read_address_tb <= x"00000006";
      wait for 600 ns;
      
      read_address_tb <= x"00000007";
      wait for 600 ns;
      
      read_address_tb <= x"00000008";
      wait for 600 ns;
      
      read_address_tb <= x"00000009";
      wait for 600 ns;
      
      read_address_tb <= x"0000000A";
      wait for 600 ns;
      
      read_address_tb <= x"0000000B";
      wait for 600 ns;
      
      read_address_tb <= x"0000000C";
      wait for 600 ns;
      
      read_address_tb <= x"0000000D";
      wait for 600 ns;
      
      read_address_tb <= x"0000000E";
      wait for 600 ns;
      
      read_address_tb <= x"0000000F";
      wait for 600 ns;

      -- runs for 10400 ns
      
  end process;
end test;

