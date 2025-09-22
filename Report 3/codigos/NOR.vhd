library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_norGate is

    port(A : in std_logic;      -- AND gate input
         B : in std_logic;      -- AND gate input
         Y : out std_logic);    -- AND gate output

end ent_norGate;

-- Architecture definition

architecture arq_norGate of ent_norGate is

 begin
    
    Y <= not(A or B);

end arq_norGate; 