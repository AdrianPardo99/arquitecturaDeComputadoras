LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;


entity archRegTB is
--  Port ( );
end archRegTB;

architecture Behavioral of archRegTB is
    component archRegistros
    Port(writeData : in STD_LOGIC_VECTOR (15 downto 0);
           writeReg : in STD_LOGIC_VECTOR (3 downto 0);
           readReg1 : in STD_LOGIC_VECTOR (3 downto 0);
           readReg2 : in STD_LOGIC_VECTOR (3 downto 0);
           shamt : in STD_LOGIC_VECTOR (3 downto 0);
           WR,CLK : in STD_LOGIC;
           SHE,DIR,clr : in STD_LOGIC;
           readData1 : inout STD_LOGIC_VECTOR (15 downto 0);
           readData2 : out STD_LOGIC_VECTOR (15 downto 0));
    end component;

    --inputs
    signal writeData :  STD_LOGIC_VECTOR (15 downto 0);
    signal writeReg :  STD_LOGIC_VECTOR (3 downto 0);
    signal readReg1 :  STD_LOGIC_VECTOR (3 downto 0);
    signal readReg2 :  STD_LOGIC_VECTOR (3 downto 0);
    signal shamt :  STD_LOGIC_VECTOR (3 downto 0);
    signal WR,CLK :  STD_LOGIC := '0';
    signal SHE,DIR,clr :  STD_LOGIC;

    --outputs
    signal readData1 :  STD_LOGIC_VECTOR (15 downto 0);
    signal readData2 :  STD_LOGIC_VECTOR (15 downto 0);

    --clock
    constant CLK_period : time := 10 ns;

begin
    tb_AR:archRegistros port map(
        writeData =>writeData,
        writeReg => writeReg,
        readReg1 => readReg1,
        readReg2 => readReg2,
        shamt => shamt,
        WR => WR,
        CLK => CLK,
        SHE => SHE,
        DIR => DIR,
        clr => clr,
        readData1 => readData1,
        readData2 => readData2
    );
    CLK_process :process
        begin
            CLK <= '0';
        wait for CLK_period/2;
            CLK <= '1';
        wait for CLK_period/2;
    end process;
    simulacion:process
        file ARCH_SAL : TEXT;
        variable LINEA_SAL: line;
        variable VAR_RD1: STD_LOGIC_VECTOR (15 downto 0);
        variable VAR_RD2: STD_LOGIC_VECTOR (15 downto 0);

        file ARCH_ENT :TEXT;
        variable LINEA_ENT :line;
        variable VAR_WD :  STD_LOGIC_VECTOR (15 downto 0);
        variable VAR_WrRe :  STD_LOGIC_VECTOR (3 downto 0);
        variable VAR_RR1 :  STD_LOGIC_VECTOR (3 downto 0);
        variable VAR_RR2 :  STD_LOGIC_VECTOR (3 downto 0);
        variable VAR_shamt :  STD_LOGIC_VECTOR (3 downto 0);
        variable VAR_WR:  STD_LOGIC;
        variable VAR_SHE,VAR_DIR,VAR_clr :  STD_LOGIC;

        VARIABLE CADENA : STRING(1 TO 6);

    begin
        file_open(ARCH_ENT, "/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/registros/input.txt", READ_MODE);
        file_open(ARCH_SAL, "/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/registros/output.txt", WRITE_MODE);

        CADENA := "_RR1__";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "RR1"
		CADENA := "  _RR2";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "RR2"
		CADENA := " SHAMT";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "SHAMT"
		CADENA := " _WREG";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "WREG"
		CADENA := " _WD__";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "WD"
        CADENA := " _WR__";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "WR"
		CADENA := " _SHE_";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "SHE"
		CADENA := " _DIR_";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "DIR"
		CADENA := " _RD1_";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "RD1"
		CADENA := " _RD2_";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "RD2"
		writeline(ARCH_SAL,LINEA_SAL);



		wait for 100 ns;
		for I in 0 to 11 loop
		  readline(ARCH_ENT,LINEA_ENT);

		  Hread(LINEA_ENT,VAR_WD);
		  writeData <= VAR_WD;
		  Hread(LINEA_ENT,VAR_WrRe);
		  writeReg <= VAR_WrRe;
		  Hread(LINEA_ENT,VAR_RR1);
		  readReg1 <= VAR_RR1;
		  Hread(LINEA_ENT,VAR_RR2);
		  readReg2 <= VAR_RR2;
		  Hread(LINEA_ENT,VAR_shamt);
		  shamt <= VAR_shamt;
		  read(LINEA_ENT,VAR_WR);
		  WR <= VAR_WR;
		  read(LINEA_ENT,VAR_SHE);
		  SHE <= VAR_SHE;
		  read(LINEA_ENT,VAR_DIR);
		  DIR <= VAR_DIR;
		  read(LINEA_ENT,VAR_clr);
		  clr <= VAR_clr;

		 --wait until rising_edge(CLK);
		  wait for 10ns;
		  VAR_RD1 := readData1;
		  VAR_RD2 := readData2;


		  HWRITE(LINEA_SAL,VAR_RR1, right, 5);
		  HWRITE(LINEA_SAL,VAR_RR2, right, 5);
		  WRITE(LINEA_SAL,VAR_shamt, right, 5);
		  HWRITE(LINEA_SAL,VAR_WrRe, right, 5);
		  HWRITE(LINEA_SAL,VAR_WD, right, 5);
      WRITE(LINEA_SAL,VAR_WR,right,5);
		  WRITE(LINEA_SAL,VAR_SHE, right, 5);
		  WRITE(LINEA_SAL,VAR_DIR, right, 5);
		  HWRITE(LINEA_SAL,VAR_RD1, right, 5);
		  HWRITE(LINEA_SAL,VAR_RD2, right, 5);

		  writeline(ARCH_SAL,LINEA_SAL);
		end loop;
		file_close(ARCH_ENT);
		file_close(ARCH_SAL);
	   wait;
    end process;
end Behavioral;
