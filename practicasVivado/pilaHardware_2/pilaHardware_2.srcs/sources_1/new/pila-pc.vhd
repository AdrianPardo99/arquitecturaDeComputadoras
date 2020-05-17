library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity pilapc is
    generic(
        N:integer:=16;
        B:integer:=3;
        m:integer:= 10;--tamanio del bus de direcciones
        s:integer:= 25--tamanio de palabra
    );
    Port(PCin:in STD_LOGIC_VECTOR(N-1 downto 0);
         DW, UP, WPC, CLK,CLR:in STD_LOGIC;
         PCout_h:out STD_LOGIC_VECTOR(s-1 downto 0);
         PCout:out STD_LOGIC_VECTOR(N-1 downto 0);
         SP_out:out STD_LOGIC_VECTOR(B-1 downto 0));
end pilapc;

architecture Behavioral of pilapc is
    component memPrograma is
        Port(dir:in STD_LOGIC_VECTOR (m-1 downto 0);
             inst:out STD_LOGIC_VECTOR (s-1 downto 0));
    end component;
    component pila is
        Port(PCin:in STD_LOGIC_VECTOR(N-1 downto 0);
             DW, UP, WPC, CLK,CLR:in STD_LOGIC;
             PCout:out STD_LOGIC_VECTOR(N-1 downto 0);
             SP_out:out STD_LOGIC_VECTOR(B-1 downto 0));
    end component;
    signal SPCout: STD_LOGIC_VECTOR(N-1 downto 0);
begin
    stack:pila port map(
        PCin=>PCin,
        DW=>DW,
        UP=>UP,
        WPC=>WPC,
        CLK=>CLK,
        CLR=>CLR,
        SP_out=>SP_out,
        PCout=>SPCout
    );
    memoria:memPrograma port map(
        dir=>SPCout(m-1 downto 0),
        inst=>PCout_h
    );
    process (SPCout)
    begin
        PCout<=SPCout;
    end process;
end Behavioral;
