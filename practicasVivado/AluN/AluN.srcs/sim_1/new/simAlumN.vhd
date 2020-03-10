library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity simAlumN is
    generic(
        m: integer:=4);
--  Port ( );
end simAlumN;

architecture Behavioral of simAlumN is
    component AluN 
        Port ( a, b : in STD_LOGIC_VECTOR (m-1 downto 0);
               aluop : in STD_LOGIC_VECTOR (3 downto 0);
               res : out STD_LOGIC_VECTOR (m-1 downto 0);
               n,z,ov,co : out STD_LOGIC
              );
    end component;
    signal a:STD_LOGIC_VECTOR (m-1 downto 0):=x"0";
    signal b:STD_LOGIC_VECTOR (m-1 downto 0):=x"0";
    signal aluop:STD_LOGIC_VECTOR (3 downto 0):=x"0";
    signal res :STD_LOGIC_VECTOR (m-1 downto 0):=x"0";
    signal ov:STD_LOGIC:='0';
    signal n:STD_LOGIC:='0';
    signal z:STD_LOGIC:='0';
    signal co:STD_LOGIC:='0';
begin
    alu:AluN
        Port map(
            a=>a,
            b=>b,
            aluop=>aluop,
            res=>res,
            n=>n,
            z=>z,
            ov=>ov,
            co=>co
        );
    p3:process
    begin
    --Suma
    a<=x"5";
    b<="1110";
    aluop<="0011";
    wait for 10 ns;
    --Resta
    aluop<="0111";
    wait for 10 ns;
    --AND
    aluop<="0000";
    wait for 10 ns;
    --NAND
    aluop<="1101";
    wait for 10 ns;
    --OR
    aluop<="0001";
    wait for 10 ns;
    --NOR
    aluop<="1100";
    wait for 10 ns;
    --XOR
    aluop<="0010";
    wait for 10 ns;
    --XNOR
    aluop<="1010";
    wait for 10 ns;
    --B=7 Suma 
    b<=x"7";
    aluop<="0011";
    wait for 10 ns;
    --Resta 
    b<=x"5";
    aluop<="0111";
    wait for 10 ns;
    --Nand
    aluop<="1101";
    wait for 10 ns;
    wait;
    end process;
end Behavioral;
