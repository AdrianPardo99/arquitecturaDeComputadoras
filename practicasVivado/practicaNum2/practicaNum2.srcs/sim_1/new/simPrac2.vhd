library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simPrac2 is
--  Port ( );
end simPrac2;

architecture Behavioral of simPrac2 is
component practica is
    Port(a,b : in STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal a:STD_LOGIC_VECTOR (7 downto 0) := x"00";
signal b:STD_LOGIC_VECTOR (7 downto 0) := x"00";
signal cin: STD_LOGIC :='0';
signal s: STD_LOGIC_VECTOR (7 downto 0);
signal cout: STD_LOGIC;
begin
sumaAnt: practica
    Port map (
        a=>a,
        b=>b,
        cin=>cin,
        s=>s,
        cout=>cout
    );
    
p2: process
begin
 cin<='0';
 a<=x"05";
 b<=x"05";
 wait for 10 ns;
 a<=x"0C";
 b<=x"07";
 wait for 10 ns;
 a<=x"09";
 b<=x"05";
 wait for 10 ns;
 a<=x"0E";
 b<=x"09";
 wait for 10 ns;
 a<=x"04";
 b<=x"02";
 wait for 10 ns;
 a<=x"07";
 b<=x"07";
 wait for 10 ns;
 a<=x"0F";
 b<=x"05";
 wait for 10 ns;
 a<=x"0B";
 b<=x"08";
 wait for 10 ns;
 a<=x"01";
 b<=x"04";
 wait;
end process;

end Behavioral;
