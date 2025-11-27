-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity ent_moneda is
port (A, B, C: in std_logic;
	MON: out std_logic_vector(2 downto 0));
end entity;


-- Architecture definition
architecture arch_moneda of ent_moneda is

signal result: std_logic_vector(2 downto 0);

begin
 
    
result <= A & B & C ; --creation of vector
--salida <= E & GJA & GJB;

with (result) select
MON <= "000" when "000",
		  "100" when "100",
          "010" when "110",
          "001" when "111",
          "111" when others;
          
end architecture;