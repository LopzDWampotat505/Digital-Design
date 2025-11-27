library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_tff is
end tb_tff;

architecture behavior of tb_tff is

    component t_flipflop
        port(
            clk : in std_logic;
            t   : in std_logic;
            q   : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal t   : std_logic := '0';
    signal q   : std_logic;

begin

    uut: t_flipflop
        port map(
            clk => clk,
            t   => t,
            q   => q
        );

    -- Generador de reloj
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    stim_proc : process
    begin
        -- CLK=0 (no cambia)
        t <= '0';
        wait for 10 ns;

        -- T=0 (mantiene)
        t <= '0';
        wait for 10 ns;

        -- T=1 (toggle)
        t <= '1';
        wait for 10 ns;

        -- Otro toggle
        t <= '1';
        wait for 10 ns;

        wait;
    end process;

end behavior;

