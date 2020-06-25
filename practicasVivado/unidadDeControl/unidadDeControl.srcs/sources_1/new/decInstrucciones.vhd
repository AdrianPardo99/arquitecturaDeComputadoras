library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decInstrucciones is
    Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
           TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : out STD_LOGIC);
end decInstrucciones;

architecture Behavioral of decInstrucciones is

begin
    process(opCode)
    begin
        TIPOR<='0';
        BEQI<='0';
        BNEQI<='0';
        BLTI<='0';
        BLETI<='0';
        BGTI<='0';
        BGETI<='0';
        if opCode="00000" then --TIPOR
            TIPOR<='1';
        elsif opCode="01101" then --BEQI
            BEQI<='1';
        elsif opCode="01110" then --BNEQI
            BNEQI<='1';
        elsif opCode="01111" then --BLTI
            BLTI<='1';
        elsif opCode="10000" then --BLETI
            BLETI<='1';
        elsif opCode="10001" then --BGTI
            BGTI<='1';
        elsif opCode="10010" then --BGETI
            BGETI<='1';
        end if;
    end process;
end Behavioral;
