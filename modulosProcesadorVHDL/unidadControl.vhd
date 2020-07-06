library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.modulosHardware.regControl;
use WORK.modulosHardware.condition;
use WORK.modulosHardware.decInstrucciones;
use WORK.modulosHardware.level;
use WORK.modulosHardware.mopcode;
use WORK.modulosHardware.mfuncode;
use WORK.modulosHardware.unControl;

entity unidadControl is
    Port ( funCode,banderas : in STD_LOGIC_VECTOR (3 downto 0);
           CLK,CLR : in STD_LOGIC;
           opCode : in STD_LOGIC_VECTOR (4 downto 0);
           microinstruccion : out STD_LOGIC_VECTOR (19 downto 0));
end unidadControl;

architecture Behavioral of unidadControl is
    signal outMicro:std_logic_vector(19 downto 0);
    signal muxMopCode:std_logic_vector(4 downto 0);
    signal outMFunCode,outMOpCode:std_logic_vector(19 downto 0);
    signal NA,EQ,NE,LT,LE,GT,GE,LF,SM,SDOPC,TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI:std_logic;
    signal Q:std_logic_vector(3 downto 0);
begin
    process(SDOPC,SM,outMicro,opCode,outMOpCode,outMFunCode,LF)
    begin
        if SDOPC='1' then
            muxMopCode<=opCode;
        else
            muxMopCode<=(others=>'0');
        end if;
        
        if SM='1' then
            outMicro<=outMOpCode;
        else
            outMicro<=outMFunCode;
        end if;
        LF<=outMicro(0);
        microinstruccion<=outMicro;
    end process;
    
    mfuncode_co:mfuncode port map(
        funCode=>funCode,
        micro=>outMFunCode
    );
    
    decodificador:decInstrucciones port map(
        opCode=>opCode,
        TIPOR=>TIPOR,
        BEQI=>BEQI,
        BNEQI=>BNEQI,
        BLTI=>BLTI,
        BLETI=>BLETI,
        BGTI=>BGTI,
        BGETI=>BGETI
    );
    
    level_com:level port map(
        CLR=>CLR,
        CLK=>CLK,
        NA=>NA
    );
    
    reg_com:regControl port map(
        D=>banderas,
        Q=>Q,
        CLR=>CLR,
        CLK=>CLK,
        L=>LF
    );
    
    condition_com:condition port map(
        Q=>Q,
        EQ=>EQ,
        NE=>NE,
        LT=>LT,
        LE=>LE,
        GT=>GT,
        GE=>GE
    );
    
    mop_com:mopcode port map(
        opCode=>muxMopCode,
        micro=>outMOpCode
    );
    
    unC_com:unControl port map(
        TIPOR=>TIPOR,
        BEQI=>BEQI,
        BNEQI=>BNEQI,
        BLTI=>BLTI,
        BLETI=>BLETI,
        BGTI=>BGTI,
        BGETI=>BGETI,
        NA=>NA,
        EQ=>EQ,
        NE=>NE,
        LT=>LT,
        LE=>LE,
        GT=>GT,
        GE=>GE,
        SM=>SM,
        SDOPC=>SDOPC
    );

end Behavioral;
