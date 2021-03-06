library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           CLR,CLK,L : in STD_LOGIC);
end registro;

architecture Behavioral of registro is
begin
    process(CLR,CLK,L)
    begin
        if CLR='1' then
            Q<=(others=>'0');
        elsif rising_edge(CLK) then
            if L='1' then
                Q<=D;
            end if;
        end if;
    end process;
end Behavioral;
