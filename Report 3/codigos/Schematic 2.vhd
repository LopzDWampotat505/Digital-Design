library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_lab_3_2 is

    port(A : in std_logic;      
         B : in std_logic;
         C : in std_logic;
         D : in std_logic;
         Y : out std_logic);   

end ent_lab_3_2;

-- Architecture definition

architecture arq_lab_3_2 of ent_lab_3_2 is

 begin
    
    Y <= (((not(B)and D)and(A xor b))or(C nand A));

end arq_lab_3_2; 