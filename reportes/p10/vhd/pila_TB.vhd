LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;  --PERMITE USAR STD_LOGIC
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity pila_TB is
    generic(
        N:integer:=16;
        B:integer:=3;
        s:integer:= 25
    );
end pila_TB;

architecture Behavioral of pila_TB is
    component pilapc
    Port(PCin:in STD_LOGIC_VECTOR(N-1 downto 0);
         DW, UP, WPC, CLK,CLR:in STD_LOGIC;
         PCout_h:out STD_LOGIC_VECTOR(s-1 downto 0);
         PCout:out STD_LOGIC_VECTOR(N-1 downto 0);
         SP_out:out STD_LOGIC_VECTOR(B-1 downto 0));
    end component;
    signal PCin:STD_LOGIC_VECTOR(N-1 downto 0);
    signal DW, UP, WPC, CLK,CLR:STD_LOGIC;
    signal PCout_h:STD_LOGIC_VECTOR(s-1 downto 0);
    signal PCout:STD_LOGIC_VECTOR(N-1 downto 0);
    signal SP_out:STD_LOGIC_VECTOR(B-1 downto 0);
    constant CLK_P:time:=10ns;
begin
    pilaH:pilapc port map(
        PCin=>PCin,
        DW=>DW,
        UP=>UP,
        WPC=>WPC,
        CLK=>CLK,
        CLR=>CLR,
        PCout_h=>PCout_h,
        PCout=>PCout,
        SP_out=>SP_out
    );
    
    CLK_Process:process
    begin
        CLK<='0';
        wait for CLK_P/2;
        CLK<='1';
        wait for CLK_P/2;
    end process;
    
    tbPila:process
        file ARCH_ENT:TEXT;
        variable LINEA_ENT:line;    
        variable VAR_PCin:STD_LOGIC_VECTOR (15 downto 0);
        variable VAR_DW:STD_LOGIC;
        variable VAR_UP:STD_LOGIC;
        variable VAR_WPC:STD_LOGIC;
        variable VAR_CLR:STD_LOGIC;
        VARIABLE CADENA:STRING(1 TO 8);
        
        file ARCH_SAL:TEXT;
        variable LINEA_SAL:line;
        variable VAR_PCout:STD_LOGIC_VECTOR(15 downto 0);
        variable VAR_Ins:STD_LOGIC_VECTOR(24 downto 0);
        variable VAR_SPout:STD_LOGIC_VECTOR(2 downto 0);
        variable VAR_OP:STD_LOGIC_VECTOR(4 downto 0);
        variable VAR_Rd:STD_LOGIC_VECTOR(3 downto 0);
        variable VAR_Rt:STD_LOGIC_VECTOR(3 downto 0);
        variable VAR_Rs:STD_LOGIC_VECTOR(3 downto 0);
        variable VAR_Shamt:STD_LOGIC_VECTOR(3 downto 0);
        variable VAR_FuncCode:STD_LOGIC_VECTOR(3 downto 0);
    begin
        file_open(ARCH_ENT, "/run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/pilaHardware_2/in.txt", READ_MODE);      
        file_open(ARCH_SAL, "/run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/pilaHardware_2/out.txt", WRITE_MODE);
        CADENA:="   SP   ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:="   PC   ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:="   OPC  ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:="   Rd   ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:="   Rt   ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:="   Rs   ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:="  Shamt ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:="   FC   ";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        writeline(ARCH_SAL,LINEA_SAL);
        for i in 0 to 31 loop
            readline(ARCH_ENT,LINEA_ENT);
            read(LINEA_ENT,VAR_UP);
            UP <= VAR_UP;
            read(LINEA_ENT,VAR_DW);
            DW <= VAR_DW;
            read(LINEA_ENT,VAR_WPC);
            WPC <= VAR_WPC;
            Hread(LINEA_ENT,VAR_PCin);
            PCin <= VAR_PCin;
            read(LINEA_ENT,VAR_CLR);
            CLR <= VAR_CLR;
            wait until rising_edge(CLK);
            
            VAR_PCout:=PCout;
            VAR_SPout:=SP_out;
            VAR_Ins:=PCout_h;
            VAR_OP:=VAR_Ins(24 downto 20);
            VAR_Rd:=VAR_Ins(19 downto 16);
            VAR_Rt:=VAR_Ins(15 downto 12);
            VAR_Rs:=VAR_Ins(11 downto 8);
            VAR_Shamt:=VAR_Ins(7 downto 4);
            VAR_FuncCode:=VAR_Ins(3 downto 0);
            HWRITE(LINEA_SAL,VAR_SPout, right, 6);
            HWRITE(LINEA_SAL,VAR_PCout, right, 10);
            WRITE(LINEA_SAL,VAR_OP, right, 10);
            WRITE(LINEA_SAL,VAR_Rd, right, 8);
            WRITE(LINEA_SAL,VAR_Rt, right, 10);
            WRITE(LINEA_SAL,VAR_Rs, right, 8);
            WRITE(LINEA_SAL,VAR_Shamt, right, 10);
            WRITE(LINEA_SAL,VAR_FuncCode,right, 8);
            writeline(ARCH_SAL,LINEA_SAL);
        end loop;
        wait for 100 ns;
        file_close(ARCH_ENT);
        file_close(ARCH_SAL);
        wait;
    end process;
end Behavioral;
