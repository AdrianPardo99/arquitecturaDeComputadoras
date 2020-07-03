library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extendSig is
    Port ( entrada : in STD_LOGIC_VECTOR (11 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0));
end extendSig;

architecture Behavioral of extendSig is
    constant positivo : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    constant negativo : STD_LOGIC_VECTOR(3 downto 0) := "1111";
begin
    process(entrada)
        begin
        if entrada(11) = '0' then
            salida <= positivo & entrada;
        else
            salida <= negativo & entrada;
        end if;
    end process;
end Behavioral;
