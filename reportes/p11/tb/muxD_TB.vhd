library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.paqueteentidades.muxD;

entity muxD_TB is
end muxD_TB;

architecture Behavioral of muxD_TB is
    signal di:std_logic_vector(6 downto 0):="0000000";
    signal ec:std_logic:='0';
    signal disp:std_logic_vector(6 downto 0):="0000000";
begin
    mux:muxD port map(
        di=>di,
        ec=>ec,
        disp=>disp
    );
    muxTB:process
    begin
        ec<='0';
        wait for 1ns;
        ec<='1';
        di<="0110000";
        wait for 1ns;
        di<="1101101";
        wait for 1ns;
        ec<='0';
        wait;
    
    end process;

end Behavioral;
