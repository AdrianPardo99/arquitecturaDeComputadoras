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
        -- Segundo programa proyecto Fibonacci
        LI & R0 & x"0000" ,                 -- 0 LI R0, #0
        LI & R1 & x"0001" ,                 -- 1 LI R1, #1
        LI & R2 & x"0000" ,                 -- 2 LI R2, #0
        LI & R3 & x"000F" ,                 -- 3 LI R3, #15
        TYPER & R4 & R0 & R1 & SU & ADD ,   -- 4 ADD R1,R1,R0
        SUBI & R0 & R1 & x"000" ,           -- 5 SUBI R0,R1,#0
        SUBI & R1 & R4 & x"000" ,           -- 6 SUBI R1,R4,#0
        ADDI & R2 & R2 & x"001" ,           -- 7 ADDI R2,R2,#1
        BLTI & R3 & R2 & x"FFC" ,           -- 8 BLTI R3,R2,-4
        NOP & SU & SU & SU & SU & SU ,      -- 9 NOP
        B & SU & x"0009" ,                  --10 B 9
        others=>(others=>'0')
    );
begin
    inst <= aux(conv_integer(dir));
end Behavioral;
