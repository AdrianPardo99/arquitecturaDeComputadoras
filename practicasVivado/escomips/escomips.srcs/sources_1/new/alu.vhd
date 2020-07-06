library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.modulosHardware.sumador;
entity alu is
    Port ( a, b, sela, selb, cin : in STD_LOGIC;
           res,cout : out STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0));
end alu;

architecture Behavioral of alu is
    signal auxa, auxb, auxs, and1, or1, xor1,auxc : std_logic;
begin
    auxa<= a xor sela;
    auxb<=b xor selb;
    and1<=auxa and auxb;
    or1<=auxa or auxb;
    xor1<=auxa xor auxb;


    sumador1: sumador 
        Port map( 
        a=>auxa,
        b=>auxb,
        cin=>cin,
        s=>auxs,
        cout=>auxc
    );
    process(and1, or1, xor1, auxs, op)
        begin
        case op is
            when "00"=>res<=and1;
                cout<='0';
            when "01"=>res<=or1;
                cout<='0';
            when "10"=>res<=xor1;
                cout<='0';
            when others=>res<=auxs;
                cout<=auxc;
        end case;
     end process;
end Behavioral;