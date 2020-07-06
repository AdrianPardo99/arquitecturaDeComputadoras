library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
    Port ( p,s : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           sout : out STD_LOGIC_VECTOR (15 downto 0));
end mux2;

architecture Behavioral of mux2 is
begin
    process(sel,p,s)
        begin
        if (sel = '0')then
            sout <= p;
        else
            sout <= s;
        end if;
    end process;
end Behavioral;
