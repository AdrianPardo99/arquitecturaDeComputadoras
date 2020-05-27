library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro is
    port( la,ea,clk,clr:in std_logic;
          d: in std_logic_vector(8 downto 0);
          z,a0:out std_logic;
          qa:out std_logic_vector(8 downto 0)
    );
end registro;

architecture Behavioral of registro is
    signal a:std_logic_vector(8 downto 0);
begin
    process(clk,clr,a)
    begin
        if(clr='1') then
            a<=(others =>'0');
        elsif rising_edge(clk) then
            if(la='1' and ea='0') then
                a<=d;
            end if;
            if(la='0' and ea='1') then
                a<=to_stdlogicvector(to_bitvector(a) srl 1);
            end if;
        end if;
        qa<=a;
        a0<=a(0);
        z<=not(a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7) or a(8));
    end process;

end Behavioral;
