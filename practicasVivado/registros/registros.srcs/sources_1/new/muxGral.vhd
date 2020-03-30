library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxGral is
    Port (chanel_0:in std_logic_vector(15 downto 0);
        chanel_1:in std_logic_vector(15 downto 0);
        chanel_2:in std_logic_vector(15 downto 0);
        chanel_3:in std_logic_vector(15 downto 0);
        chanel_4:in std_logic_vector(15 downto 0);
        chanel_5:in std_logic_vector(15 downto 0);
        chanel_6:in std_logic_vector(15 downto 0);
        chanel_7:in std_logic_vector(15 downto 0);
        chanel_8:in std_logic_vector(15 downto 0);
        chanel_9:in std_logic_vector(15 downto 0);
        chanel_10:in std_logic_vector(15 downto 0);
        chanel_11:in std_logic_vector(15 downto 0);
        chanel_12:in std_logic_vector(15 downto 0);
        chanel_13:in std_logic_vector(15 downto 0);
        chanel_14:in std_logic_vector(15 downto 0);
        chanel_15:in std_logic_vector(15 downto 0);
        selectMux: in STD_LOGIC_VECTOR (3 downto 0);
    outMux :out std_logic_vector(15 downto 0) );
end muxGral;

architecture Behavioral of muxGral is
begin
    process(selectMux)
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
