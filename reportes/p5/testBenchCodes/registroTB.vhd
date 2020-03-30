library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registroTB is
--  Port ( );
end registroTB;

architecture Behavioral of registroTB is
component registro
    Port ( d : in STD_LOGIC_VECTOR (15 downto 0);
           q : out STD_LOGIC_VECTOR (15 downto 0);
           clr,clk,l : in STD_LOGIC);
end component;
signal d :  STD_LOGIC_VECTOR (15 downto 0);
signal q :  STD_LOGIC_VECTOR (15 downto 0);
signal clr,clk,l :  STD_LOGIC;
constant periodo : time := 10 ns;
begin
    tb:registro port map(
        d => d,
        q => q,
        clr => clr,
        clk => clk,
        l => l
    );
    reloj : process
        begin
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
    end process;
    simulacion:process
        begin
            clr <= '1';
            l <= '0';
            d <= "0001110011110000";
            wait for 40 ns;
            clr <= '0';
            l <= '1';
            d <= "0001110011110000";
            wait for 40 ns;
            clr <= '0';
            l <= '0';
            d <= "0000010011110000";
            wait for 40 ns;
            clr <= '0';
            l <= '1';
            d <= "1111111111111111";
            wait for 40 ns;
            clr <= '1';
            l <= '0';
            d <= "0001110011110000";
            wait for 40 ns;
            wait;
    end process;
end Behavioral;
