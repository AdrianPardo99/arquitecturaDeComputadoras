library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteHardware.registro;

entity registro_TB is
end registro_TB;

architecture Behavioral of registro_TB is
    signal CLK,CLR,L:std_logic:='0';
    signal D,Q:std_logic_vector(3 downto 0):=(others=>'0');
    constant CLK_P:time:=10ns;
begin
    reg_comp:registro port map(
        D=>D,
        Q=>Q,
        CLR=>CLR,
        CLK=>CLK,
        L=>L
    );
    clk_Pr:process
    begin
        wait for CLK_P/2;
        CLK<='1';
        wait for CLK_P/2;
        CLK<='0';
    end process;
    
    regTB:process
    begin
        CLR<='1';
        wait for CLK_P;
        CLR<='0';
        D<="0100";
        wait for CLK_P;
        L<='1';
        wait for CLK_P;
        D<="1100";
        wait for CLK_P;
        L<='0';
        D<="0101";
        wait for CLK_P;
        wait;
    end process;
end Behavioral;
