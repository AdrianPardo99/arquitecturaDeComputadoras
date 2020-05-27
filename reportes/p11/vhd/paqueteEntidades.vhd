library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteEntidades is
    component muxD is
    port( di: in std_logic_vector(6 downto 0);
          ec: in std_logic;
          disp:out std_logic_vector(6 downto 0));
    end component;
    
    component unidadControl is
    port( clk,clr,ini,z,a0:in std_logic;
          la,lb,ea,eb,ec:out std_logic
    );
    end component;
    
    component decodificador is
    port( qb:in std_logic_vector(3 downto 0);
          di:out std_logic_vector(6 downto 0));
    end component;
    
    component contador is
    port( lb,eb,clr,clk:in std_logic;
          qb:out std_logic_vector(3 downto 0));
    end component;
    
    component registro is
    port( la,ea,clk,clr:in std_logic;
          d: in std_logic_vector(8 downto 0);
          z,a0:out std_logic;
          qa:out std_logic_vector(8 downto 0)
    );
    end component;
end package;
