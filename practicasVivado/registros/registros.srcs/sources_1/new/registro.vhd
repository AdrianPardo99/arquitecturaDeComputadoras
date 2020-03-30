library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
    Port ( d : in STD_LOGIC_VECTOR (15 downto 0);
           q : out STD_LOGIC_VECTOR (15 downto 0);
           clr,clk,l : in STD_LOGIC);
end registro;

architecture Behavioral of registro is
begin
     process(clr,clk,l,d)
    begin
        if(clr = '1') then
            q<=(others=>'0');
        elsif rising_edge(clk) then
            if(l='1') then
                q<=d;
            end if;
        end if;
    end process;
end Behavioral;
