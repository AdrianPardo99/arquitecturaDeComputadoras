library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity simuSumador is
--  Port ( );
end simuSumador;

architecture Behavioral of simuSumador is
component sumadorNBits is
    Port ( a,b : in STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cout : out STD_LOGIC);
end component;
signal a :STD_LOGIC_VECTOR (7 downto 0) := x"00";
signal b :STD_LOGIC_VECTOR (7 downto 0) := x"00";
signal cin : STD_LOGIC := '0';
signal s : STD_LOGIC_VECTOR (7 downto 0);
signal cout : STD_LOGIC; 
begin 
sumado : sumadorNBits
    Port map ( 
    a => a,
    b => b,
    cin => cin,
    s => s, 
    cout => cout
    );
p1 : process
begin
    cin <= '0';
    a <= x"05";
    b <= x"05";
    wait for 10 ns;
    a <= x"0C";
    b <= x"08";
    wait for 10 ns;
    a <= x"09";
    b <= x"05";
    wait for 10 ns;
    cin <= '1';
    a <= x"0A";
    b <= x"09";
    wait for 10 ns;
    cin <= '0';
    a <= x"04";
    b <= x"02";
    wait for 10 ns;
    cin <= '1';
    a <= x"07";
    b <= x"09";
    wait for 10 ns;
    a <= x"0F";
    b <= x"0F";
    wait for 10 ns;
    a <= x"0B";
    b <= x"08";
    wait for 10 ns;
    a <= x"0A";
    b <= x"09";
    wait for 10 ns;
    a <= x"01";
    b <= x"04";
    wait;
end process;
end Behavioral;
