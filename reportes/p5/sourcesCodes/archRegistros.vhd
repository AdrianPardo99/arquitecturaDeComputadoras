library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity archRegistros is
    Port(writeData : in STD_LOGIC_VECTOR (15 downto 0);
           writeReg : in STD_LOGIC_VECTOR (3 downto 0);
           readReg1 : in STD_LOGIC_VECTOR (3 downto 0);
           readReg2 : in STD_LOGIC_VECTOR (3 downto 0);
           shamt : in STD_LOGIC_VECTOR (3 downto 0);
           WR,CLK : in STD_LOGIC;
           SHE,DIR,clr : in STD_LOGIC;
           readData1 : inout STD_LOGIC_VECTOR (15 downto 0);
           readData2 : out STD_LOGIC_VECTOR (15 downto 0));
end archRegistros;

architecture Behavioral of archRegistros is
    component registro
    Port(d : in STD_LOGIC_VECTOR (15 downto 0);
         q : out STD_LOGIC_VECTOR (15 downto 0);
         clr,clk,l : in STD_LOGIC);
    end component;
    
    component barrel 
    Port(dato : in STD_LOGIC_VECTOR (15 downto 0);
         res : out STD_LOGIC_VECTOR (15 downto 0);
         dir : std_logic;
         s : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component muxGral
    Port (chanel_0:in std_logic_vector(15 downto 0);
          chanel_1:in std_logic_vector(15 downto 0);
          chanel_2:in std_logic_vector(15 downto 0);
          chanel_3:in std_logic_vector(15 downto 0);
          chanel_4:in std_logic_vector(15 downto 0);
          chanel_5:in std_logic_vector(15 downto 0);
          chanel_6:in std_logic_vector(15 downto 0);
          chanel_7:in std_logic_vector(15 downto 0);
          chanel_8:in std_logic_vector(15 downto 0);
          chanel_9:in std_logic_vector(15 downto 0);
          chanel_10:in std_logic_vector(15 downto 0);
          chanel_11:in std_logic_vector(15 downto 0);
          chanel_12:in std_logic_vector(15 downto 0);
          chanel_13:in std_logic_vector(15 downto 0);
          chanel_14:in std_logic_vector(15 downto 0);
          chanel_15:in std_logic_vector(15 downto 0);
          selectMux: in STD_LOGIC_VECTOR (3 downto 0);
          outMux :out std_logic_vector(15 downto 0) );
    end component;
    
    component demuxG
    Port(output:out std_logic_vector(15 downto 0);
        input:in  std_logic;
        selector:in std_logic_vector(3 downto 0));
    end component;
    
    component mux2
    Port(p,s: in STD_LOGIC_VECTOR (15 downto 0);
         sel : in STD_LOGIC;
         sout : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
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
