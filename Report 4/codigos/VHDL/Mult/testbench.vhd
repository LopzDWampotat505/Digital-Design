library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component ent_mult is
port(
    SE : in std_logic;      -- OR gate input
    I1 : in std_logic;
    I0 : in std_logic; 
    Y : out std_logic);
end component;

signal se_in, i1_in, i0_in, y_out: std_logic;

begin

  -- Connect UUT
  UUT: ent_mult port map(se_in, i1_in, i0_in, y_out);

  process
  begin
  
    se_in <= '0';
    i1_in <= '0';
    i0_in <= '0';
    wait for 1 ns;
    
 	se_in <= '0';
    i1_in <= '0';
    i0_in <= '1';
    wait for 1 ns;
    
    se_in <= '0';
    i1_in <= '1';
    i0_in <= '0';
    wait for 1 ns;
    
    se_in <= '0';
    i1_in <= '1';
    i0_in <= '1';
    wait for 1 ns;
    
    se_in <= '1';
    i1_in <= '0';
    i0_in <= '0';
    wait for 1 ns;
    
    se_in <= '1';
    i1_in <= '0';
    i0_in <= '1';
    wait for 1 ns;
    
    se_in <= '1';
    i1_in <= '1';
    i0_in <= '0';
    wait for 1 ns;
    
    se_in <= '1';
    i1_in <= '1';
    i0_in <= '1';
    wait for 1 ns;
  
  end process;
end tb;
