library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteHardware.condition;

entity condition_TB is
end condition_TB;

architecture Behavioral of condition_TB is
    signal Q:STD_LOGIC_VECTOR (3 downto 0);
    signal EQ,NE,LT,LE,GT,GE:STD_LOGIC;
begin
    condition_com:condition port map(
        Q=>Q,
        EQ=>EQ,
        NE=>NE,
        LT=>LT,
        LE=>LE,
        GT=>GT,
        GE=>GE
    );
    condition_TB:process
    begin
        Q<="0000";
        wait for 10 ns;
        Q<="0001";
        wait for 10 ns;
        Q<="0010";
        wait for 10 ns;
        Q<="0011";
        wait for 10 ns;
        Q<="0100";
        wait for 10 ns;
        Q<="0101";
        wait for 10 ns;
        Q<="0110";
        wait;
    end process;


end Behavioral;
