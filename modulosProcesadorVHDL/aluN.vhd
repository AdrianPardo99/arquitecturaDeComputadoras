library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.modulosHardware.alu;

entity aluN is
    generic(m:integer:=16);
    Port ( a, b : in STD_LOGIC_VECTOR (m-1 downto 0);
           aluop : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (m-1 downto 0);
           n,z,ov,co : out STD_LOGIC
           );
end aluN;

architecture Behavioral of aluN is
    signal c: std_logic_vector(m downto 0);
    signal aux: std_logic_vector(m-1 downto 0);
begin
    c(0)<=aluop(2);
    ciclo:for i in 0 to m-1 generate
        alu1bit:alu port map(
            a=>a(i),
            b=>b(i),
            sela=>aluop(3),
            selb=>aluop(2),
            cin=>c(i),
            op=>aluop(1 downto 0),
            res=>aux(i),
            cout=>c(i+1)
        );
    end generate;
    
    process(aux,aluop,c)
        variable auxT:std_logic;
    begin
        auxT:='0';
        for i in 0 to m-1 loop
            auxT:=auxT or aux(i);
        end loop;
        --z <= not (aux(15) or aux(14) or aux(13) or aux(12) or aux(11) or aux(10) or aux(9) or aux(8) or aux(7) or aux(6) or aux(5) or aux(4) or aux(3) or aux(2) or aux(1) or aux(0));
        z<=not auxT;
        res <=aux;
        co <= c(m);
        n <= aux(m-1); --signo
        --z <= '1' when aux = "0000" else '0'; --cero
        ov <= c(m) xor c(m-1);--overflow
    end process;
end Behavioral;
