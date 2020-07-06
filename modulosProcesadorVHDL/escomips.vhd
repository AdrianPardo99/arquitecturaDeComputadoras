library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.modulosHardware.pila;
use WORK.modulosHardware.memoriaPrograma; 
use WORK.modulosHardware.mux4bits;
use WORK.modulosHardware.mux16bits;
use WORK.modulosHardware.extendDir;
use WORK.modulosHardware.extendSig;
use WORK.modulosHardware.archRegistros;
use WORK.modulosHardware.aluN;
use WORK.modulosHardware.memoriaDatos;
use WORK.modulosHardware.unidadControl;

entity escomips is
    Port ( clk,clr : in STD_LOGIC;
        PC : out STD_LOGIC_VECTOR(15 downto 0);
        instruccion : out STD_LOGIC_VECTOR(24 downto 0);
        readData1,readData2,aluOut,busSR : out STD_LOGIC_VECTOR(15 downto 0)
        );
end escomips;

architecture Behavioral of escomips is
    signal sr2Out,flagsALU : STD_LOGIC_VECTOR(3 downto 0);
    signal sdmpOut,swdOut,sop1Out,sop2Out,sdmdOut,srOut,sextOut,eSig,eDir : STD_LOGIC_VECTOR(15 downto 0);
    signal outPila : STD_LOGIC_VECTOR(15 downto 0);
    signal SDMP,DW,UP,WPC,SR2,SWD,SEXT,SHE,DIR,WR,SOP1,SOP2,SDMD,WD,SR : STD_LOGIC;
    signal sp : STD_LOGIC_VECTOR(2 downto 0);
    signal outMemoria : STD_LOGIC_VECTOR(24 downto 0);
    signal microinstruccion : STD_LOGIC_VECTOR (19 downto 0);
    signal outReadData1,outReadData2,outALU,outMemDatos : STD_LOGIC_VECTOR(15 downto 0);
begin

    process(microinstruccion)
    begin
        SDMP<=microinstruccion(19);
        UP<=microinstruccion(18);
        DW<=microinstruccion(17);
        WPC<=microinstruccion(16);
        SR2<=microinstruccion(15);
        SWD<=microinstruccion(14);
        SEXT<=microinstruccion(13);
        SHE<=microinstruccion(12);
        DIR<=microinstruccion(11);
        WR<=microinstruccion(10);
        SOP1<=microinstruccion(9);
        SOP2<=microinstruccion(8);
        SDMD<=microinstruccion(3);
        WD<=microinstruccion(2);
        SR<=microinstruccion(1);
    end process;

    pilaCom:pila port map(
        PCin=>sdmpOut,
        DW=>DW,
        UP=>UP,
        WPC=>WPC,
        CLK=>CLK,
        CLR=>CLR,
        PCout=>outPila,
        SP_out=>sp
    );
    
    memoriaProgramaCom:memoriaPrograma port map(
        dir=>outPila(9 downto 0),
        inst=>outMemoria
    );
    
    sr2Com:mux4bits port map(
        entrada=>outMemoria(11 downto 8),
        entrada1=>outMemoria(19 downto 16),
        flag=>SR2,
        salida=>sr2Out
    );
    
    swdCom:mux16bits port map(
        entrada=>outMemoria(15 downto 0),
        entrada1=>srOut,
        flag=>SWD,
        salida=>swdOut
    );
    
    sdmpCom:mux16bits port map(
        entrada=>outMemoria(15 downto 0),
        entrada1=>srOut,
        flag=>SDMP,
        salida=>sdmpOut
    );
    
    extendDirCom:extendDir port map(
        entrada=>outMemoria(11 downto 0),
        salida=>eDir
    );
    
    extendSigCom:extendSig port map(
        entrada=>outMemoria(11 downto 0),
        salida=>eSig
    );
    
    sextCom:mux16bits port map(
        entrada=>eSig,
        entrada1=>eDir,
        flag=>SEXT,
        salida=>sextOut
    );
    
    archRegistrosCom:archRegistros port map(
        writeData=>swdOut,
        writeReg=>outMemoria(19 downto 16),
        readReg1=>outMemoria(15 downto 12),
        readReg2=>sr2Out,
        shamt=>outMemoria(7 downto 4),
        WR=>WR,
        CLK=>CLK,
        SHE=>SHE,
        DIR=>DIR,
        clr=>CLR,
        readData1=>outReadData1,
        readData2=>outReadData2
    );
    
    sop1Com:mux16bits port map(
        entrada=>outReadData1,
        entrada1=>outPila,
        flag=>SOP1,
        salida=>sop1Out
    );
    
    sop2Com:mux16bits port map(
        entrada=>outReadData2,
        entrada1=>sextOut,
        flag=>SOP2,
        salida=>sop2Out
    );
    
    aluNCom:aluN port map(
        a=>sop1Out,
        b=>sop2Out,
        aluop=>microinstruccion(7 downto 4),
        res=>outALU,
        n=>flagsALU(0),
        z=>flagsALU(2),
        ov=>flagsALU(3),
        co=>flagsALU(1)
    );
    
    sdmdCom:mux16bits port map(
        entrada=>outALU,
        entrada1=>outMemoria(15 downto 0),
        flag=>SDMD,
        salida=>sdmdOut
    );
    
    memoriaDatosCom:memoriaDatos port map(
        add=>sdmdOut,
        dataIn=>outReadData2,
        WD=>WD,
        CLK=>CLK,
        dataOut=>outMemDatos
    );
    
    srCom:mux16bits port map(
        entrada=>outMemDatos,
        entrada1=>outALU,
        flag=>SR,
        salida=>srOut
    );
    
    unidadControlCom:unidadControl port map(
        funCode=>outMemoria(3 downto 0),
        banderas=>flagsALU,
        CLK=>CLK,
        CLR=>CLR,
        opCode=>outMemoria(24 downto 20),
        microinstruccion=>microinstruccion
    );
    
    process(outMemoria,outReadData1,outReadData2,outAlu,srOut,outPila)
    begin
        PC<=outPila;
        instruccion<=outMemoria;
        readData1<=outReadData1;
        readData2<=outReadData2;
        aluOut<=outAlu;
        busSR<=srOut;
    end process;
    
end Behavioral;
