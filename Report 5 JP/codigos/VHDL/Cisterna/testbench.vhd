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
  B : in std_logic;
  C : in std_logic;
  D : in std_logic;
  M : out std_logic);
end component;

signal a_in, b_in, c_in, d_in, m_out: std_logic;

begin

  -- Connect UUT
  UUT: ent_cis port map(a_in, b_in, c_in, d_in, m_out);

  process
  begin
  
    a_in <= '0';
    b_in <= '0';
    c_in <= '0';
    d_in <= '0';
    wait for 1 ns;
  
    a_in <= '0';
    b_in <= '0';
    c_in <= '0';
    d_in <= '1';
    wait for 1 ns;
  
    a_in <= '0';
    b_in <= '0';
    c_in <= '1';
    d_in <= '0';
    wait for 1 ns;
    
    a_in <= '0';
    b_in <= '0';
    c_in <= '1';
    d_in <= '1';
    wait for 1 ns;
  
    a_in <= '0';
    b_in <= '1';
    c_in <= '0';
    d_in <= '0';
    wait for 1 ns;
    
    a_in <= '0';
    b_in <= '1';
    c_in <= '0';
    d_in <= '1';
    wait for 1 ns;
  
    a_in <= '0';
    b_in <= '1';
    c_in <= '1';
    d_in <= '0';
    wait for 1 ns;
    
    a_in <= '0';
    b_in <= '1';
    c_in <= '1';
    d_in <= '1';
    wait for 1 ns;
  
    a_in <= '1';
    b_in <= '0';
    c_in <= '0';
    d_in <= '0';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '0';
    c_in <= '0';
    d_in <= '1';
    wait for 1 ns;
  
    a_in <= '1';
    b_in <= '0';
    c_in <= '1';
    d_in <= '0';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '0';
    c_in <= '1';
    d_in <= '1';
    wait for 1 ns;
  
    a_in <= '1';
    b_in <= '1';
    c_in <= '0';
    d_in <= '0';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '1';
    c_in <= '0';
    d_in <= '1';
    wait for 1 ns;
  
    a_in <= '1';
    b_in <= '1';
    c_in <= '1';
    d_in <= '0';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '1';
    c_in <= '1';
    d_in <= '1';
    wait for 1 ns;
  
  end process;
end tb;
