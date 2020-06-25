library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteHardware.unControl;

entity unControl_TB is
end unControl_TB;

architecture Behavioral of unControl_TB is
    signal TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI,NA,EQ,NE,LT,LE,GT,GE,SM,SDOPC:STD_LOGIC:='0';
    constant CLK_P:time:=10ns;
begin
    unControl_com:unControl port map(
        TIPOR=>TIPOR,
        BEQI=>BEQI,
        BNEQI=>BNEQI,
        BLTI=>BLTI,
        BLETI=>BLETI,
        BGTI=>BGTI,
        BGETI=>BGETI,
        NA=>NA,EQ=>EQ,
        NE=>NE,
        LT=>LT,
        LE=>LE,
        GT=>GT,
        GE=>GE,
        SM=>SM,
        SDOPC=>SDOPC
    );
    clk_Pr:process
    begin
        wait for CLK_P/2;
        NA<='1';
        wait for CLK_P/2;
        NA<='0';
    end process;

    unControl_TB:process
    begin
        TIPOR<='0';
        BEQI<='0';
        BNEQI<='0';
        BLTI<='0';
        BLETI<='0';
        BGTI<='0';
        BGETI<='0';
        EQ<='0';
        NE<='0';
        LT<='0';
        LE<='0';
        GT<='0';
        GE<='0';
        wait for CLK_P;
        TIPOR<='1';
        wait for CLK_P;
        TIPOR<='0';
        wait for CLK_P;
        BEQI<='1';
        EQ<='1';
        wait for CLK_P;
        BEQI<='0';
        EQ<='0';
        BNEQI<='1';
        NE<='0';
        wait for CLK_P;
        wait;
    end process;
end Behavioral;
