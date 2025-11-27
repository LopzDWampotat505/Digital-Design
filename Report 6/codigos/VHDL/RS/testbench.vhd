library IEEE;
use ieee.std_logic_1164.all;

entity tb_sr_sync is
end tb_sr_sync;

architecture behavior of tb_sr_sync is
    
    component sr_sync
        port(
            clk : in std_logic;
            s   : in std_logic;
            r   : in std_logic;
            Q   : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal s   : std_logic := '0';
    signal r   : std_logic := '0';
    signal Q   : std_logic;

    constant clk_period : time := 10 ns;

begin

    uut : sr_sync
        port map(
            clk => clk,
            s   => s,
            r   => r,
            Q   => Q
        );

    -- Generador de reloj
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc : process
    begin
        -- Test 1: Retener
        s <= '0'; r <= '0';
        wait for clk_period;

        -- Test 2: Reset
        s <= '0'; r <= '1';
        wait for clk_period;

        -- Test 3: Retener
        s <= '0'; r <= '0';
        wait for clk_period;

        -- Test 4: Set
        s <= '1'; r <= '0';
        wait for clk_period;

        -- Test 5: Retener
        s <= '0'; r <= '0';
        wait for clk_period;

        s <= '1'; r <= '1';
        wait for clk_period;

        wait;
    end process;

end behavior;
