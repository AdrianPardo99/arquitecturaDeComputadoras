library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxD is
    port( di: in std_logic_vector(6 downto 0);
          ec: in std_logic;
          disp:out std_logic_vector(6 downto 0));
end muxD;

architecture Behavioral of muxD is
    constant nx:std_logic_vector(6 downto 0):="1111110";
begin
    with ec select disp <=nx when '0', di when others;

end Behavioral;
