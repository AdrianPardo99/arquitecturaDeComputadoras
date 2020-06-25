-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Wed Jun 24 22:50:02 2020
-- Host        : illBeWithYou running 64-bit Fedora release 32 (Thirty Two)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/unidadDeControl/unidadDeControl.sim/sim_1/synth/func/xsim/arquitectura_TB_func_synth.vhd
-- Design      : arquitectura
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity level is
  port (
    nclk1 : out STD_LOGIC;
    pclk1 : out STD_LOGIC;
    microinstruccion_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pclk1_reg_0 : out STD_LOGIC;
    pclk1_reg_1 : out STD_LOGIC;
    CLK_IBUF_BUFG : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    opCode_IBUF : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \microinstruccion[1]\ : in STD_LOGIC;
    \microinstruccion[8]\ : in STD_LOGIC;
    \microinstruccion[6]\ : in STD_LOGIC;
    \microinstruccion[15]\ : in STD_LOGIC;
    \microinstruccion_OBUF[6]_inst_i_1_0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \microinstruccion_OBUF[1]_inst_i_1_0\ : in STD_LOGIC;
    \microinstruccion_OBUF[8]_inst_i_1_0\ : in STD_LOGIC
  );
end level;

architecture STRUCTURE of level is
  signal \microinstruccion_OBUF[15]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[15]_inst_i_4_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[6]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[8]_inst_i_2_n_0\ : STD_LOGIC;
  signal \^nclk1\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \^pclk1\ : STD_LOGIC;
  signal pclk1_i_1_n_0 : STD_LOGIC;
  signal \^pclk1_reg_1\ : STD_LOGIC;
begin
  nclk1 <= \^nclk1\;
  pclk1 <= \^pclk1\;
  pclk1_reg_1 <= \^pclk1_reg_1\;
\microinstruccion_OBUF[15]_inst_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \microinstruccion_OBUF[15]_inst_i_2_n_0\,
      I1 => \microinstruccion[15]\,
      O => microinstruccion_OBUF(3),
      S => opCode_IBUF(2)
    );
\microinstruccion_OBUF[15]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F808"
    )
        port map (
      I0 => opCode_IBUF(1),
      I1 => opCode_IBUF(0),
      I2 => opCode_IBUF(4),
      I3 => \microinstruccion_OBUF[15]_inst_i_4_n_0\,
      I4 => opCode_IBUF(3),
      O => \microinstruccion_OBUF[15]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[15]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4717676774717676"
    )
        port map (
      I0 => opCode_IBUF(1),
      I1 => opCode_IBUF(0),
      I2 => \^pclk1\,
      I3 => Q(1),
      I4 => Q(0),
      I5 => \^nclk1\,
      O => \microinstruccion_OBUF[15]_inst_i_4_n_0\
    );
\microinstruccion_OBUF[16]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B898E8988B898E89"
    )
        port map (
      I0 => opCode_IBUF(1),
      I1 => opCode_IBUF(0),
      I2 => \^pclk1\,
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^nclk1\,
      O => pclk1_reg_0
    );
\microinstruccion_OBUF[19]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3010601003010601"
    )
        port map (
      I0 => opCode_IBUF(1),
      I1 => opCode_IBUF(0),
      I2 => \^pclk1\,
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^nclk1\,
      O => \^pclk1_reg_1\
    );
\microinstruccion_OBUF[1]_inst_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \microinstruccion_OBUF[1]_inst_i_2_n_0\,
      I1 => \microinstruccion[1]\,
      O => microinstruccion_OBUF(0),
      S => opCode_IBUF(2)
    );
\microinstruccion_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F4A"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => \^pclk1_reg_1\,
      I2 => opCode_IBUF(4),
      I3 => \microinstruccion_OBUF[1]_inst_i_1_0\,
      O => \microinstruccion_OBUF[1]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[6]_inst_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \microinstruccion_OBUF[6]_inst_i_2_n_0\,
      I1 => \microinstruccion[6]\,
      O => microinstruccion_OBUF(1),
      S => opCode_IBUF(2)
    );
