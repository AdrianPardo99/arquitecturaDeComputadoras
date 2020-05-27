library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidadControl is
    port( clk,clr,ini,z,a0:in std_logic;
          la,lb,ea,eb,ec:out std_logic
    );
end unidadControl;

architecture Behavioral of unidadControl is
    type estados is (e0,e1,e2);
    signal edoA,edoS:estados;
begin
    process(clk,clr)
    begin
        if(clr='1') then
            edoA<=e0;
        elsif rising_edge(clk) then
            edoA<=edoS;
        end if;
    end process;
    process(edoA,ini,z,a0)
    begin
        la<='0';
        ea<='0';
        lb<='0';
        eb<='0';
        ec<='0';
        case edoA is
            when e0 => 
                lb <= '1';
                if(ini='0') then
                    la<='1';
                    edoS<=e0;
                else
                    edoS<=e1;
                end if;
            when e1 => 
                ea <= '1';
                if(z='0') then
                    if(a0='0') then
                        edoS<=e1;
                    else
                        eb<='1';
                        edoS<=e1;
                    end if;
                else
                    edoS<=e2;
                end if;
            when e2=> 
                ec <='1';
                if(ini='0') then
                    edoS<=e0;
                else
                    edoS<=e2;
                end if;
        end case;
    end process;
end Behavioral;