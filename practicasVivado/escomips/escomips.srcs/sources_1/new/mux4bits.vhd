library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4bits is
    Port ( entrada,entrada1 : in STD_LOGIC_VECTOR (3 downto 0);
           flag : in STD_LOGIC;
           salida : out STD_LOGIC_VECTOR (3 downto 0));
end mux4bits;

architecture Behavioral of mux4bits is
begin
    process(flag,entrada,entrada1)
    begin
        if flag='0' then
            salida<=entrada;
        else
            salida<=entrada1;
        end if;
    end process;
end Behavioral;
