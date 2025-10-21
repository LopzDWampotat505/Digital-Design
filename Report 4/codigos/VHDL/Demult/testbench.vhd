library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component ent_demult is
port(
    SE : in std_logic;      -- OR gate input
    I0 : in std_logic;
    O1 : out std_logic; 
    O0 : out std_logic);    -- OR gate output

end component;

signal se_in, i0_in, O1_out, O0_out: std_logic;

begin

  -- Connect UUT
  UUT: ent_demult port map(se_in, i0_in, O1_out, O0_out);

  process
  begin
  
    se_in <= '0';
    i0_in <= '0';
    wait for 1 ns;
    
 	se_in <= '0';
    i0_in <= '1';
    wait for 1 ns;
    
    se_in <= '1';
    i0_in <= '0';
    wait for 1 ns;
    
    se_in <= '1';
    i0_in <= '1';
    wait for 1 ns;
    
  end process;
end tb;
