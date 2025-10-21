library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_demult is
port(
    SE : in std_logic;      -- OR gate input
    I0 : in std_logic;
    O1 : out std_logic; 
    O0 : out std_logic);    -- OR gate output

end ent_demult;

-- Architecture definition

architecture arq_demult of ent_demult is

 begin
    
    O1 <= (((SE)and(I0)));
    O0 <= ((not(SE)and(I0)));


end arq_demult; 