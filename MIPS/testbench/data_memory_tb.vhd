library IEEE;
use IEEE.std_logic_1164.all;

entity data_memory_tb is
end data_memory_tb;

architecture test of data_memory_tb is
  
  component data_memory 
  port (
    address : in std_logic_vector(31 downto 0);
    write_data : in std_logic_vector(31 downto 0);
	  clk : in std_logic;
	  reset : in std_logic;
    MemWrite : in std_logic;
    MemRead : in std_logic;
    read_data : out std_logic_vector(31 downto 0)
  );
  end component;
  
  -- inputs
  signal address_tb : std_logic_vector(31 downto 0);
  signal write_data_tb : std_logic_vector(31 downto 0);
  signal MemWrite_tb : std_logic;
  signal MemRead_tb : std_logic;
  signal clk_tb : std_logic;
	signal reset_tb : std_logic;
  
  -- output
  signal read_data_tb : std_logic_vector(31 downto 0);

  
begin
  U1: data_memory port map (
    address  => address_tb,
    write_data => write_data_tb,
		clk => clk_tb,
		reset => reset_tb,
    MemWrite => MemWrite_tb,
    MemRead => MemRead_tb,
    read_data => read_data_tb);
    
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
      
      -- write to data memory
      reset_tb <= '0';
      MemRead_tb <= '0';
      MemWrite_tb <= '1';
      address_tb <= x"00000000";
      write_data_tb <= x"00000000";
      wait for 600 ns;

      address_tb <= x"00000001";
      write_data_tb <= x"11111111";
      wait for 600 ns;

      address_tb <= x"00000002";
      write_data_tb <= x"22222222";
      wait for 600 ns;

      address_tb <= x"00000003";
      write_data_tb <= x"33333333";
      wait for 600 ns;

      address_tb <= x"00000004";
      write_data_tb <= x"44444444";
      wait for 600 ns;

      address_tb <= x"00000005";
      write_data_tb <= x"55555555";
      wait for 600 ns;

      address_tb <= x"00000006";
      write_data_tb <= x"66666666";
      wait for 600 ns;

      address_tb <= x"00000007";
      write_data_tb <= x"77777777";
      wait for 600 ns;

      address_tb <= x"00000008";
      write_data_tb <= x"88888888";
      wait for 600 ns;

      address_tb <= x"00000009";
      write_data_tb <= x"99999999";
      wait for 600 ns;

      address_tb <= x"0000000A";
      write_data_tb <= x"AAAAAAAA";
      wait for 600 ns;

      address_tb <= x"0000000B";
      write_data_tb <= x"BBBBBBBB";
      wait for 600 ns;

      address_tb <= x"0000000C";
      write_data_tb <= x"CCCCCCCC";
      wait for 600 ns;

      address_tb <= x"0000000D";
      write_data_tb <= x"DDDDDDDD";
      wait for 600 ns;

      address_tb <= x"0000000E";
      write_data_tb <= x"EEEEEEEE";
      wait for 600 ns;

      address_tb <= x"0000000F";
      write_data_tb <= x"FFFFFFFF";
      wait for 600 ns;

      -- read from data memory
      address_tb <= x"0000000A";
      write_data_tb <= x"00000000";
      MemRead_tb <= '1';
      MemWrite_tb <= '0';
      wait for 600 ns;
      
      -- reset
      reset_tb <= '1';
      MemRead_tb <= '0';
      MemWrite_tb <= '0';
      wait for 600 ns;

      -- runs for 11400 ns
      
  end process;
end test;
