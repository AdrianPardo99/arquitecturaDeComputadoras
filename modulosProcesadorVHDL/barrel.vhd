library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel is
    Port ( dato : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC_VECTOR (3 downto 0);
           dir : std_logic;
           res : out STD_LOGIC_VECTOR (15 downto 0));
end barrel;

architecture Behavioral of barrel is
begin
    process(dato, s,dir)
    variable aux : std_logic_vector(15 downto 0);
    begin
        aux := dato;
            if (dir = '0')then
                for i in 0 to 3 loop
                    for j in 15 downto 2**i loop     --el ciclo for para el corrimiento a la izquierda
                        if s(i) = '0' then          --va del mas significativo al menos significativo
                            aux(j) := aux(j);       --para que los bits se vayan arrastrando y que los ultimos
                        else                        --en actualizarse sean los de la derecha que es en donde se ingrean
                            aux(j) := aux(j-2**i);  --los 0s por el corrimiento, si lo recorremos a la inversa, se actualizaria
                        end if;                     --primero el bit menos significativo y ese valor se replicaria en todo el vector
                    end loop;                       --teniendo como resultado un vector lleno de 0s
                    for j in 2**i-1 downto 0 loop   -- inviertan el for y verifiquen lo que les describi
                        if s(i) = '0' then
                            aux(j) := aux(j);
                        else
                            aux(j) := '0';
                        end if;
                    end loop;
                end loop;
            else
                for i in 0 to 3 loop
                    for j in 2**i to 15 loop
                        if s(i) = '0' then
                            aux(j) := aux(j);
                        else
                            aux(j-2**i) := aux(j);
                        end if;
                    end loop;
                    for j in 15 downto 16-2**i loop
                        if s(i) = '0' then
                            aux(j) := aux(j);
                        else
                            aux(j) := '0';
                        end if;
                    end loop;
                end loop;
            end if;
        res <= aux;
    end process;
end Behavioral;
