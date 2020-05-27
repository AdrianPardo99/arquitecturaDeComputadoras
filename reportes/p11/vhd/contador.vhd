library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador is
    port( lb,eb,clr,clk:in std_logic;
          qb:out std_logic_vector(3 downto 0));
end contador;

architecture Behavioral of contador is
    signal b:std_logic_vector(3 downto 0);
begin
    process(clk,clr)
    begin
        if(clr='1') then
            b<=(others=>'0');
        elsif rising_edge(clk) then
            if(lb='1' and eb='0') then
                b<=(others=>'0');
            end if;
            if(lb='0' and eb='1') then
                b<=b+1;
            end if;
        end if;
        qb<=b;
    end process; 
end Behavioral;
