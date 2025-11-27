--este es síncrono porque tiene un divisor de tiempo clk
library IEEE;
use ieee.std_logic_1164.all;

entity sr_sync is
    port(
        clk : in std_logic;
        s   : in std_logic;
        r   : in std_logic;
        Q   : out std_logic
    );
end sr_sync;

architecture behavioral of sr_sync is
    signal Q_reg : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (s = '0' and r = '0') then
                Q_reg <= Q_reg;         -- reten
            elsif (s = '1' and r = '0') then
                Q_reg <= '1';
            elsif (s = '0' and r = '1') then
                Q_reg <= '0';
            elsif (s = '1' and r = '1') then
                Q_reg <= 'X';           -- inválido
            end if;
        end if;
    end process;

    Q <= Q_reg;
end behavioral;

