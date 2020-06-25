library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteHardware.decInstrucciones;

entity decodificador_TB is
end decodificador_TB;

architecture Behavioral of decodificador_TB is
    signal opCode:STD_LOGIC_VECTOR (4 downto 0):=(others =>'0');
    signal TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI:STD_LOGIC:='0';
begin
    decodificador_com:decInstrucciones port map(
        opCode=>opCode,
        TIPOR=>TIPOR,
        BEQI=>BEQI,
        BNEQI=>BNEQI,
        BLTI=>BLTI,
        BLETI=>BLETI,
        BGTI=>BGTI,
        BGETI=>BGETI
    );
    
    decInstrucciones_TB:process
    begin
        opCode <= "00000";
        wait for 10 ns;
        opCode <= "01101";
        wait for 10 ns;
        opCode <= "01110";
        wait for 10 ns;
        opCode <= "01111";
        wait for 10 ns;
        opCode <= "10000";
        wait for 10 ns;
        opCode <= "10001";
        wait for 10 ns;
        opCode <= "10010";
        wait;
    end process;
    
end Behavioral;
