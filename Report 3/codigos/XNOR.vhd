library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_xnorGate is

    port(A : in std_logic;      -- AND gate input
         B : in std_logic;      -- AND gate input
         Y : out std_logic);    -- AND gate output

end ent_xnorGate;

-- Architecture definition

architecture arq_xnorGate of ent_xnorGate is

 begin
    
    Y <= not(A xor B);

end arq_xnorGate;