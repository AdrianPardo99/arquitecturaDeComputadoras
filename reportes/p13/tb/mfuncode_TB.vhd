library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteHardware.mfuncode;

entity mfuncode_TB is
end mfuncode_TB;

architecture Behavioral of mfuncode_TB is
    signal funCode:STD_LOGIC_VECTOR (3 downto 0):=(others=>'0');
    signal micro:STD_LOGIC_VECTOR (19 downto 0):=(others=>'0');
begin
    mfuncode_com:mfuncode port map(
        funCode=>funCode,
        micro=>micro
    );

    mfuncode_TB:process
    begin
        funCode <= "0000";
        wait for 10 ns;
        funCode <= "0001";
        wait for 10 ns;
        funCode <= "0010";
        wait for 10 ns;
        funCode <= "0011";
        wait for 10 ns;
        funCode <= "0100";
        wait for 10 ns;
        funCode <= "0101";
        wait for 10 ns;
        funCode <= "0110";
        wait for 10 ns;
        funCode <= "0111";
        wait for 10 ns;
        funCode <= "1000";
        wait for 10 ns;
        funCode <= "1001";
        wait for 10 ns;
        funCode <= "1010";
        wait for 10 ns;
        funCode <= "1011";
        wait for 10 ns;
        funCode <= "1100";
        wait for 10 ns;
        funCode <= "1101";
        wait for 10 ns;
        funCode <= "1110";
        wait for 10 ns;
        funCode <= "1111";
        wait;
    end process;


end Behavioral;