\microinstruccion_OBUF[6]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => opCode_IBUF(1),
      I1 => opCode_IBUF(3),
      I2 => \microinstruccion_OBUF[15]_inst_i_4_n_0\,
      I3 => opCode_IBUF(4),
      I4 => \microinstruccion_OBUF[6]_inst_i_1_0\,
      O => \microinstruccion_OBUF[6]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[8]_inst_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \microinstruccion_OBUF[8]_inst_i_2_n_0\,
      I1 => \microinstruccion[8]\,
      O => microinstruccion_OBUF(2),
      S => opCode_IBUF(2)
    );
\microinstruccion_OBUF[8]_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F4A"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => \^pclk1_reg_1\,
      I2 => opCode_IBUF(4),
      I3 => \microinstruccion_OBUF[8]_inst_i_1_0\,
      O => \microinstruccion_OBUF[8]_inst_i_2_n_0\
    );
nclk1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^nclk1\,
      O => p_0_in
    );
nclk1_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      CLR => AR(0),
      D => p_0_in,
      Q => \^nclk1\
    );
pclk1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^pclk1\,
      O => pclk1_i_1_n_0
    );
pclk1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => pclk1_i_1_n_0,
      PRE => AR(0),
      Q => \^pclk1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity registro is
  port (
    \Q_reg[1]_0\ : out STD_LOGIC;
    \Q_reg[1]_1\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    microinstruccion_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \Q_reg[1]_2\ : out STD_LOGIC;
    \Q_reg[1]_3\ : out STD_LOGIC;
    \opCode[0]\ : out STD_LOGIC;
    opCode_IBUF : in STD_LOGIC_VECTOR ( 4 downto 0 );
    nclk1 : in STD_LOGIC;
    pclk1 : in STD_LOGIC;
    \microinstruccion[16]\ : in STD_LOGIC;
    \microinstruccion[16]_0\ : in STD_LOGIC;
    \microinstruccion[9]\ : in STD_LOGIC;
    \microinstruccion[9]_0\ : in STD_LOGIC;
    funCode_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK_IBUF_BUFG : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end registro;

architecture STRUCTURE of registro is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^microinstruccion_obuf\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \microinstruccion_OBUF[15]_inst_i_5_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[19]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[8]_inst_i_4_n_0\ : STD_LOGIC;
  signal \^opcode[0]\ : STD_LOGIC;
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
  microinstruccion_OBUF(3 downto 0) <= \^microinstruccion_obuf\(3 downto 0);
  \opCode[0]\ <= \^opcode[0]\;
\Q_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \^microinstruccion_obuf\(0),
      CLR => AR(0),
      D => D(0),
      Q => \^q\(0)
    );
\Q_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => \^microinstruccion_obuf\(0),
      CLR => AR(0),
      D => D(1),
      Q => \^q\(1)
    );
\microinstruccion_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2111FFFF2111EEEE"
    )
        port map (
      I0 => opCode_IBUF(2),
      I1 => opCode_IBUF(3),
      I2 => opCode_IBUF(1),
      I3 => opCode_IBUF(0),
      I4 => opCode_IBUF(4),
      I5 => \^opcode[0]\,
      O => \^microinstruccion_obuf\(0)
    );
\microinstruccion_OBUF[0]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000015555"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(2),
      I2 => funCode_IBUF(1),
      I3 => funCode_IBUF(0),
      I4 => funCode_IBUF(3),
      I5 => opCode_IBUF(1),
      O => \^opcode[0]\
    );
\microinstruccion_OBUF[15]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3808080B"
    )
        port map (
      I0 => \microinstruccion_OBUF[15]_inst_i_5_n_0\,
      I1 => opCode_IBUF(3),
      I2 => opCode_IBUF(4),
      I3 => opCode_IBUF(0),
      I4 => opCode_IBUF(1),
      O => \Q_reg[1]_3\
    );
\microinstruccion_OBUF[15]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8BFFFF8BC0CCCCC0"
    )
        port map (
      I0 => \^q\(0),
      I1 => opCode_IBUF(1),
      I2 => \^q\(1),
      I3 => nclk1,
      I4 => pclk1,
      I5 => opCode_IBUF(0),
      O => \microinstruccion_OBUF[15]_inst_i_5_n_0\
    );
