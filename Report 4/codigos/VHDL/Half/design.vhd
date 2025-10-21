library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_half is
port(
    A : in std_logic;      -- OR gate input
    B : in std_logic;
    AC : out std_logic; 
    R : out std_logic);    -- OR gate output

end ent_half;

-- Architecture definition

architecture arq_half of ent_half is

 begin
    
    AC <= (not(A)and(B));
    R <= ((not(A)and(B))or((A)and(not(B))));

end arq_half; 