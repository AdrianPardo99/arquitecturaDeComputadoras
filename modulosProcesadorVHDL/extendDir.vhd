library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extendDir is
    Port ( entrada : in STD_LOGIC_VECTOR (11 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0));
end extendDir;

architecture Behavioral of extendDir is
    constant dir : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    salida <= dir & entrada;
end Behavioral;