\microinstruccion_OBUF[16]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00A000A0CF00C000"
    )
        port map (
      I0 => \microinstruccion_OBUF[19]_inst_i_2_n_0\,
      I1 => \microinstruccion[16]\,
      I2 => opCode_IBUF(2),
      I3 => opCode_IBUF(4),
      I4 => \microinstruccion[16]_0\,
      I5 => opCode_IBUF(3),
      O => \^microinstruccion_obuf\(2)
    );
\microinstruccion_OBUF[19]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08083000"
    )
        port map (
      I0 => \microinstruccion_OBUF[19]_inst_i_2_n_0\,
      I1 => opCode_IBUF(2),
      I2 => opCode_IBUF(4),
      I3 => \microinstruccion[9]_0\,
      I4 => opCode_IBUF(3),
      O => \^microinstruccion_obuf\(3)
    );
\microinstruccion_OBUF[19]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7040070400C0000C"
    )
        port map (
      I0 => \^q\(0),
      I1 => opCode_IBUF(1),
      I2 => nclk1,
      I3 => \^q\(1),
      I4 => pclk1,
      I5 => opCode_IBUF(0),
      O => \microinstruccion_OBUF[19]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[1]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000BBB8"
    )
        port map (
      I0 => \microinstruccion_OBUF[8]_inst_i_4_n_0\,
      I1 => opCode_IBUF(3),
      I2 => opCode_IBUF(0),
      I3 => opCode_IBUF(1),
      I4 => opCode_IBUF(4),
      O => \Q_reg[1]_0\
    );
\microinstruccion_OBUF[6]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008B88"
    )
        port map (
      I0 => \microinstruccion_OBUF[15]_inst_i_5_n_0\,
      I1 => opCode_IBUF(3),
      I2 => opCode_IBUF(0),
      I3 => opCode_IBUF(1),
      I4 => opCode_IBUF(4),
      O => \Q_reg[1]_2\
    );
\microinstruccion_OBUF[8]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3000BBBB"
    )
        port map (
      I0 => \microinstruccion_OBUF[8]_inst_i_4_n_0\,
      I1 => opCode_IBUF(3),
      I2 => opCode_IBUF(1),
      I3 => opCode_IBUF(0),
      I4 => opCode_IBUF(4),
      O => \Q_reg[1]_1\
    );
\microinstruccion_OBUF[8]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7040070433F3333F"
    )
        port map (
      I0 => \^q\(0),
      I1 => opCode_IBUF(1),
      I2 => nclk1,
      I3 => \^q\(1),
      I4 => pclk1,
      I5 => opCode_IBUF(0),
      O => \microinstruccion_OBUF[8]_inst_i_4_n_0\
    );
\microinstruccion_OBUF[9]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088008833300030"
    )
        port map (
      I0 => \microinstruccion_OBUF[19]_inst_i_2_n_0\,
      I1 => opCode_IBUF(2),
      I2 => \microinstruccion[9]\,
      I3 => opCode_IBUF(4),
      I4 => \microinstruccion[9]_0\,
      I5 => opCode_IBUF(3),
      O => \^microinstruccion_obuf\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity arquitectura is
  port (
    funCode : in STD_LOGIC_VECTOR ( 3 downto 0 );
    banderas : in STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK : in STD_LOGIC;
    CLR : in STD_LOGIC;
    opCode : in STD_LOGIC_VECTOR ( 4 downto 0 );
    microinstruccion : out STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of arquitectura : entity is true;
end arquitectura;

architecture STRUCTURE of arquitectura is
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal CLR_IBUF : STD_LOGIC;
  signal Q : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal banderas_IBUF : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal funCode_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal level_com_n_6 : STD_LOGIC;
  signal level_com_n_7 : STD_LOGIC;
  signal microinstruccion_OBUF : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \microinstruccion_OBUF[10]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[11]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[12]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[14]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[16]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[4]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[5]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[6]_inst_i_4_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[7]_inst_i_2_n_0\ : STD_LOGIC;
  signal \microinstruccion_OBUF[9]_inst_i_2_n_0\ : STD_LOGIC;
  signal nclk1 : STD_LOGIC;
  signal opCode_IBUF : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal pclk1 : STD_LOGIC;
  signal reg_com_n_0 : STD_LOGIC;
  signal reg_com_n_1 : STD_LOGIC;
  signal reg_com_n_10 : STD_LOGIC;
  signal reg_com_n_8 : STD_LOGIC;
  signal reg_com_n_9 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[11]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[12]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[13]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[16]_inst_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[17]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[18]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[2]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \microinstruccion_OBUF[3]_inst_i_1\ : label is "soft_lutpair3";
begin
CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IBUF,
      O => CLK_IBUF_BUFG
    );
CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK,
      O => CLK_IBUF
    );
