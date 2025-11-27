library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_dff is
end tb_dff;

architecture behavior of tb_dff is

    component d_flipflop
        port(
            clk : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal d   : std_logic := '0';
    signal q   : std_logic;

begin

    uut: d_flipflop
        port map(
            clk => clk,
            d   => d,
            q   => q
        );

    -- reloj
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;

    stim_proc : process
    begin
        d <= '1';
        wait for 10 ns;    -- Q se mantiene

        d <= '0';
        wait for 10 ns;

        d <= '1';
        wait for 10 ns;

        wait;
    end process;

end behavior;
