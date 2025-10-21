library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_comp is
port(
    A : in std_logic;      -- OR gate input
    B : in std_logic;
    IG : out std_logic; 
    MI : out std_logic; 
    MA : out std_logic);    -- OR gate output

end ent_comp;

-- Architecture definition

architecture arq_comp of ent_comp is

 begin
    
    MA <= (A)and(not(B));
    IG <= ((not(A))and(not(B)))or((A)and(B));
    MI <= (B)and(not(A));

end arq_comp; 