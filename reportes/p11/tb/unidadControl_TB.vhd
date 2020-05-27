library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.paqueteentidades.unidadControl;
entity unidadControl_TB is
end unidadControl_TB;

architecture Behavioral of unidadControl_TB is
    signal clk,clr,ini,z,a0:std_logic:='0';
    signal la,lb,ea,eb,ec:std_logic:='0';
    constant clk_period: time :=10ns;
begin
    uc:unidadControl port map(
        clk=>clk,
        clr=>clr,
        ini=>ini,
        z=>z,
        a0=>a0,
        la=>la,
        lb=>lb,
        ea=>ea,
        eb=>eb,
        ec=>ec
    );
    clkProcess:process
    begin
        clk<='0';
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
    end process;

    ucTB:process
    begin
        clr<='1';
        wait for clk_period;
        clr<='0';
        wait for clk_period;
        --Aqui se habilita la
        wait for clk_period;
        ini<='1';
        --Pasa a e1
        wait for clk_period;
        z<='0';
        --Sigue en e1 y eb esta en 0
        wait for clk_period;
        a0<='0';
        --Sigue en e1 y eb pasa a 1
        wait for clk_period;
        z<='1';
        --Pasa a e2
        wait for clk_period;
        --Sigue en e2 porque ini esta en 1
        wait for clk_period;
        ini<='0';
        z<='0';
        a0<='0';
        --Pasa a e0
        wait for clk_period;
        ini<='1';
        --pasa a e1
        wait for clk_period;
        clr<='1';
        wait;
    end process;

end Behavioral;
