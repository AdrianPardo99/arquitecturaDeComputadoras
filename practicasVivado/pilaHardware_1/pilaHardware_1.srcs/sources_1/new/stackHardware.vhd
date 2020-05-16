library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity stackHardware is
    Port(PCin:in STD_LOGIC_VECTOR(15 downto 0);
         DW, UP, WPC, CLK,CLR:in STD_LOGIC;
         PCout:out STD_LOGIC_VECTOR(15 downto 0);
         SP_out:out STD_LOGIC_VECTOR(2 downto 0));
end stackHardware;

architecture Behavioral of stackHardware is
    type banco is array (0 to 7) of std_logic_vector(15 downto 0);
    signal pila: banco;
begin
    process(CLK,CLR)
        variable sp: integer range 0 to 7;
    begin
        if(CLR = '1') then
            sp := 0;
            pila <= (others =>(others => '0'));
        elsif(CLK'event and clk = '1') then
            if(WPC = '0' and UP = '0' and DW = '0') then
                pila(sp) <= pila(sp)+1;
            elsif(WPC = '1' AND UP = '0' AND DW = '0') then
                pila(sp) <= PCin;
            elsif(WPC = '1' and UP = '1' and DW = '0')then
                sp := sp + 1;
                pila(sp) <= PCin;
            elsif(WPC = '0' and UP = '0' and DW = '1') then
                sp:=sp-1;
                pila(sp)<=pila(sp)-1;
            end if;  
        end if;
        SP_out <= conv_std_logic_vector(sp,3);
        PCout <= pila(sp);
    end process;
end Behavioral;