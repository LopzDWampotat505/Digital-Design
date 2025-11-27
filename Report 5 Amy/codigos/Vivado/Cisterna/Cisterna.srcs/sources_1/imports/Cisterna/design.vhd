-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity cis is
port(A : in std_logic;      
         B : in std_logic;
         C : in std_logic;
         D : in std_logic;
         M : out std_logic);    
end cis;

-- Architecture definition
architecture arq_cis of cis is

    signal LLEN : std_logic_vector(3 downto 0);

		
 begin
    
    LLEN <= A & B & C & D;
    
    with (LLEN) select
    	M <=  '1' when "0001",
        		'1' when "0011",
                '1' when "0101",
                '1' when "0111",
                '0' when "0000",
                '0' when others;

    
end arq_cis;