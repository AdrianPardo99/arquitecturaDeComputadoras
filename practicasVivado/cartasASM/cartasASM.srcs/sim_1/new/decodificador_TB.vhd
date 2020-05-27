library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.paqueteEntidades.decodificador;

entity decodificador_TB is
end decodificador_TB;

architecture Behavioral of decodificador_TB is
    signal qb:std_logic_vector(3 downto 0);
    signal di:std_logic_vector(6 downto 0);
begin
    deco:decodificador port map(
        qb=>qb,
        di=>di
    );
    decoTB:process
    begin
        qb<="0000";
        wait for 1ns;
        qb<="0010";
        wait for 1ns;
        qb<="1100";
        wait for 1ns;
        qb<="0001";
        wait;
    end process;
end Behavioral;
