library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unControl is
    Port ( TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI,NA,EQ,NE,LT,LE,GT,GE : in STD_LOGIC;
           SM,SDOPC : out STD_LOGIC);
end unControl;

architecture Behavioral of unControl is
begin
    SDOPC<=(((not NA)and
        ((BEQI and EQ)or(BNEQI and NE)or(BLTI  and LT)or(BLETI and LE)or
        (BGTI  and GT)or(BGETI and GE)))or 
	   (not(TIPOR or BEQI or BNEQI or BLTI or BLETI or BGTI or BGETI)));
	SM<=not(TIPOR);
end Behavioral;
