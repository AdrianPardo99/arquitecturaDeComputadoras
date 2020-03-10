library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu1 is
    Port ( a, b, sela, selb, cin : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC;
           cout : out STD_LOGIC);
end alu1;

architecture Behavioral of alu1 is

component sumador is
    Port ( a,b,cin : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;
signal auxa, auxb, auxs, and1, or1, xor1 : std_logic;
begin


auxa <= a when sela = '0' else not a;
auxb <= b xor selb;

and1 <= auxa and auxb;
or1 <= auxa or auxb;
xor1 <= auxa xor auxb;


sumador1: sumador 
    Port map( 
    a => auxa,
    b => auxb,
    cin => cin,
    s => auxs,
     cout => cout
     );
     
     process(and1, or1, xor1, auxs, op)
     begin
        case op is
            when "00" =>
                res <= and1;
            when "01" =>
                res <= or1;
            when "10" =>
                res <= xor1;
            when others =>
                res <= auxs;
        end case;
     end process;






end Behavioral;
