library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paqueteHardware is

    component condition is
    Port ( Q : in STD_LOGIC_VECTOR (3 downto 0);
           EQ,NE,LT,LE,GT,GE : out STD_LOGIC);
    end component;
    
    component decInstrucciones is
    Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
           TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : out STD_LOGIC);
    end component;
    
    component level is
    Port ( CLR,CLK : in STD_LOGIC;
           NA : out STD_LOGIC);
    end component;
    
    component mopcode is
    Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
           micro : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    component mfuncode is
    Port ( funCode : in STD_LOGIC_VECTOR (3 downto 0);
           micro : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    component registro is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           CLR,CLK,L : in STD_LOGIC);
    end component;
    
    component unControl is
    Port ( TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI,NA,EQ,NE,LT,LE,GT,GE : in STD_LOGIC;
           SM,SDOPC : out STD_LOGIC);
    end component;
    
end paqueteHardware;