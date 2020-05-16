LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;  --PERMITE USAR STD_LOGIC
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity pilaHW_TB is
end pilaHW_TB;

architecture Behavioral of pilaHW_TB is
    component stackHardware
        Port(PCin:in STD_LOGIC_VECTOR(15 downto 0);
         DW, UP, WPC, CLK,CLR:in STD_LOGIC;
         PCout:out STD_LOGIC_VECTOR(15 downto 0);
         SP_out:out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    --In
    signal PCin:STD_LOGIC_VECTOR(15 downto 0);
    signal DW,UP,WPC,CLK,CLR:STD_LOGIC;
    --Out
    signal PCout:STD_LOGIC_VECTOR(15 downto 0);
    signal SP_out:STD_LOGIC_VECTOR(2 downto 0);
    --CLK
    constant CLK_period:time:=10ns;
begin
    pilaHWTB:stackHardware port map(
        PCin=>PCin,
        DW=>DW,
        UP=>UP,
        WPC=>WPC,
        CLK=>CLK,
        CLR=>CLR,
        PCout=>PCout,
        SP_out=>SP_out
    );
    clk_process: process 
    begin
        CLK<='0';
        wait for CLK_period/2;
        CLK<='1';
        wait for CLK_period/2;
    end process;
    tb:process
        --OUT
        file ARCH_SAL:TEXT;
        variable LINEA_SAL:line;
        variable VAR_PCout:STD_LOGIC_VECTOR(15 downto 0);
        variable VAR_SP_out:STD_LOGIC_VECTOR(2 downto 0);
        --IN
        file ARCH_ENT:TEXT;
        variable LINEA_ENT:line;    
        variable VAR_PCin:STD_LOGIC_VECTOR (15 downto 0);
        variable VAR_DW:STD_LOGIC;
        variable VAR_UP:STD_LOGIC;
        variable VAR_WPC:STD_LOGIC;
        variable VAR_CLR:STD_LOGIC;
        VARIABLE CADENA:STRING(1 TO 6);
    begin
        file_open(ARCH_ENT, "/run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/pilaHardware_1/in.txt", READ_MODE);      
        file_open(ARCH_SAL, "/run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/pilaHardware_1/out.txt", WRITE_MODE);       
        CADENA:="SPout_";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
        CADENA:=" PCout";
        write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);       
        writeline(ARCH_SAL,LINEA_SAL);
        wait for 100 ns;
        for I in 0 to 22 loop
            readline(ARCH_ENT,LINEA_ENT);
            
            Hread(LINEA_ENT,VAR_PCin);
            PCin <= VAR_PCin;
            
            read(LINEA_ENT,VAR_DW);
            DW <= VAR_DW;
            
            read(LINEA_ENT,VAR_UP);
            UP <= VAR_UP;
            
            read(LINEA_ENT,VAR_WPC);
            WPC <= VAR_WPC;
            
            read(LINEA_ENT,VAR_CLR);
            CLR <= VAR_CLR;
            
            --wait until rising_edge(CLK);
            wait for 10ns;
            VAR_PCout:=PCout;
            VAR_SP_out:=SP_out;
            HWRITE(LINEA_SAL,VAR_SP_out, right, 4);
            HWRITE(LINEA_SAL,VAR_PCout, right, 9);
            writeline(ARCH_SAL,LINEA_SAL);
        end loop;
        file_close(ARCH_ENT);
        file_close(ARCH_SAL);
        wait;
    end process;
end Behavioral;
