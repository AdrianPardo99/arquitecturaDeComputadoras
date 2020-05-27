library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.paqueteentidades.registro;
entity registro_TB is
end registro_TB;

architecture Behavioral of registro_TB is
    signal la,ea,clk,clr:std_logic:='0';
    signal d:std_logic_vector(8 downto 0):="000000000";
    signal z,a0:std_logic:='0';
    signal qa:std_logic_vector(8 downto 0):="000000000";
    constant clk_period:time:=10ns;
begin
    reg:registro port map(
        la=>la,
        ea=>ea,
        clk=>clk,
        clr=>clr,
        d=>d,
        z=>z,
        a0=>a0,
        qa=>qa
    );
    clkP:process
    begin
        clk<='1';
        wait for clk_period/2;
        clk<='0';
        wait for clk_period/2;
    end process;
    
    regTB:process
    begin
        la<='1';
        d<="110010100";
        wait for clk_period;
        d<="110011101";
        la<='0';
        wait for clk_period;
        ea<='1';
        wait for clk_period*3;
        clr<='1';
        wait for clk_period;
        wait;
    end process;

end Behavioral;
