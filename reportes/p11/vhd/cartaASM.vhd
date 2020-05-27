library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paqueteEntidades.ALL;

entity cartaASM is
    port( ini,clr,clk:in std_logic;
          d:in std_logic_vector(8 downto 0);
          disp:out std_logic_vector(6 downto 0);
          qa:out std_logic_vector(8 downto 0));
end cartaASM;

architecture Behavioral of cartaASM is
    signal la,ea,a0,z,lb,eb,ec:std_logic;
    signal qb:std_logic_vector(3 downto 0);
    signal di:std_logic_vector(6 downto 0);
begin
    elementoUnidadControl:unidadControl port map(
        clk=>clk,
        clr=>clr,
        ini=>ini,
        a0=>a0,
        z=>z,
        la=>la,
        ea=>ea,
        eb=>eb,
        lb=>lb,
        ec=>ec
    );
    elementoRegistro:registro port map(
        clk=>clk,
        clr=>clr,
        la=>la,
        ea=>ea,
        d=>d,
        z=>z,
        a0=>a0,
        qa=>qa
    );
    
    elementoContador:contador port map(
        lb=>lb,
        eb=>eb,
        clr=>clr,
        clk=>clk,
        qb=>qb
    );
    
    elementoDecodificador:decodificador port map(
        qb=>qb,
        di=>di
    );
    
    elementoMux:muxD port map(
        di=>di,
        ec=>ec,
        disp=>disp
    );

end Behavioral;
