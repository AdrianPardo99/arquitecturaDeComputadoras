library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package modulosHardware is
    -- Elementos de la ALU 16 Bits
    component sumador is
    Port ( a,b,cin : in STD_LOGIC;
           s,cout : out STD_LOGIC);
    end component;
    
    component alu is
    Port ( a, b, sela, selb, cin : in STD_LOGIC;
           res,cout : out STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    --Fin elementos de la ALU
    
    --Archivo de registros
    component demuxG is
    Port ( input : in STD_LOGIC;
           selector : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component registro is
    Port ( d : in STD_LOGIC_VECTOR (15 downto 0);
           clr,clk,l : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component muxGral is
    Port ( chanel_0,chanel_1,chanel_2,chanel_3,chanel_4,chanel_5,chanel_6,chanel_7,chanel_8,chanel_9,chanel_10,chanel_11,chanel_12,chanel_13,chanel_14,chanel_15 : in STD_LOGIC_VECTOR (15 downto 0);
           selectMux : in STD_LOGIC_VECTOR (3 downto 0);
           outMux : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component barrel is
    Port ( dato : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC_VECTOR (3 downto 0);
           dir : std_logic;
           res : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component mux2 is
    Port ( p,s : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           sout : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    --Fin de archivo de registros
    
    --Unidad de control
    component regControl is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           CLR,CLK,L : in STD_LOGIC);
    end component;
    
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
    
    component unControl is
    Port ( TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI,NA,EQ,NE,LT,LE,GT,GE : in STD_LOGIC;
           SM,SDOPC : out STD_LOGIC);
    end component;
    
    --Fin Unidad de control
    
    
    
    
    
    
    --Componentes ESCOMips
    component aluN is
    generic(m:integer:=16);
    Port ( a, b : in STD_LOGIC_VECTOR (m-1 downto 0);
           aluop : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (m-1 downto 0);
           n,z,ov,co : out STD_LOGIC
           );
    end component;
    
    --Memoria de datos para almacenamiento
    component memoriaDatos is
    generic (
        m : integer := 16; --tamanio del bus de direcciones
        n : integer := 16 --tamanio de palabra (dato)
    );
    Port(add : in STD_LOGIC_VECTOR (m-1 downto 0);
         dataIn : in STD_LOGIC_VECTOR (n-1 downto 0);
         wd, clk : in STD_LOGIC;
         dataOut : out STD_LOGIC_VECTOR (n-1 downto 0));
    end component;
    --Fin memoria de datos
    component archRegistros is
    Port ( writeData : in STD_LOGIC_VECTOR (15 downto 0);
           writeReg,readReg1,readReg2,shamt : in STD_LOGIC_VECTOR (3 downto 0);
           WR,CLK,SHE,DIR,clr : in STD_LOGIC;
           readData1 : inout STD_LOGIC_VECTOR (15 downto 0);
           readData2 : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    --Memoria de Programa (Contador de programa)
    component memoriaPrograma is
    generic(
        m:integer:= 10;--tamanio del bus de direcciones
        n:integer:= 25--tamanio de palabra
    );
    Port(dir:in STD_LOGIC_VECTOR (m-1 downto 0);
         inst:out STD_LOGIC_VECTOR (n-1 downto 0));
    end component;
    --Fin Memoria de Programa
    --Pila
    component pila is
    generic(
        N:integer:=16;
        B:integer:=3
    );
    Port(PCin:in STD_LOGIC_VECTOR(N-1 downto 0);
         DW, UP, WPC, CLK,CLR:in STD_LOGIC;
         PCout:out STD_LOGIC_VECTOR(N-1 downto 0);
         SP_out:out STD_LOGIC_VECTOR(B-1 downto 0));
    end component;
    --Fin Pila
    component unidadControl is
    Port ( funCode,banderas : in STD_LOGIC_VECTOR (3 downto 0);
           CLK,CLR : in STD_LOGIC;
           opCode : in STD_LOGIC_VECTOR (4 downto 0);
           microinstruccion : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    component extendDir is
    Port ( entrada : in STD_LOGIC_VECTOR (11 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component extendSig is
    Port ( entrada : in STD_LOGIC_VECTOR (11 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component mux4bits is
    Port ( entrada,entrada1 : in STD_LOGIC_VECTOR (3 downto 0);
           flag : in STD_LOGIC;
           salida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component mux16bits is
    Port ( entrada,entrada1 : in STD_LOGIC_VECTOR(15 downto 0);
        flag : in STD_LOGIC;
        salida : out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    --Fin ESCOMips
    
    --ESCOMips
    
    component escomips is
    Port ( clk,rclr : in STD_LOGIC;
        PC : out STD_LOGIC_VECTOR(15 downto 0);
        instruccion : out STD_LOGIC_VECTOR(24 downto 0);
        readData1,readData2,aluOut,busSR : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    --Fin
    
end modulosHardware;