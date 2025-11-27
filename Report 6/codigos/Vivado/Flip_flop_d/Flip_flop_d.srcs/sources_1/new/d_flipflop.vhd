library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flipflop is
    port(
        clk : in std_logic;
        d   : in std_logic;
        q   : out std_logic
    );
end d_flipflop;

architecture behavioral of d_flipflop is
    signal q_int : std_logic := '0';
begin
    process(clk)
    begin
        if clk = '1' then         -- cuando clk=1
            q_int <= d;           -- Q(n+1) = D
        end if;                   -- cuando clk=0, no cambia
    end process;

    q <= q_int;
end behavioral;