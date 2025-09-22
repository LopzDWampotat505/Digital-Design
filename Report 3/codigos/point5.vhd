library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_example_5 is

    port(A : in std_logic;      -- OR gate input
         B : in std_logic;
         C : in std_logic;
         D : in std_logic;
         Y : out std_logic);    -- OR gate output

end ent_example_5;

-- Architecture definition

architecture arq_example_5 of ent_example_5 is

 begin
    
    Y <= (((not B)and D)or((not A)and B and (not C))or(A and (not B) and C)or(A and B and (not C)));

end arq_example_5; 