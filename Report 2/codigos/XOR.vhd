library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_xorGate is

    port(A : in std_logic;      -- AND gate input
         B : in std_logic;      -- AND gate input
         Y : out std_logic);    -- AND gate output

end ent_xorGate;

-- Architecture definition

architecture arq_xorGate of ent_xorGate is

 begin
    
    Y <= A xor B;

end arq_xorGate;