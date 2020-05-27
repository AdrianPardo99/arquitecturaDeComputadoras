library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.paqueteentidades.contador;

entity contador_TB is
end contador_TB;

architecture Behavioral of contador_TB is
    signal lb,eb,clr,clk:std_logic:='0';
    signal qb:std_logic_vector(3 downto 0):="0000";
    constant clk_period:time:=10ns;    
begin
    cont:contador port map(
        lb=>lb,
        eb=>eb,
        clr=>clr,
        clk=>clk,
        qb=>qb
    );
    clkP:process
    begin
        clk<='1';
        wait for clk_period/2;
        clk<='0';
        wait for clk_period/2;
    end process;
    tb:process
    begin
        clr<='1';
        wait for clk_period;
        clr<='0';
        eb<='1';
        wait for clk_period*2;
        eb<='0';
        lb<='1';
        wait for clk_period*2;
        lb<='0';
        eb<='1';
        wait for clk_period*3;
        clr<='1';
        wait;
    end process;

end Behavioral;
