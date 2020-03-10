library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AluN is
generic(
    m: integer:= 4);
    Port ( a, b : in STD_LOGIC_VECTOR (m-1 downto 0);
           aluop : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (m-1 downto 0);
           n,z,ov,co : out STD_LOGIC
           );
end AluN;

architecture Behavioral of AluN is
component alu1 is
    Port ( a, b, sela, selb, cin : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;
signal c: std_logic_vector(m downto 0);
signal aux: std_logic_vector(m-1 downto 0);

begin

    c(0) <= aluop(2);    
    ciclo : for i in 0 to m-1 generate
        bitA : alu1 
        Port  map( 
            a => a(i), 
            b => b(i), 
            sela => aluop(3), 
            selb => aluop(2), 
            cin => c(i), 
            op  => aluop(1 downto 0),
            res => aux(i), 
            cout => c(i+1)
        );    
    end generate;
    
    process(aux,aluop,c)
    variable auxT:std_logic;
    begin
        auxT:='0';
        for i in 0 to m-1 loop
            auxT:=auxT or aux(i);
        end loop;
        z <= not (auxT);
        res <=aux;
        co <= c(m);
        n <= aux(m-1); --signo
        --z <= '1' when aux = "0000" else '0'; --cero
        ov <= c(m) xor c(m-1);--overflow
    end process;
    
    
end Behavioral;