CLR_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLR,
      O => CLR_IBUF
    );
\banderas_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => banderas(1),
      O => banderas_IBUF(1)
    );
\banderas_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => banderas(2),
      O => banderas_IBUF(2)
    );
\funCode_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => funCode(0),
      O => funCode_IBUF(0)
    );
\funCode_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => funCode(1),
      O => funCode_IBUF(1)
    );
\funCode_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => funCode(2),
      O => funCode_IBUF(2)
    );
\funCode_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => funCode(3),
      O => funCode_IBUF(3)
    );
level_com: entity work.level
     port map (
      AR(0) => CLR_IBUF,
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      Q(1 downto 0) => Q(2 downto 1),
      \microinstruccion[15]\ => reg_com_n_9,
      \microinstruccion[1]\ => reg_com_n_0,
      \microinstruccion[6]\ => reg_com_n_8,
      \microinstruccion[8]\ => reg_com_n_1,
      microinstruccion_OBUF(3) => microinstruccion_OBUF(15),
      microinstruccion_OBUF(2) => microinstruccion_OBUF(8),
      microinstruccion_OBUF(1) => microinstruccion_OBUF(6),
      microinstruccion_OBUF(0) => microinstruccion_OBUF(1),
      \microinstruccion_OBUF[1]_inst_i_1_0\ => reg_com_n_10,
      \microinstruccion_OBUF[6]_inst_i_1_0\ => \microinstruccion_OBUF[6]_inst_i_4_n_0\,
      \microinstruccion_OBUF[8]_inst_i_1_0\ => \microinstruccion_OBUF[9]_inst_i_2_n_0\,
      nclk1 => nclk1,
      opCode_IBUF(4 downto 0) => opCode_IBUF(4 downto 0),
      pclk1 => pclk1,
      pclk1_reg_0 => level_com_n_6,
      pclk1_reg_1 => level_com_n_7
    );
\microinstruccion_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(0),
      O => microinstruccion(0)
    );
\microinstruccion_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(10),
      O => microinstruccion(10)
    );
\microinstruccion_OBUF[10]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"008000801FEF1FE0"
    )
        port map (
      I0 => opCode_IBUF(1),
      I1 => opCode_IBUF(0),
      I2 => opCode_IBUF(2),
      I3 => opCode_IBUF(3),
      I4 => \microinstruccion_OBUF[10]_inst_i_2_n_0\,
      I5 => opCode_IBUF(4),
      O => microinstruccion_OBUF(10)
    );
\microinstruccion_OBUF[10]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55555555BBBBBFFF"
    )
        port map (
      I0 => opCode_IBUF(1),
      I1 => funCode_IBUF(3),
      I2 => funCode_IBUF(0),
      I3 => funCode_IBUF(1),
      I4 => funCode_IBUF(2),
      I5 => opCode_IBUF(0),
      O => \microinstruccion_OBUF[10]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(11),
      O => microinstruccion(11)
    );
\microinstruccion_OBUF[11]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => \microinstruccion_OBUF[11]_inst_i_2_n_0\,
      I2 => opCode_IBUF(4),
      I3 => opCode_IBUF(2),
      O => microinstruccion_OBUF(11)
    );
\microinstruccion_OBUF[11]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(2),
      I2 => funCode_IBUF(0),
      I3 => funCode_IBUF(1),
      I4 => funCode_IBUF(3),
      I5 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[11]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(12),
      O => microinstruccion(12)
    );
