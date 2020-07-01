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
    BLTI & R2 & R3 & x"FFC" ,           -- 8 BLTI R3,R2,-4
    NOP & SU & SU & SU & SU & SU ,      -- 9 NOP
    B & SU & x"0009" ,                  --10 B 9
    others=>(others=>'0')
);
