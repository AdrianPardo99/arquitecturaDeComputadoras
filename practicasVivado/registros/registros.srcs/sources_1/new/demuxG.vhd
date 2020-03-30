library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity demuxG is
    Port(output:out std_logic_vector(15 downto 0);
        input:in  std_logic;
        selector:in std_logic_vector(3 downto 0));
end demuxG;

architecture Behavioral of demuxG is

begin
    process(selector,input)
        begin
            if(input = '1')then
                case selector is
                    when "0000"  =>output<= "0000000000000001";
                    when "0001"  =>output<= "0000000000000010";
                    when "0010"  =>output<= "0000000000000100";
                    when "0011"  =>output<= "0000000000001000";
                    when "0100"  =>output<= "0000000000010000";
                    when "0101"  =>output<= "0000000000100000";
                    when "0110"  =>output<= "0000000001000000";
                    when "0111"  =>output<= "0000000010000000";
                    when "1000"  =>output<= "0000000100000000";
                    when "1001"  =>output<= "0000001000000000";
                    when "1010"  =>output<= "0000010000000000";
                    when "1011"  =>output<= "0000100000000000";
                    when "1100"  =>output<= "0001000000000000";
                    when "1101"  =>output<= "0010000000000000";
                    when "1110"  =>output<= "0100000000000000";
                    when others => output<= "1000000000000000";
                end case;
            else
                output<="0000000000000000";
            end if;
    end process;
end Behavioral;
