library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity memoriaPrograma is
    generic(
        m:integer:= 10;--tamanio del bus de direcciones
        n:integer:= 25--tamanio de palabra
    );
    Port(dir:in STD_LOGIC_VECTOR (m-1 downto 0);
         inst:out STD_LOGIC_VECTOR (n-1 downto 0));
end memoriaPrograma;

architecture Behavioral of memoriaPrograma is
        --C-OPERACION
    constant TYPER: std_logic_vector(4 downto 0):="00000";
    constant LI: std_logic_vector(4 downto 0):="00001";
    constant LWI: std_logic_vector(4 downto 0):="00010";
    constant LW: std_logic_vector(4 downto 0):="10111";
    constant SWI: std_logic_vector(4 downto 0):="00011";
    constant SW: std_logic_vector(4 downto 0):="00100";
    constant ADDI: std_logic_vector(4 downto 0):="00101";
    constant SUBI: std_logic_vector(4 downto 0):="00110";
    constant ANDI: std_logic_vector(4 downto 0):="00111";
    constant ORI: std_logic_vector(4 downto 0):="01000";
    constant XORI: std_logic_vector(4 downto 0):="01001";
    constant NANDI: std_logic_vector(4 downto 0):="01010";
    constant NORI: std_logic_vector(4 downto 0):="01011";
    constant XNORI: std_logic_vector(4 downto 0):="01100";
    constant BEQI: std_logic_vector(4 downto 0):="01101";
    constant BNEI: std_logic_vector(4 downto 0):="01110";
    constant BLTI: std_logic_vector(4 downto 0):="01111";
    constant BLETI: std_logic_vector(4 downto 0):="10000";
    constant BGTI: std_logic_vector(4 downto 0):="10001";
    constant BGETI: std_logic_vector(4 downto 0):="10010";
    constant B: std_logic_vector(4 downto 0):="10011";
    constant CALL: std_logic_vector(4 downto 0):="10100";
    constant RET: std_logic_vector(4 downto 0):="10101";
    constant NOP: std_logic_vector(4 downto 0):="10110";

        --REG
    CONSTANT R0: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
    CONSTANT R1: STD_LOGIC_VECTOR(3 DOWNTO 0):="0001";
    CONSTANT R2: STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
    CONSTANT R3: STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
    CONSTANT R4: STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
    CONSTANT R5: STD_LOGIC_VECTOR(3 DOWNTO 0):="0101";
    CONSTANT R6: STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
    CONSTANT R7: STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
    CONSTANT R8: STD_LOGIC_VECTOR(3 DOWNTO 0):="1000";
    CONSTANT R9: STD_LOGIC_VECTOR(3 DOWNTO 0):="1001";
    CONSTANT R10: STD_LOGIC_VECTOR(3 DOWNTO 0):="1010";
    CONSTANT R11: STD_LOGIC_VECTOR(3 DOWNTO 0):="1011";
    CONSTANT R12: STD_LOGIC_VECTOR(3 DOWNTO 0):="1100";
    CONSTANT R13: STD_LOGIC_VECTOR(3 DOWNTO 0):="1101";
    CONSTANT R14: STD_LOGIC_VECTOR(3 DOWNTO 0):="1110";
    CONSTANT R15: STD_LOGIC_VECTOR(3 DOWNTO 0):="1111";

        --S/U
    CONSTANT SU: std_logic_vector(3 downto 0):="0000";
        --C-FIN-OPERACION
    CONSTANT ADD: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
    CONSTANT SUB: STD_LOGIC_VECTOR(3 DOWNTO 0):="0001";
    CONSTANT C_AND: STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
    CONSTANT C_OR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
    CONSTANT C_XOR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
    CONSTANT C_NAND: STD_LOGIC_VECTOR(3 DOWNTO 0):="0101";
    CONSTANT C_NOR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
    CONSTANT C_XNOR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
    CONSTANT C_NOT: STD_LOGIC_VECTOR(3 DOWNTO 0):="1000";
    CONSTANT C_SLL: STD_LOGIC_VECTOR(3 DOWNTO 0):="1001";
    CONSTANT C_SRL: STD_LOGIC_VECTOR(3 DOWNTO 0):="1010";

    type banco is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0);

    constant aux:banco:=(
    ---------------------------------------------------------------------
                               --MAIN 
    -- Datos modificables
    -- R0=N         ->      Tamaño del arreglo
    -- R1=M         ->      Dato con el que inicia el arreglo
    -- Datos estaticos  
    -- R7=N-1       ->      Para el segundo for
    -- R3=j         ->      Contador del for 2
    -- R2=i         ->      Contador del for 1
    -- R6=j+1       ->      Control del acceso de casilla 2
    
    -- En llenar datos en la linea 10 modificar el valor de decremento
    
    -- Pseudocodigo apartado Bubble Sort
    -- for(R2=1; R2<R0; R2++){
    --   for(R3=0; R3<R7; R3++){
    --       R6=R3+1
    --       R4=mem[x20+R3]
    --       R5=mem[x20+R6]
    --       if(R4<R5){
    --           mem[x020+R3]=R5
    --           mem[x020+R6]=R4
    --       }
    --   }
    -- }
    ---------------------------------------------------------------------
    LI & R0 & x"0028",            --  0 LI R0, #N Total de datos
    LI & R1 & x"00FB",            --  1 LI R1, # Dato inicial
    LI & R2 & x"0000",            --  2 LI R2, #0 Contador para i
    LI & R3 & x"0000",            --  3 LI R3. #0 Contador para j
    CALL & SU & x"0009",          --  4 CALL Llenar(0x0009)
    CALL & SU & x"0014",          --  5 CALL BubbleS(0x0014)
    CALL & SU & x"001F",          --  6 CALL Show(0x001F)
    NOP & SU & SU & SU & SU & SU, --  7 NOP
    B & SU & x"0006",             --  8 B Mostrar(0x0006)
    ---------------------------------------------------------------------
                            --Llenar datos
    ---------------------------------------------------------------------
    SW & R1 & R2 & x"020",        --  9 SW R1,R2,0x020 mem[0x020+R2]=R1
    SUBI & R1 & R1 & x"001",      -- 10 SUBI R1,R1,#2  R1=R1-2
    ADDI & R2 & R2 & x"001",      -- 11 ADDI R2,R2,#1  R2=R2+1
    BLTI & R0 & R2 & x"FFD",      -- 12 BLTI R0,R2,-3
    LI & R2 & x"0001",            -- 13 LI R2, #1
    RET & SU & SU & SU & SU & SU, -- 14 RET
    ---------------------------------------------------------------------
                                --Swap
    ---------------------------------------------------------------------
    BGTI & R5 & R4 & x"002",      -- 15 BGTI R5,R4,+2 Aqui es para Cambiar el tipo de ordenamiento R4>R5
    B & SU & x"001A",             -- 16 B BubbleS(0x001A)
    SW & R5 & R3 & x"020",        -- 17 SW R5,R3,0x20 mem[0x020+R3]=R5
    SW & R4 & R6 & x"020",        -- 18 SW R4,R6,0x20 mem[0x020+R6]=R4
    B & SU & x"001A",             -- 19 B BubbleS(0x001A)
    ---------------------------------------------------------------------
                             --Bubble Sort
    ---------------------------------------------------------------------
    SUBI & R7 & R0 & x"001",      -- 20 SUBI R7,R0 #1 
    LI & R3 & x"0000",            -- 21 LI R3, #0
    ADDI & R6 & R3 & x"001",      -- 22 ADDI R6,R3 #1  R6=R3+1
    LW & R4 & R3 & x"020",        -- 23 LW R4,R3, x20
    LW & R5 & R6 & x"020",        -- 24 LW R5,R6, x20
    B & SU & x"000F",             -- 25 B Swap
    ADDI & R3 & R3 & x"001",      -- 26 ADDI R3,R3 #1 R3=R3+1
    BLTI & R7 & R3 & x"FFB",      -- 27 BLTI R7,R3 #-5
    ADDI & R2 & R2 & x"001",      -- 28 ADDI R2,R2 #1 R2=R2+1
    BLTI & R0 & R2 & x"FF8",      -- 29 BLTI R0,R2 #-8
    RET & SU & SU & SU & SU & SU, -- 30 RET
    ---------------------------------------------------------------------
                               --Show Res
    ---------------------------------------------------------------------
    LI & R2 & x"0000",            -- 31 LI R2 #0
    LW & R4 & R2 & x"020",        -- 32 LW R4,R2,x20
    ADDI & R2 & R2 & x"001",      -- 33 ADDI R2,R2 #1
    BLTI & R0 & R2 & x"FFE",      -- 34 BLTI R0,R2 #-2
    RET & SU & SU & SU & SU & SU, -- 35 RET
    others=>(others=>'0')
    );
begin
    inst <= aux(conv_integer(dir));
end Behavioral;
