library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cartaASM_TB is
end cartaASM_TB;

architecture Behavioral of cartaASM_TB is
    component cartaASM is
        port( ini,clr,clk:in std_logic;
              d:in std_logic_vector(8 downto 0);
              disp:out std_logic_vector(6 downto 0);
              qa:out std_logic_vector(8 downto 0));
    end component;
    signal ini,clr,clk:std_logic:='0';
    signal d:std_logic_vector(8 downto 0):="000000000";
    signal disp:std_logic_vector(6 downto 0):="0000000";
    signal qa:std_logic_vector(8 downto 0):="000000000";
    constant clk_period: time :=10ns;
begin
    asm:cartaASM port map(
        ini=>ini,
        clr=>clr,
        clk=>clk,
        d=>d,
        disp=>disp,
        qa=>qa
    );
    
    clkProcess:process
    begin
        clk<='0';
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
    end process;
    
    tb:process
    begin
        --a
        clr<='1';
        
        wait for clk_period;
        clr<='0';
        d<="101101011";
        wait for clk_period;
        ini<='1';
        d<="000000000";
        wait for clk_period*11;
        ini<='0';
        clr<='1';
        --b
        wait for clk_period*2;
        clr<='0';
        d<="000011101";
        wait for clk_period;
        ini<='1';
        d<="000000000";
        wait for clk_period*11;
        ini<='0';
        clr<='1';
        --c
        wait for clk_period*2;
        clr<='0';
        d<="000010000";
        wait for clk_period;
        ini<='1';
        d<="000000000";
        wait for clk_period*11;
        ini<='0';
        clr<='1';
        --d
        wait for clk_period*2;
        clr<='0';
        d<="100001000";
        wait for clk_period;
        ini<='1';
        d<="000000000";
        wait for clk_period*11;
        ini<='0';
        clr<='1';
        --e
        wait for clk_period*2;
        clr<='0';
        d<="000000000";
        wait for clk_period;
        ini<='1';
        d<="000000000";
        wait for clk_period*11;
        ini<='0';
        clr<='1';
        wait;
    end process;

end Behavioral;
