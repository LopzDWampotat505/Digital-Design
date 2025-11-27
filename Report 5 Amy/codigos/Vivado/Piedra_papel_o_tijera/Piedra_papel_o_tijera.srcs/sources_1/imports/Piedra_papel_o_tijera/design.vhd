library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration
entity juego is
port(
	PB : in std_logic;
    JAA, JAB, JBA, JBB : in std_logic;     
    SAL : out std_logic_vector(2 downto 0)  
);    
end juego;

-- Architecture definition
architecture arq_juego of juego is
	
    signal JGO : std_logic_vector(4 downto 0); 
	
 begin
    
    JGO <= PB & JAA & JAB & JBA & JBB;
    
    with (JGO) select
    	SAL <=  "100" when "10101",
                "001" when "10110",
                "010" when "10111",
                "010" when "11001",
                "100" when "11010",
                "001" when "11011",
                "001" when "11101",
                "010" when "11110",
                "100" when "11111",
                "000" when others;

    
end arq_juego;