\microinstruccion_OBUF[12]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => \microinstruccion_OBUF[12]_inst_i_2_n_0\,
      I2 => opCode_IBUF(4),
      I3 => opCode_IBUF(2),
      O => microinstruccion_OBUF(12)
    );
\microinstruccion_OBUF[12]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001100000"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(2),
      I2 => funCode_IBUF(0),
      I3 => funCode_IBUF(1),
      I4 => funCode_IBUF(3),
      I5 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[12]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(13),
      O => microinstruccion(13)
    );
\microinstruccion_OBUF[13]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40010000"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => opCode_IBUF(4),
      I2 => opCode_IBUF(0),
      I3 => opCode_IBUF(1),
      I4 => opCode_IBUF(2),
      O => microinstruccion_OBUF(13)
    );
\microinstruccion_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(14),
      O => microinstruccion(14)
    );
\microinstruccion_OBUF[14]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22000000667677DC"
    )
        port map (
      I0 => opCode_IBUF(2),
      I1 => opCode_IBUF(3),
      I2 => \microinstruccion_OBUF[14]_inst_i_2_n_0\,
      I3 => opCode_IBUF(1),
      I4 => opCode_IBUF(0),
      I5 => opCode_IBUF(4),
      O => microinstruccion_OBUF(14)
    );
\microinstruccion_OBUF[14]_inst_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005557"
    )
        port map (
      I0 => funCode_IBUF(3),
      I1 => funCode_IBUF(0),
      I2 => funCode_IBUF(1),
      I3 => funCode_IBUF(2),
      I4 => opCode_IBUF(0),
      O => \microinstruccion_OBUF[14]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(15),
      O => microinstruccion(15)
    );
\microinstruccion_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(16),
      O => microinstruccion(16)
    );
\microinstruccion_OBUF[16]_inst_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[16]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(17),
      O => microinstruccion(17)
    );
\microinstruccion_OBUF[17]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => opCode_IBUF(1),
      I2 => opCode_IBUF(0),
      I3 => opCode_IBUF(4),
      I4 => opCode_IBUF(2),
      O => microinstruccion_OBUF(17)
    );
\microinstruccion_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(18),
      O => microinstruccion(18)
    );
\microinstruccion_OBUF[18]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000000"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => opCode_IBUF(1),
      I2 => opCode_IBUF(0),
      I3 => opCode_IBUF(4),
      I4 => opCode_IBUF(2),
      O => microinstruccion_OBUF(18)
    );
\microinstruccion_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(19),
      O => microinstruccion(19)
    );
\microinstruccion_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(1),
      O => microinstruccion(1)
    );
\microinstruccion_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(2),
      O => microinstruccion(2)
    );
\microinstruccion_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001002"
    )
        port map (
      I0 => opCode_IBUF(2),
      I1 => opCode_IBUF(4),
      I2 => opCode_IBUF(0),
      I3 => opCode_IBUF(1),
      I4 => opCode_IBUF(3),
      O => microinstruccion_OBUF(2)
    );
\microinstruccion_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(3),
      O => microinstruccion(3)
    );
\microinstruccion_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => opCode_IBUF(3),
      I1 => opCode_IBUF(1),
      I2 => opCode_IBUF(4),
      I3 => opCode_IBUF(2),
      O => microinstruccion_OBUF(3)
    );
\microinstruccion_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(4),
      O => microinstruccion(4)
    );
\microinstruccion_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"21119BF721118AE6"
    )
        port map (
      I0 => opCode_IBUF(2),
      I1 => opCode_IBUF(3),
      I2 => opCode_IBUF(1),
      I3 => opCode_IBUF(0),
      I4 => opCode_IBUF(4),
      I5 => \microinstruccion_OBUF[4]_inst_i_2_n_0\,
      O => microinstruccion_OBUF(4)
    );
\microinstruccion_OBUF[4]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001001105"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(3),
      I2 => funCode_IBUF(2),
      I3 => funCode_IBUF(0),
      I4 => funCode_IBUF(1),
      I5 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[4]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(5),
      O => microinstruccion(5)
    );
