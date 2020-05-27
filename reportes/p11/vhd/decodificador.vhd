library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador is
    port( qb:in std_logic_vector(3 downto 0);
          di:out std_logic_vector(6 downto 0));
end decodificador;

architecture Behavioral of decodificador is
    -- Constantes para 7 segmentos de anodo comun
    constant n0:std_logic_vector(6 downto 0):="0000001";
    constant n1:std_logic_vector(6 downto 0):="1001111";
    constant n2:std_logic_vector(6 downto 0):="0010010";
    constant n3:std_logic_vector(6 downto 0):="0000110";
    constant n4:std_logic_vector(6 downto 0):="1001100";
    constant n5:std_logic_vector(6 downto 0):="0100100";
    constant n6:std_logic_vector(6 downto 0):="0100000";
    constant n7:std_logic_vector(6 downto 0):="0001111";
    constant n8:std_logic_vector(6 downto 0):="0000000";
    constant n9:std_logic_vector(6 downto 0):="0000100";
    constant nx:std_logic_vector(6 downto 0):="1111110";
begin
    with qb select
        di<=n0 when "0000",
           n1 when "0001",
           n2 when "0010",
           n3 when "0011",
           n4 when "0100",
           n5 when "0101",
           n6 when "0110",
           n7 when "0111",
           n8 when "1000",
           n9 when "1001",
           nx when others;
           


end Behavioral;
