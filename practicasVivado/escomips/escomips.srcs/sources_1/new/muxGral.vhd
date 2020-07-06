library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxGral is
    Port ( chanel_0,chanel_1,chanel_2,chanel_3,chanel_4,chanel_5,chanel_6,chanel_7,chanel_8,chanel_9,chanel_10,chanel_11,chanel_12,chanel_13,chanel_14,chanel_15 : in STD_LOGIC_VECTOR (15 downto 0);
           selectMux : in STD_LOGIC_VECTOR (3 downto 0);
           outMux : out STD_LOGIC_VECTOR (15 downto 0));
end muxGral;

architecture Behavioral of muxGral is
begin
    process(selectMux,chanel_0,chanel_1,chanel_2,chanel_3,chanel_4,chanel_5,chanel_6,chanel_7,chanel_8,chanel_9,chanel_10,chanel_11,chanel_12,chanel_13,chanel_14,chanel_15)
        begin
            case selectMux is
                    when "0000"  =>outMux<= chanel_0;
                    when "0001"  =>outMux<= chanel_1;
                    when "0010"  =>outMux<= chanel_2;
                    when "0011"  =>outMux<= chanel_3;
                    when "0100"  =>outMux<= chanel_4;
                    when "0101"  =>outMux<= chanel_5;
                    when "0110"  =>outMux<= chanel_6;
                    when "0111"  =>outMux<= chanel_7;
                    when "1000"  =>outMux<= chanel_8;
                    when "1001"  =>outMux<= chanel_9;
                    when "1010"  =>outMux<= chanel_10;
                    when "1011"  =>outMux<= chanel_11;
                    when "1100"  =>outMux<= chanel_12;
                    when "1101"  =>outMux<= chanel_13;
                    when "1110"  =>outMux<= chanel_14;
                    when others => outMux<= chanel_15;
                end case;
    end process;
end Behavioral;
