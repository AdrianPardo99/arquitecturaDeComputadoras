library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity memoriaDatos is
    generic (
        m : integer := 16; --tamanio del bus de direcciones
        n : integer := 16 --tamanio de palabra (dato)
    );
    Port(add : in STD_LOGIC_VECTOR (m-1 downto 0);
         dataIn : in STD_LOGIC_VECTOR (n-1 downto 0);
         wd, clk : in STD_LOGIC;
         dataOut : out STD_LOGIC_VECTOR (n-1 downto 0));
end memoriaDatos;
    
architecture Behavioral of memoriaDatos is
    type banco is array (0 to ((2**m)-1)) of STD_LOGIC_VECTOR(n-1 downto 0);
    signal aux : banco:=(others=>x"0000");
begin
    process(clk,dataIn,wd)
    begin
        if(rising_edge(clk))then
            if (wd = '1') then
                aux(conv_integer(add)) <= dataIn;
                --add Bus de direccion
                --dataIn Bus de datos
            end if;
        end if;
    end process;
    dataOut <= aux(conv_integer(add));
end Behavioral;
