library IEEE;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_arith.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;


entity tbMemoria is
end tbMemoria;

architecture Behavioral of tbMemoria is
    component memoriaDat is
        Port(add : in STD_LOGIC_VECTOR (10 downto 0);
             dataIn : in STD_LOGIC_VECTOR (15 downto 0);
             wd, clk : in STD_LOGIC;
             dataOut : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal add:  STD_LOGIC_VECTOR (10 downto 0) :=(others => '0');
    signal dataIn,dataOut :  STD_LOGIC_VECTOR (15 downto 0) :=(others => '0');
    signal clk,wd:  STD_LOGIC := '0';
    signal clk_period : time := 10 ns;
begin
    maping:memoriaDat port map(
        add=>add,
        dataIn=>dataIn,
        wd=>wd,
        clk=>clk,
        dataOut=>dataOut
    );
    clk_proc:process
    begin
        clk<='0';
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
    end process;
    
    test: process
    --Archivos
    file arch_res:text;
    file arch_vec:text;
    
    --Salida
    VARIABLE LINEA_RES : line; --Linea de salida
    VARIABLE VAR_dataOut : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    --Entrada
    VARIABLE LINEA_VEC : line; --Vectores de entrada
	VARIABLE VAR_add : STD_LOGIC_VECTOR(10 DOWNTO 0);
	VARIABLE VAR_dataIn : STD_LOGIC_VECTOR(15 DOWNTO 0);
	VARIABLE VAR_WD : STD_LOGIC;    
	VARIABLE CAD : STRING (1 to 8);
    begin
    file_open(ARCH_VEC, "/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/memoriaDatos/input.txt", READ_MODE);
    file_open(ARCH_RES, "/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/memoriaDatos/output.txt", WRITE_MODE);
    CAD := "     add";
    write(LINEA_RES, CAD, right, CAD'LENGTH+1);
    CAD := "      WD";
    write(LINEA_RES, CAD, right, CAD'LENGTH+1);
    CAD := "  dataIn";
    write(LINEA_RES, CAD, right, CAD'LENGTH+1);
    CAD := " dataOut";
    write(LINEA_RES, CAD, right, CAD'LENGTH+1);
		
    writeline(ARCH_RES,LINEA_RES);
    
    for i in 0 to 11 loop
        readline(ARCH_VEC,LINEA_VEC); --LECTURA DE LAS LINEAS DEL entrada.txt
        Hread(LINEA_VEC, VAR_add);
        add<=VAR_add;
        read(LINEA_VEC, VAR_WD);
        WD<=VAR_WD;
        Hread(LINEA_VEC, VAR_dataIn);
        dataIn<=VAR_dataIn;
        wait until rising_edge(CLK); --Espera hasta el ascenso
        VAR_dataOut := dataOut;
        Hwrite(LINEA_RES, VAR_add, right, 8);
        write (LINEA_RES, VAR_WD, right, 8);
        Hwrite (LINEA_RES, VAR_dataIn, right, 8);
        Hwrite (LINEA_RES, VAR_dataOut, right, 8);
        writeline(ARCH_RES,LINEA_RES);
    end loop;
    file_close(ARCH_VEC);  
	file_close(ARCH_RES); 
	wait;
    end process;
end Behavioral;