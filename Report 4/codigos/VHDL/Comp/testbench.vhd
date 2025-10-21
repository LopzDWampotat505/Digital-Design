library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component ent_comp is
port(
    A : in std_logic;      -- OR gate input
    B : in std_logic;
    IG : out std_logic; 
    MI : out std_logic; 
    MA : out std_logic);    -- OR gate output
end component;

signal a_in, b_in, ig_out, mi_out, ma_out: std_logic;

begin

  -- Connect UUT
  UUT: ent_comp port map(a_in, b_in, ig_out, mi_out, ma_out);

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
