library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component ent_half is
port(
 	A : in std_logic;      -- OR gate input
    B : in std_logic;
    AC : out std_logic; 
    R : out std_logic); 
end component;

signal a_in, b_in, ac_out, r_out: std_logic;

begin

  -- Connect UUT
  UUT: ent_half port map(a_in, b_in, ac_out, r_out);

  process
  begin
  
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    
 	a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
  
  end process;
end tb;
