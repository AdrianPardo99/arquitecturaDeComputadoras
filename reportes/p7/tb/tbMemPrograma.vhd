library ieee;
library std;
use std.textio.all;
use ieee.std_logic_TEXTIO.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tbMemPrograma is
    generic(
        m:integer:= 10;
        n:integer:= 25
    );
end tbMemPrograma;

architecture Behavioral of tbMemPrograma is
    component memPrograma is
        port(
            dir : in STD_LOGIC_VECTOR (m-1 downto 0);
            inst : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;
    signal dir: std_logic_vector(m-1 downto 0):= "0000000000";
    signal inst: std_logic_vector (n-1 downto 0):= "0000000000000000000000000";
begin
    init:memPrograma port map(
        dir=>dir,
        inst=>inst
    );

    testBench:process
        file archRes: text;
        file archVec: text;

        --outputs
        variable lineaRes: line;
        variable varInst: std_logic_vector(n-1 downto 0);
        variable opcode: std_logic_vector(4 downto 0);
        variable sec1: std_logic_vector(3 downto 0);
        variable sec2: std_logic_vector(3 downto 0);
        variable sec3: std_logic_vector(3 downto 0);
        variable sec4: std_logic_vector(3 downto 0);
        variable sec5: std_logic_vector(3 downto 0);

        --inputs
        variable lineaVec: line;
        variable varDir: integer;
        variable cadena: string(1 to 8);
    begin
        file_open(archVec,"/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/memoriaPrograma/input.txt", read_mode);
        file_open(archRes,"/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/memoriaPrograma/output.txt", write_mode);
        cadena:= "      PC";
        write(lineaRes, cadena, right, cadena'LENGTH+1);
        cadena:= "  OPCODE";
        write(lineaRes, cadena, right, cadena'LENGTH+1);
        cadena:= "19...16 ";
        write(lineaRes, cadena, right, cadena'LENGTH+1);
        cadena:= "15...12 ";
        write(lineaRes, cadena, right, cadena'LENGTH+1);
        cadena:= "11...8  ";
        write(lineaRes, cadena, right, cadena'LENGTH+1);
        cadena:= "7...4   ";
        write(lineaRes, cadena, right, cadena'LENGTH+1);
        cadena:= "3...0   ";
        write(lineaRes, cadena, right, cadena'LENGTH+1);
        writeline(archRes, lineaRes);
        ciclo : for i in 0 to 70 loop
            readline(archVec, lineaVec);
            read(lineaVec, varDir);
            dir<= conv_std_logic_vector(varDir,m);
            wait for 10 ns;
            varInst:= inst;
            -- Separa los codigos de operacion y los bits del programa para el archivo de salida
            opcode:= varInst(24 downto 20);
            sec1:= varInst(19 downto 16);
            sec2:= varInst(15 downto 12);
            sec3:= varInst(11 downto 8);
            sec4:= varInst(7 downto 4);
            sec5:= varInst(3 downto 0);
            write(lineaRes, varDir,right,9);
            write(lineaRes, opcode, right, 9);
            write(lineaRes, sec1, right, 8);
            write(lineaRes, sec2, right, 9);
            write(lineaRes, sec3, right, 8);
            write(lineaRes, sec4, right, 8);
            write(lineaRes, sec5, right, 9);
            writeline(archRes, lineaRes);
        end loop;
        file_close(archVec);
        file_close(archRes);
        wait;
    end process;

end Behavioral;
