library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_flipflop is
    port(
        clk : in std_logic;
        t   : in std_logic;
        q   : out std_logic
    );
end t_flipflop;

architecture behavioral of t_flipflop is
    signal q_int : std_logic := '0';
begin

    process(clk)
    begin
        if clk = '1' then          -- solo cambia cuando clk = 1
            if t = '1' then
                q_int <= not q_int;   -- toggle (Qn')
            end if;
            -- si T=0 no cambia
        end if;
        -- si clk=0 no cambia
    end process;

    q <= q_int;

end behavioral;
