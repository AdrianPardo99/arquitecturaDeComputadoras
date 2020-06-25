library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteHardware.mopcode;

entity mopcode_TB is
end mopcode_TB;

architecture Behavioral of mopcode_TB is
    signal opCode:STD_LOGIC_VECTOR (4 downto 0):=(others=>'0');
    signal micro:STD_LOGIC_VECTOR (19 downto 0):=(others=>'0');
begin
    mopcode_com:mopcode port map(
        opCode=>opCode,
        micro=>micro
    );
    mopcode_TB:process
    begin
        opCode <= "00000";
        wait for 10 ns;
        opCode <= "00001";
        wait for 10 ns;
        opCode <= "00010";
        wait for 10 ns;
        opCode <= "00011";
        wait for 10 ns;
        opCode <= "00100";
        wait for 10 ns;
        opCode <= "00101";
        wait for 10 ns;
        opCode <= "00110";
        wait for 10 ns;
        opCode <= "00111";
        wait for 10 ns;
        opCode <= "01000";
        wait for 10 ns;
        opCode <= "01001";
        wait for 10 ns;
        opCode <= "01010";
        wait for 10 ns;
        opCode <= "01011";
        wait for 10 ns;
        opCode <= "01100";
        wait for 10 ns;
        opCode <= "01101";
        wait for 10 ns;
        opCode <= "01110";
        wait for 10 ns;
        opCode <= "01111";
        wait;
    end process;
end Behavioral;