\microinstruccion_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"21119FBB21118EAA"
    )
        port map (
      I0 => opCode_IBUF(2),
      I1 => opCode_IBUF(3),
      I2 => opCode_IBUF(1),
      I3 => opCode_IBUF(0),
      I4 => opCode_IBUF(4),
      I5 => \microinstruccion_OBUF[5]_inst_i_2_n_0\,
      O => microinstruccion_OBUF(5)
    );
\microinstruccion_OBUF[5]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004111"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(1),
      I2 => funCode_IBUF(2),
      I3 => funCode_IBUF(0),
      I4 => funCode_IBUF(3),
      I5 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[5]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(6),
      O => microinstruccion(6)
    );
\microinstruccion_OBUF[6]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000101104"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(3),
      I2 => funCode_IBUF(2),
      I3 => funCode_IBUF(0),
      I4 => funCode_IBUF(1),
      I5 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[6]_inst_i_4_n_0\
    );
\microinstruccion_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(7),
      O => microinstruccion(7)
    );
\microinstruccion_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000034333400"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => opCode_IBUF(2),
      I2 => opCode_IBUF(1),
      I3 => opCode_IBUF(3),
      I4 => \microinstruccion_OBUF[7]_inst_i_2_n_0\,
      I5 => opCode_IBUF(4),
      O => microinstruccion_OBUF(7)
    );
\microinstruccion_OBUF[7]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000011100004"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(3),
      I2 => funCode_IBUF(1),
      I3 => funCode_IBUF(0),
      I4 => funCode_IBUF(2),
      I5 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[7]_inst_i_2_n_0\
    );
\microinstruccion_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(8),
      O => microinstruccion(8)
    );
\microinstruccion_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => microinstruccion_OBUF(9),
      O => microinstruccion(9)
    );
\microinstruccion_OBUF[9]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000005050510"
    )
        port map (
      I0 => opCode_IBUF(0),
      I1 => funCode_IBUF(0),
      I2 => funCode_IBUF(3),
      I3 => funCode_IBUF(1),
      I4 => funCode_IBUF(2),
      I5 => opCode_IBUF(1),
      O => \microinstruccion_OBUF[9]_inst_i_2_n_0\
    );
\opCode_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => opCode(0),
      O => opCode_IBUF(0)
    );
\opCode_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => opCode(1),
      O => opCode_IBUF(1)
    );
\opCode_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => opCode(2),
      O => opCode_IBUF(2)
    );
\opCode_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => opCode(3),
      O => opCode_IBUF(3)
    );
\opCode_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => opCode(4),
      O => opCode_IBUF(4)
    );
reg_com: entity work.registro
     port map (
      AR(0) => CLR_IBUF,
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      D(1 downto 0) => banderas_IBUF(2 downto 1),
      Q(1 downto 0) => Q(2 downto 1),
      \Q_reg[1]_0\ => reg_com_n_0,
      \Q_reg[1]_1\ => reg_com_n_1,
      \Q_reg[1]_2\ => reg_com_n_8,
      \Q_reg[1]_3\ => reg_com_n_9,
      funCode_IBUF(3 downto 0) => funCode_IBUF(3 downto 0),
      \microinstruccion[16]\ => \microinstruccion_OBUF[16]_inst_i_2_n_0\,
      \microinstruccion[16]_0\ => level_com_n_6,
      \microinstruccion[9]\ => \microinstruccion_OBUF[9]_inst_i_2_n_0\,
      \microinstruccion[9]_0\ => level_com_n_7,
      microinstruccion_OBUF(3) => microinstruccion_OBUF(19),
      microinstruccion_OBUF(2) => microinstruccion_OBUF(16),
      microinstruccion_OBUF(1) => microinstruccion_OBUF(9),
      microinstruccion_OBUF(0) => microinstruccion_OBUF(0),
      nclk1 => nclk1,
      \opCode[0]\ => reg_com_n_10,
      opCode_IBUF(4 downto 0) => opCode_IBUF(4 downto 0),
      pclk1 => pclk1
    );
end STRUCTURE;
