library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_nandGate is

    port(A : in std_logic;      -- AND gate input
         B : in std_logic;      -- AND gate input
         Y : out std_logic);    -- AND gate output

end ent_nandGate;

-- Architecture definition

architecture arq_nandGate of ent_nandGate is

 begin
    
    Y <= not(A and B);

end arq_nandGate; 