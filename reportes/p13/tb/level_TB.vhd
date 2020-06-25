library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteHardware.level;

entity level_TB is
end level_TB;

architecture Behavioral of level_TB is
    signal CLR,CLK,NA:std_logic:='0';
    constant CLK_P:time:=10ns;
begin
    level_com:level port map(
        CLR=>CLR,
        CLK=>CLK,
        NA=>NA
    );
    
    clk_Pr:process
    begin
        wait for CLK_P/2;
        CLK<='1';
        wait for CLK_P/2;
        CLK<='0';
    end process;
    
    levelTB:process
    begin
        CLR <= '1';
        wait for CLK_P;
        CLR <= '0';
        wait for CLK_P;
        wait for CLK_P;
        wait for CLK_P;
        wait;
    end process;
    

end Behavioral;
