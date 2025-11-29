library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity traffic_light_relays is
    generic (
        C_DIVISOR : natural := 2500000;
        C_GREEN_TICKS         : natural := 100; 
        C_YELLOW_TICKS        : natural := 40;  
        C_RED_STATE_TICKS     : natural := 100
    );
    Port ( 
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        BTN_STOP : in STD_LOGIC;
        ARDUINO_ALERT : in STD_LOGIC;
        
        N_YELLOW : out STD_LOGIC;
        N_GREEN  : out STD_LOGIC;
        S_YELLOW : out STD_LOGIC;
        S_GREEN  : out STD_LOGIC;
        E_YELLOW : out STD_LOGIC;
        E_GREEN  : out STD_LOGIC;
        W_YELLOW : out STD_LOGIC;
        W_GREEN  : out STD_LOGIC;
        
        OUT_STOP_LIGHT     : out STD_LOGIC;
        OUT_MODE_INDICATOR : out STD_LOGIC;
        
        OUT_BUZZER : out STD_LOGIC;
        
        seg : out STD_LOGIC_VECTOR(6 downto 0); 
        an  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end traffic_light_relays;

architecture Behavioral of traffic_light_relays is

    signal s_contador_div : natural range 0 to C_DIVISOR;
    signal s_tick         : STD_LOGIC;

    type t_meta_estado is (ST_CYCLE, ST_STOP_MODE);
    signal s_meta_estado : t_meta_estado;

    type t_traffic_state is (
        ST_N_GREEN, ST_N_YELLOW,
        ST_S_GREEN, ST_S_YELLOW,
        ST_E_GREEN, ST_E_YELLOW,
        ST_W_GREEN, ST_W_YELLOW
    );
    signal s_traffic_state : t_traffic_state;
    
    signal s_state_timer : natural range 0 to C_GREEN_TICKS - 1;
    signal s_red_counter : natural range 0 to C_RED_STATE_TICKS - 1;
    signal s_stop_request : STD_LOGIC := '0';
    signal s_display_num : integer range 0 to 9;
    
begin

    process(CLK, RESET)
    begin
        if RESET = '1' then
            s_contador_div <= 0;
            s_tick <= '0';
        elsif rising_edge(CLK) then
            if s_contador_div = C_DIVISOR - 1 then
                s_contador_div <= 0;
                s_tick <= '1';
            else
                s_contador_div <= s_contador_div + 1;
                s_tick <= '0';
            end if;
        end if;
    end process;

    process(CLK, RESET)
    begin
        if RESET = '1' then
            s_meta_estado <= ST_CYCLE;
            s_traffic_state <= ST_N_GREEN;
            s_state_timer <= 0;
            s_red_counter <= 0;
            s_stop_request <= '0';
            
        elsif rising_edge(CLK) then
            if ARDUINO_ALERT = '1' or BTN_STOP = '1' then
                s_stop_request <= '1';
            end if;
            
            if s_tick = '1' then
                case s_meta_estado is
                    when ST_CYCLE =>
                        s_state_timer <= s_state_timer + 1;
                        case s_traffic_state is
                            when ST_N_GREEN =>
                                if s_state_timer = C_GREEN_TICKS - 1 then
                                    s_state_timer <= 0; s_traffic_state <= ST_N_YELLOW;
                                end if;
                            when ST_N_YELLOW =>
                                if s_state_timer = C_YELLOW_TICKS - 1 then
                                    s_state_timer <= 0; s_traffic_state <= ST_S_GREEN;
                                end if;
                            when ST_S_GREEN =>
                                if s_state_timer = C_GREEN_TICKS - 1 then
                                    s_state_timer <= 0; s_traffic_state <= ST_S_YELLOW;
                                end if;
                            when ST_S_YELLOW =>
                                if s_state_timer = C_YELLOW_TICKS - 1 then
                                    s_state_timer <= 0; s_traffic_state <= ST_E_GREEN;
                                end if;
                            when ST_E_GREEN =>
                                if s_state_timer = C_GREEN_TICKS - 1 then
                                    s_state_timer <= 0; s_traffic_state <= ST_E_YELLOW;
                                end if;
                            when ST_E_YELLOW =>
                                if s_state_timer = C_YELLOW_TICKS - 1 then
                                    s_state_timer <= 0; s_traffic_state <= ST_W_GREEN;
                                end if;
                            when ST_W_GREEN =>
                                if s_state_timer = C_GREEN_TICKS - 1 then
                                    s_state_timer <= 0; s_traffic_state <= ST_W_YELLOW;
                                end if;
                            when ST_W_YELLOW => 
                                if s_state_timer = C_YELLOW_TICKS - 1 then
                                    s_state_timer <= 0;
                                    if s_stop_request = '1' then
                                        s_meta_estado <= ST_STOP_MODE;
                                        s_red_counter <= 0;
                                        s_stop_request <= '0'; 
                                    else
                                        s_traffic_state <= ST_N_GREEN; 
                                    end if;
                                end if;
                        end case;

                    when ST_STOP_MODE =>
                        if s_red_counter = C_RED_STATE_TICKS - 1 then
                            s_meta_estado <= ST_CYCLE;
                            s_traffic_state <= ST_N_GREEN;
                            s_state_timer <= 0;
                            s_red_counter <= 0;
                            s_stop_request <= '0'; 
                        else
                            s_red_counter <= s_red_counter + 1;
                        end if;
                end case;
            end if;
        end if;
    end process;

    process(s_meta_estado, s_traffic_state, ARDUINO_ALERT)
    begin
        N_YELLOW <= '0'; N_GREEN <= '0';
        S_YELLOW <= '0'; S_GREEN <= '0';
        E_YELLOW <= '0'; E_GREEN <= '0';
        W_YELLOW <= '0'; W_GREEN <= '0';
        OUT_STOP_LIGHT <= '0';
        OUT_MODE_INDICATOR <= '0';
        
        if ARDUINO_ALERT = '1' then
            OUT_BUZZER <= '1'; 
        else
            OUT_BUZZER <= '0';
        end if;
    
        case s_meta_estado is
            when ST_CYCLE =>
                OUT_MODE_INDICATOR <= '1'; 
                case s_traffic_state is
                    when ST_N_GREEN =>  N_GREEN <= '1';
                    when ST_N_YELLOW => N_YELLOW <= '1';
                    when ST_S_GREEN =>  S_GREEN <= '1';
                    when ST_S_YELLOW => S_YELLOW <= '1';
                    when ST_E_GREEN =>  E_GREEN <= '1';
                    when ST_E_YELLOW => E_YELLOW <= '1';
                    when ST_W_GREEN =>  W_GREEN <= '1';
                    when ST_W_YELLOW => W_YELLOW <= '1';
                end case;

            when ST_STOP_MODE =>
                null; 
        end case;
    end process;

    process(s_meta_estado, s_red_counter)
        variable v_calc_temp : integer;
    begin
        if s_meta_estado = ST_STOP_MODE then
            an <= "1110"; 
            v_calc_temp := 9 - (s_red_counter * 9 / C_RED_STATE_TICKS);
            if v_calc_temp < 0 then s_display_num <= 0; else s_display_num <= v_calc_temp; end if;
        else
            an <= "1111"; s_display_num <= 0;
        end if;
    end process;

    process(s_display_num)
    begin
        case s_display_num is
            when 0 => seg <= "1000000"; when 1 => seg <= "1111001"; 
            when 2 => seg <= "0100100"; when 3 => seg <= "0110000"; 
            when 4 => seg <= "0011001"; when 5 => seg <= "0010010"; 
            when 6 => seg <= "0000010"; when 7 => seg <= "1111000"; 
            when 8 => seg <= "0000000"; when 9 => seg <= "0010000"; 
            when others => seg <= "1111111"; 
        end case;
    end process;

end Behavioral;