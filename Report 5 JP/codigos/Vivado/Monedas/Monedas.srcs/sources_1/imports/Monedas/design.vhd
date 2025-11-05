-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity ent_mon is
port(
	A, B, C: in std_logic;     
    MON : out std_logic_vector(2 downto 0)  
);  
end ent_mon;

-- Architecture definition
architecture arq_mon of ent_mon is

    signal LLEN : std_logic_vector(2 downto 0);
	
		
 begin
    
    LLEN <= A & B & C;
    
    with (LLEN) select
    	MON <=  "100" when "100",
                "010" when "110",
                "001" when "111",
                "000" when "000",
                "111" when others;
    
end arq_mon;