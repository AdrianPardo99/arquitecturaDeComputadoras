library IEEE;
LIBRARY STD;
use IEEE.STD_LOGIC_1164.ALL;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;  --PERMITE USAR STD_LOGIC
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;


entity arquitectura_TB is
end arquitectura_TB;

architecture Behavioral of arquitectura_TB is
    component arquitectura is
    Port ( funCode,banderas : in STD_LOGIC_VECTOR (3 downto 0);
           CLK,CLR : in STD_LOGIC;
           opCode : in STD_LOGIC_VECTOR (4 downto 0);
           microinstruccion : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    signal funCode,banderas : STD_LOGIC_VECTOR (3 downto 0):=(others=>'0');
    signal CLK,CLR : STD_LOGIC:='0';
    signal opCode : STD_LOGIC_VECTOR (4 downto 0):=(others=>'0');
    signal microinstruccion : STD_LOGIC_VECTOR (19 downto 0):=(others=>'0');
    constant CLK_P : time:=10 ns;
begin
    arquitectura_TB:arquitectura port map(
        funCode=>funCode,
        banderas=>banderas,
        CLK=>CLK,
        CLR=>CLR,
        opCode=>opCode,
        microinstruccion=>microinstruccion
    );
    
    clk_Pr:process
    begin
        CLK<='1';
        wait for CLK_P/2;
        CLK<='0';
        wait for CLK_P/2;
    end process;
    
    simulacion:process
        --salida
        file ARCH_SAL : TEXT;
        variable LINEA_SAL: line;
        variable VAR_Microins: STD_LOGIC_VECTOR(19 downto 0);
        
        --entrada
        file ARCH_ENT :TEXT;
        variable LINEA_ENT :line;
        VARIABLE VAR_FunCode : STD_LOGIC_VECTOR (3 downto 0);
        VARIABLE VAR_opCode : STD_LOGIC_VECTOR (4 downto 0);
        VARIABLE VAR_CLK,VAR_CLR,VAR_LF : STD_LOGIC;
        VARIABLE VAR_Flags : STD_LOGIC_VECTOR (3 downto 0);
        
        VARIABLE CADENA : STRING(1 TO 9);
        VARIABLE NIVEL : STRING(1 TO 4);
    begin
        file_open(ARCH_ENT, "/run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/unidadDeControl/in.txt", READ_MODE);
        file_open(ARCH_SAL, "/run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/unidadDeControl/out.txt", WRITE_MODE);
        
        CADENA := "_OP_CODE_";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA := "_FUN_CODE";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA := "_BANDERAS";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA := " __CLR___";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        --CADENA := " ___LF___";
        --write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA := "_MICRONST";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA := " __NIVEL_";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+11);
        
        writeline(ARCH_SAL,LINEA_SAL);
        
        wait for 100ns;
        for i in 0 to 51 loop
            readline(ARCH_ENT,LINEA_ENT);
            
            read(LINEA_ENT,VAR_opCode);
            opCode <= VAR_opCode;
            
            read(LINEA_ENT,VAR_FunCode);
            funCode <= VAR_FunCode;
            
            read(LINEA_ENT,VAR_Flags);
            banderas <= VAR_Flags;
            
            read(LINEA_ENT,VAR_CLR);
            CLR <= VAR_CLR;
            
            read(LINEA_ENT,VAR_LF);
            
            --wait until rising_edge(CLK);
            wait for 5ns;
            VAR_Microins:=microinstruccion;
            
            WRITE(LINEA_SAL,VAR_opCode, right, 5);
            WRITE(LINEA_SAL,VAR_FunCode, right, 10);
            WRITE(LINEA_SAL,VAR_Flags, right, 10);
            WRITE(LINEA_SAL,VAR_CLR, right, 10);
            WRITE(LINEA_SAL,VAR_Microins, right, 26);
            if CLK = '1' then
                NIVEL :="ALTO";
                write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+3);
            else
                NIVEL :="BAJO";
                write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+3);
            end if;
            writeline(ARCH_SAL,LINEA_SAL);
            
            wait for 5ns;
            VAR_Microins:=microinstruccion;
            
            WRITE(LINEA_SAL,VAR_opCode, right, 5);
            WRITE(LINEA_SAL,VAR_FunCode, right, 10);
            WRITE(LINEA_SAL,VAR_Flags, right, 10);
            WRITE(LINEA_SAL,VAR_CLR, right,10);
            WRITE(LINEA_SAL,VAR_Microins, right, 26);
            if CLK = '1' then
                NIVEL :="ALTO";
                write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+3);
            else
                NIVEL :="BAJO";
                write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+3);
            end if;
            writeline(ARCH_SAL,LINEA_SAL);
        end loop;
        file_close(ARCH_ENT);
        file_close(ARCH_SAL);
        wait;               
    end process;
end Behavioral;
