library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mopcode is
    Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
           micro : out STD_LOGIC_VECTOR (19 downto 0));
end mopcode;

architecture Behavioral of mopcode is
type mem is array(0 to 31) of std_logic_vector(19 downto 0);
constant mopcode: mem:=("00001000000001110001",-- 0 VERIFI
                        "00000000010000000000",-- 1 LI
                        "00000100010000001000",-- 2 LWI
                        "00001000000000001100",-- 3 SWI
                        "00001010000100110101",-- 4 SW
                        "00000100010100110011",-- 5 ADDI
                        "00000100010101110011",-- 6 SUBI
                        "00000100010100000011",-- 7 ANDI
                        "00000100010100010011",-- 8 ORI
                        "00000100010100100011",-- 9 XORI
                        "00000100010111010011",-- 10 NANDI
                        "00000100010111000011",-- 11 NORI
                        "00000100010110100011",-- 12 XNORI
                        "10010000001100110011",-- 13 BEQI
                        "10010000001100110011",-- 14 BNEI
                        "10010000001100110011",-- 15 BLTI
                        "10010000001100110011",-- 16 BLETI
                        "10010000001100110011",-- 17 BGTI
                        "10010000001100110011",-- 18 BGETI
                        "00010000000000000000",-- 19 B
                        "01010000000000000000",-- 20 CALL
                        "00100000000000000000",-- 21 RET
                        "00000000000000000000",-- 22 NOP                            
                        "00001110010100110001", --23 LW 
                        others=>x"00000");
begin
    micro<=mopcode(conv_integer(opCode));
end Behavioral;
