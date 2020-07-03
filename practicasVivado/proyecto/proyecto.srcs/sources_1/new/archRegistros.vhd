library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.modulosHardware.demuxG;
use WORK.modulosHardware.registro;
use WORK.modulosHardware.muxGral;
use WORK.modulosHardware.barrel;
use WORK.modulosHardware.mux2;

entity archRegistros is
    Port ( writeData : in STD_LOGIC_VECTOR (15 downto 0);
           writeReg,readReg1,readReg2,shamt : in STD_LOGIC_VECTOR (3 downto 0);
           WR,CLK,SHE,DIR,clr : in STD_LOGIC;
           readData1 : inout STD_LOGIC_VECTOR (15 downto 0);
           readData2 : out STD_LOGIC_VECTOR (15 downto 0));
end archRegistros;

architecture Behavioral of archRegistros is
    signal BS_out :std_logic_vector(15 downto 0);--salida del barrel shifter
    signal WRSHE_out :std_logic_vector(15 downto 0);
    signal WR_writeREG:std_logic_vector(15 downto 0);
    TYPE banco is array (0 to 15) of std_logic_vector(15 downto 0);
    signal q:banco;
begin
    WR_writeregister: demuxG Port map(
        output => WR_writeREG,
        input => WR,
        selector => writeReg
    );
    
    Barrel_shifter:barrel Port map(
        dato => readData1,
        res => BS_out,
        dir => DIR,      
        s => shamt
    );
    
    entrada_registros: mux2 port map(
        sel => SHE,
        p => writeData,
        s => BS_out,
        sout =>WRSHE_out
    );
    
    ciclo: for i in 0 to 15 generate
        Registros:registro PORT MAP(
        d=>WRSHE_out,
        q => q(i),
        clr =>clr,
        clk => CLK,
        L =>WR_writeREG(i)
        );
    end generate;
    
    muxreadData1:muxGral Port map(
        chanel_0 => q(0),
        chanel_1 => q(1),
        chanel_2 => q(2),
        chanel_3 => q(3),
        chanel_4 => q(4),
        chanel_5 => q(5),
        chanel_6 => q(6),
        chanel_7 => q(7),
        chanel_8 => q(8),
        chanel_9 => q(9),
        chanel_10 => q(10),
        chanel_11 => q(11),
        chanel_12 => q(12),
        chanel_13 => q(13),
        chanel_14 => q(14),
        chanel_15 => q(15),
        selectMux => readReg1,
        outMux =>readData1
    );
    muxreadData2:muxGral Port map(
        chanel_0 => q(0),
        chanel_1 => q(1),
        chanel_2 => q(2),
        chanel_3 => q(3),
        chanel_4 => q(4),
        chanel_5 => q(5),
        chanel_6 => q(6),
        chanel_7 => q(7),
        chanel_8 => q(8),
        chanel_9 => q(9),
        chanel_10 => q(10),
        chanel_11 => q(11),
        chanel_12 => q(12),
        chanel_13 => q(13),
        chanel_14 => q(14),
        chanel_15 => q(15),
        selectMux => readReg2,
        outMux =>readData2
    );
end Behavioral;
