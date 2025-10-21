library IEEE;
use IEEE.std_logic_1164.all;

-- Entity declaration

entity ent_mult is
port(
    SE : in std_logic;      -- OR gate input
    I1 : in std_logic;
    I0 : in std_logic; 
    Y : out std_logic);    -- OR gate output

end ent_mult;

-- Architecture definition

architecture arq_mult of ent_mult is

 begin
    
    Y <= ((not(SE)and(I0)))or((SE)and(I1));

end arq_mult; 