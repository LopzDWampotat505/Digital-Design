library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component ent_cis is
  port(
    A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    D: in std_logic;
    M: out std_logic
  );
end component;

signal A_in, B_in, C_in, D_in: std_logic;
signal M_out: std_logic;

begin

  -- Connect UUT
  UUT: ent_cis port map(A_in, B_in, C_in, D_in, M_out);

  process
  begin
    A_in <= '0';
    B_in <= '0';
    C_in <= '0';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '0';
    B_in <= '0';
    C_in <= '0';
    D_in <= '1';
    wait for 1 ns;
    
    A_in <= '0';
    B_in <= '0';
    C_in <= '1';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '0';
    B_in <= '0';
    C_in <= '1';
    D_in <= '1';
    wait for 1 ns;
    
    A_in <= '0';
    B_in <= '1';
    C_in <= '0';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '0';
    B_in <= '1';
    C_in <= '0';
    D_in <= '1';
    wait for 1 ns;
    
    A_in <= '0';
    B_in <= '1';
    C_in <= '1';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '0';
    B_in <= '1';
    C_in <= '1';
    D_in <= '1';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '0';
    C_in <= '0';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '0';
    C_in <= '0';
    D_in <= '1';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '0';
    C_in <= '1';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '0';
    C_in <= '1';
    D_in <= '1';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '1';
    C_in <= '0';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '1';
    C_in <= '0';
    D_in <= '1';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '1';
    C_in <= '1';
    D_in <= '0';
    wait for 1 ns;
    
    A_in <= '1';
    B_in <= '1';
    C_in <= '1';
    D_in <= '1';
    wait for 1 ns;
    
    wait;
  end process;
end tb;
