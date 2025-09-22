library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_orGate is

    port(A : in std_logic;      -- AND gate input
         B : in std_logic;      -- AND gate input
         Y : out std_logic);    -- AND gate output

end ent_andGate;

-- Architecture definition

architecture arq_orGate of ent_orGate is

 begin
    
    Y <= A or B;

end arq_orGate; 