library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_jkff is
end tb_jkff;

architecture Behavioral of tb_jkff is

    signal clk : STD_LOGIC := '0';
    signal J   : STD_LOGIC := '0';
    signal K   : STD_LOGIC := '0';
    signal Q   : STD_LOGIC;

    -- Instancia del JK
    component jk_flipflop
        Port (
            clk : in  STD_LOGIC;
            J   : in  STD_LOGIC;
            K   : in  STD_LOGIC;
            Q   : out STD_LOGIC
        );
    end component;

begin

    uut: jk_flipflop
        port map (
            clk => clk,
            J   => J,
            K   => K,
            Q   => Q
        );

    -- Clock 10 ns
    clk <= not clk after 5 ns;

    stim_proc: process
    begin
        -- 00: Hold
        J <= '0'; K <= '0';
        wait for 20 ns;

        -- 10: Set
        J <= '1'; K <= '0';
        wait for 20 ns;

        -- 01: Reset
        J <= '0'; K <= '1';
        wait for 20 ns;

        -- 11: Toggle
        J <= '1'; K <= '1';
        wait for 40 ns;

        wait;
    end process;

end Behavioral;

