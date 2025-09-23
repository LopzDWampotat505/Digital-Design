library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_lab_3 is

    port(A : in std_logic;      -- OR gate input
         B : in std_logic;
         C : in std_logic;
         D : in std_logic;
         Y : out std_logic);    -- OR gate output

end ent_lab_3;

-- Architecture definition

architecture arq_lab_3 of ent_lab_3 is

 begin
    
    Y <= (((A nand B)nor(B xnor C))nand((B xnor C)or(C xor D)));

end arq_lab_3; 