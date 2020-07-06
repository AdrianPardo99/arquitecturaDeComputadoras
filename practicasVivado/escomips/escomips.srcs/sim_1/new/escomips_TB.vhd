LIBRARY STD;
library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_TEXTIO.ALL;  --PERMITE USAR STD_LOGIC
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
USE STD.TEXTIO.ALL;
use WORK.modulosHardware.escomips;

entity escomips_TB is
end escomips_TB;

architecture Behavioral of escomips_TB is
    signal CLK,CLR : STD_LOGIC:='0';
    signal PC,readData1,readData2,aluOut,busSR : STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
    signal instruccion : STD_LOGIC_VECTOR(24 downto 0):=(others=>'0');
    constant CLK_P:time:=10ns;
begin
    escomipsCom:escomips port map(
        CLK=>CLK,
        CLR=>CLR,
        PC=>PC,
        instruccion=>instruccion,
        readData1=>readData1,
        readData2=>readData2,
        aluOut=>aluOut,
        busSR=>busSR
    );
    
    proCLK:process
    begin
        CLK<='0';
        wait for CLK_P/2;
        CLK<='1';
        wait for CLK_P/2;
    end process;
    
    escomipsTB:process
    begin
        CLR<='1';
        wait for 20ns;
        CLR<='0';
        wait for CLK_P*1600000;
        wait;
    end process;
    
    
end Behavioral;
