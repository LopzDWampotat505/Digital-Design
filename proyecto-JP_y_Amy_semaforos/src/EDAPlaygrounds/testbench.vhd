library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_traffic_light_relays is
-- La entidad del testbench siempre está vacía
end tb_traffic_light_relays;

architecture Behavioral of tb_traffic_light_relays is

    -- Declaración del Componente
    component traffic_light_relays
        generic (
            C_DIVISOR : natural;
            C_GREEN_TICKS : natural;
            C_YELLOW_TICKS : natural;
            C_RED_STATE_TICKS : natural
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
    end component;

    -- Señales
    signal CLK : std_logic := '0';
    signal RESET : std_logic := '0';
    signal BTN_STOP : std_logic := '0';
    signal ARDUINO_ALERT : std_logic := '0';

    signal N_YELLOW, N_GREEN : std_logic;
    signal S_YELLOW, S_GREEN : std_logic;
    signal E_YELLOW, E_GREEN : std_logic;
    signal W_YELLOW, W_GREEN : std_logic;
    signal OUT_STOP_LIGHT, OUT_MODE_INDICATOR, OUT_BUZZER : std_logic;
    signal seg : std_logic_vector(6 downto 0);
    signal an : std_logic_vector(3 downto 0);

    constant CLK_PERIOD : time := 10 ns; -- 100MHz

begin

    -- Instanciación
    uut: traffic_light_relays
    generic map (
        -- 🔥 AJUSTES PARA VISUALIZACIÓN EN 5 MS 🔥
        -- Divisor de 5000 ciclos = 1 tick cada 50 us
        C_DIVISOR => 5000,         
        
        -- Luz Verde dura 4 ticks = 200 us
        C_GREEN_TICKS => 4,     
        
        -- Luz Amarilla dura 2 ticks = 100 us
        C_YELLOW_TICKS => 2,    
        
        -- Stop Mode dura 10 ticks = 500 us (0.5 ms)
        C_RED_STATE_TICKS => 10 
        
        -- Ciclo completo aprox: (4+2)*4 pasos * 50us = 1200 us = 1.2 ms
    )
    port map (
        CLK => CLK,
        RESET => RESET,
        BTN_STOP => BTN_STOP,
        ARDUINO_ALERT => ARDUINO_ALERT,
        N_YELLOW => N_YELLOW, N_GREEN => N_GREEN,
        S_YELLOW => S_YELLOW, S_GREEN => S_GREEN,
        E_YELLOW => E_YELLOW, E_GREEN => E_GREEN,
        W_YELLOW => W_YELLOW, W_GREEN => W_GREEN,
        OUT_STOP_LIGHT => OUT_STOP_LIGHT,
        OUT_MODE_INDICATOR => OUT_MODE_INDICATOR,
        OUT_BUZZER => OUT_BUZZER,
        seg => seg,
        an => an
    );

    -- Generador de Reloj
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Proceso de Estímulos (Diseñado para cubrir ~5 ms)
    stim_proc: process
    begin		
        -- 1. Reset (Inicio)
        RESET <= '1';
        wait for 100 us;	
        RESET <= '0';
        
        -- 2. Ciclo Normal (Dejamos correr 1.5 ms aprox)
        -- Esto cubre un ciclo completo de semáforo
        wait for 1500 us; 

        -- 3. Activar Alerta de Arduino
        ARDUINO_ALERT <= '1';
        wait for 200 us; -- Buzzer sonando
        ARDUINO_ALERT <= '0';
        
        -- El sistema esperará a terminar el ciclo actual para entrar a STOP.
        -- Esperamos lo suficiente para ver la transición y el modo STOP completo.
        wait for 2000 us; -- 2 ms adicionales

        -- 4. Vuelta a la normalidad
        -- El modo STOP habrá terminado, vemos el reinicio del ciclo
        wait for 1000 us; -- 1 ms final

        -- Total simulado aprox: ~4.8 ms + márgenes = ~5 ms
        
        wait; -- Detener simulación
    end process;

end Behavioral;