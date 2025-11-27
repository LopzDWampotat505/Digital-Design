library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_flipflop is
    Port (
        clk : in  STD_LOGIC;
        J   : in  STD_LOGIC;
        K   : in  STD_LOGIC;
        Q   : out STD_LOGIC
    );
end jk_flipflop;

architecture Behavioral of jk_flipflop is
    signal q_int : STD_LOGIC := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            case (J & K) is
                when "00" => q_int <= q_int;        -- No cambia
                when "01" => q_int <= '0';          -- Reset
                when "10" => q_int <= '1';          -- Set
                when "11" => q_int <= not q_int;    -- Toggle
                when others => null;
            end case;
        end if;
    end process;

    Q <= q_int;

end Behavioral;
