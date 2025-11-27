library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component ent_moneda is
port(
  A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  MON: out std_logic_vector(2 downto 0));
end component;

signal A_in, B_in, C_in: std_logic;
signal MON_out: std_logic_vector(2 downto 0);

begin

  -- Connect UUT
  UUT: ent_moneda port map(A_in, B_in, C_in, MON_out);

  process
  begin
    A_in <= '0';
	B_in <= '0';
	C_in <= '0';
	wait for 1 ns;

	A_in <= '0';
	B_in <= '0';
	C_in <= '1';
	wait for 1 ns;

	A_in <= '0';
	B_in <= '1';
	C_in <= '0';
	wait for 1 ns;

	A_in <= '0';
	B_in <= '1';
	C_in <= '1';
	wait for 1 ns;

	A_in <= '1';
	B_in <= '0';
	C_in <= '0';
	wait for 1 ns;

	A_in <= '1';
	B_in <= '0';
	C_in <= '1';
	wait for 1 ns;

	A_in <= '1';
	B_in <= '1';
	C_in <= '0';
	wait for 1 ns;

	A_in <= '1';
	B_in <= '1';
	C_in <= '1';
	wait for 1 ns;
    
    wait;
    
    
  end process;
end tb;