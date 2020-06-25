// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Wed Jun 24 18:21:16 2020
// Host        : illBeWithYou running 64-bit Fedora release 32 (Thirty Two)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /run/media/d3vcr4ck/externData/materias-Sem20_2/arquitecturaDeComputadoras/arquitecturaDeComputadoras/practicasVivado/unidadDeControl/unidadDeControl.sim/sim_1/synth/timing/xsim/arquitectura_TB_time_synth.v
// Design      : arquitectura
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module arquitectura
   (funCode,
    banderas,
    CLK,
    CLR,
    opCode,
    microinstruccion);
  input [3:0]funCode;
  input [3:0]banderas;
  input CLK;
  input CLR;
  input [4:0]opCode;
  output [19:0]microinstruccion;

  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire CLR;
  wire CLR_IBUF;
  wire [2:1]Q;
  wire [3:0]banderas;
  wire [2:1]banderas_IBUF;
  wire [3:0]funCode;
  wire [3:0]funCode_IBUF;
  wire level_com_n_6;
  wire level_com_n_7;
  wire [19:0]microinstruccion;
  wire [19:0]microinstruccion_OBUF;
  wire \microinstruccion_OBUF[10]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[11]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[12]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[14]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[16]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[4]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[5]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[6]_inst_i_4_n_0 ;
  wire \microinstruccion_OBUF[7]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[9]_inst_i_2_n_0 ;
  wire nclk1;
  wire [4:0]opCode;
  wire [4:0]opCode_IBUF;
  wire pclk1;
  wire reg_com_n_0;
  wire reg_com_n_1;
  wire reg_com_n_10;
  wire reg_com_n_8;
  wire reg_com_n_9;

initial begin
 $sdf_annotate("arquitectura_TB_time_synth.sdf",,,,"tool_control");
end
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  IBUF CLR_IBUF_inst
       (.I(CLR),
        .O(CLR_IBUF));
  IBUF \banderas_IBUF[1]_inst 
       (.I(banderas[1]),
        .O(banderas_IBUF[1]));
  IBUF \banderas_IBUF[2]_inst 
       (.I(banderas[2]),
        .O(banderas_IBUF[2]));
  IBUF \funCode_IBUF[0]_inst 
       (.I(funCode[0]),
        .O(funCode_IBUF[0]));
  IBUF \funCode_IBUF[1]_inst 
       (.I(funCode[1]),
        .O(funCode_IBUF[1]));
  IBUF \funCode_IBUF[2]_inst 
       (.I(funCode[2]),
        .O(funCode_IBUF[2]));
  IBUF \funCode_IBUF[3]_inst 
       (.I(funCode[3]),
        .O(funCode_IBUF[3]));
  level level_com
       (.AR(CLR_IBUF),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .Q(Q),
        .\microinstruccion[15] (reg_com_n_9),
        .\microinstruccion[1] (reg_com_n_0),
        .\microinstruccion[6] (reg_com_n_8),
        .\microinstruccion[8] (reg_com_n_1),
        .microinstruccion_OBUF({microinstruccion_OBUF[15],microinstruccion_OBUF[8],microinstruccion_OBUF[6],microinstruccion_OBUF[1]}),
        .\microinstruccion_OBUF[1]_inst_i_1_0 (reg_com_n_10),
        .\microinstruccion_OBUF[6]_inst_i_1_0 (\microinstruccion_OBUF[6]_inst_i_4_n_0 ),
        .\microinstruccion_OBUF[8]_inst_i_1_0 (\microinstruccion_OBUF[9]_inst_i_2_n_0 ),
        .nclk1(nclk1),
        .opCode_IBUF(opCode_IBUF),
        .pclk1(pclk1),
        .pclk1_reg_0(level_com_n_6),
        .pclk1_reg_1(level_com_n_7));
  OBUF \microinstruccion_OBUF[0]_inst 
       (.I(microinstruccion_OBUF[0]),
        .O(microinstruccion[0]));
  OBUF \microinstruccion_OBUF[10]_inst 
       (.I(microinstruccion_OBUF[10]),
        .O(microinstruccion[10]));
  LUT6 #(
    .INIT(64'h008000801FEF1FE0)) 
    \microinstruccion_OBUF[10]_inst_i_1 
       (.I0(opCode_IBUF[1]),
        .I1(opCode_IBUF[0]),
        .I2(opCode_IBUF[2]),
        .I3(opCode_IBUF[3]),
        .I4(\microinstruccion_OBUF[10]_inst_i_2_n_0 ),
        .I5(opCode_IBUF[4]),
        .O(microinstruccion_OBUF[10]));
  LUT6 #(
    .INIT(64'h55555555BBBBBFFF)) 
    \microinstruccion_OBUF[10]_inst_i_2 
       (.I0(opCode_IBUF[1]),
        .I1(funCode_IBUF[3]),
        .I2(funCode_IBUF[0]),
        .I3(funCode_IBUF[1]),
        .I4(funCode_IBUF[2]),
        .I5(opCode_IBUF[0]),
        .O(\microinstruccion_OBUF[10]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[11]_inst 
       (.I(microinstruccion_OBUF[11]),
        .O(microinstruccion[11]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \microinstruccion_OBUF[11]_inst_i_1 
       (.I0(opCode_IBUF[3]),
        .I1(\microinstruccion_OBUF[11]_inst_i_2_n_0 ),
        .I2(opCode_IBUF[4]),
        .I3(opCode_IBUF[2]),
        .O(microinstruccion_OBUF[11]));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \microinstruccion_OBUF[11]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[2]),
        .I2(funCode_IBUF[0]),
        .I3(funCode_IBUF[1]),
        .I4(funCode_IBUF[3]),
        .I5(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[11]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[12]_inst 
       (.I(microinstruccion_OBUF[12]),
        .O(microinstruccion[12]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \microinstruccion_OBUF[12]_inst_i_1 
       (.I0(opCode_IBUF[3]),
        .I1(\microinstruccion_OBUF[12]_inst_i_2_n_0 ),
        .I2(opCode_IBUF[4]),
        .I3(opCode_IBUF[2]),
        .O(microinstruccion_OBUF[12]));
  LUT6 #(
    .INIT(64'h0000000001100000)) 
    \microinstruccion_OBUF[12]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[2]),
        .I2(funCode_IBUF[0]),
        .I3(funCode_IBUF[1]),
        .I4(funCode_IBUF[3]),
        .I5(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[12]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[13]_inst 
       (.I(microinstruccion_OBUF[13]),
        .O(microinstruccion[13]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h40010000)) 
    \microinstruccion_OBUF[13]_inst_i_1 
       (.I0(opCode_IBUF[3]),
        .I1(opCode_IBUF[4]),
        .I2(opCode_IBUF[0]),
        .I3(opCode_IBUF[1]),
        .I4(opCode_IBUF[2]),
        .O(microinstruccion_OBUF[13]));
  OBUF \microinstruccion_OBUF[14]_inst 
       (.I(microinstruccion_OBUF[14]),
        .O(microinstruccion[14]));
  LUT6 #(
    .INIT(64'h22000000667677DC)) 
    \microinstruccion_OBUF[14]_inst_i_1 
       (.I0(opCode_IBUF[2]),
        .I1(opCode_IBUF[3]),
        .I2(\microinstruccion_OBUF[14]_inst_i_2_n_0 ),
        .I3(opCode_IBUF[1]),
        .I4(opCode_IBUF[0]),
        .I5(opCode_IBUF[4]),
        .O(microinstruccion_OBUF[14]));
  LUT5 #(
    .INIT(32'h00005557)) 
    \microinstruccion_OBUF[14]_inst_i_2 
       (.I0(funCode_IBUF[3]),
        .I1(funCode_IBUF[0]),
        .I2(funCode_IBUF[1]),
        .I3(funCode_IBUF[2]),
        .I4(opCode_IBUF[0]),
        .O(\microinstruccion_OBUF[14]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[15]_inst 
       (.I(microinstruccion_OBUF[15]),
        .O(microinstruccion[15]));
  OBUF \microinstruccion_OBUF[16]_inst 
       (.I(microinstruccion_OBUF[16]),
        .O(microinstruccion[16]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \microinstruccion_OBUF[16]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[16]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[17]_inst 
       (.I(microinstruccion_OBUF[17]),
        .O(microinstruccion[17]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    \microinstruccion_OBUF[17]_inst_i_1 
       (.I0(opCode_IBUF[3]),
        .I1(opCode_IBUF[1]),
        .I2(opCode_IBUF[0]),
        .I3(opCode_IBUF[4]),
        .I4(opCode_IBUF[2]),
        .O(microinstruccion_OBUF[17]));
  OBUF \microinstruccion_OBUF[18]_inst 
       (.I(microinstruccion_OBUF[18]),
        .O(microinstruccion[18]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h01000000)) 
    \microinstruccion_OBUF[18]_inst_i_1 
       (.I0(opCode_IBUF[3]),
        .I1(opCode_IBUF[1]),
        .I2(opCode_IBUF[0]),
        .I3(opCode_IBUF[4]),
        .I4(opCode_IBUF[2]),
        .O(microinstruccion_OBUF[18]));
  OBUF \microinstruccion_OBUF[19]_inst 
       (.I(microinstruccion_OBUF[19]),
        .O(microinstruccion[19]));
  OBUF \microinstruccion_OBUF[1]_inst 
       (.I(microinstruccion_OBUF[1]),
        .O(microinstruccion[1]));
  OBUF \microinstruccion_OBUF[2]_inst 
       (.I(microinstruccion_OBUF[2]),
        .O(microinstruccion[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00001002)) 
    \microinstruccion_OBUF[2]_inst_i_1 
       (.I0(opCode_IBUF[2]),
        .I1(opCode_IBUF[4]),
        .I2(opCode_IBUF[0]),
        .I3(opCode_IBUF[1]),
        .I4(opCode_IBUF[3]),
        .O(microinstruccion_OBUF[2]));
  OBUF \microinstruccion_OBUF[3]_inst 
       (.I(microinstruccion_OBUF[3]),
        .O(microinstruccion[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \microinstruccion_OBUF[3]_inst_i_1 
       (.I0(opCode_IBUF[3]),
        .I1(opCode_IBUF[1]),
        .I2(opCode_IBUF[4]),
        .I3(opCode_IBUF[2]),
        .O(microinstruccion_OBUF[3]));
  OBUF \microinstruccion_OBUF[4]_inst 
       (.I(microinstruccion_OBUF[4]),
        .O(microinstruccion[4]));
  LUT6 #(
    .INIT(64'h21119BF721118AE6)) 
    \microinstruccion_OBUF[4]_inst_i_1 
       (.I0(opCode_IBUF[2]),
        .I1(opCode_IBUF[3]),
        .I2(opCode_IBUF[1]),
        .I3(opCode_IBUF[0]),
        .I4(opCode_IBUF[4]),
        .I5(\microinstruccion_OBUF[4]_inst_i_2_n_0 ),
        .O(microinstruccion_OBUF[4]));
  LUT6 #(
    .INIT(64'h0000000001001105)) 
    \microinstruccion_OBUF[4]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[3]),
        .I2(funCode_IBUF[2]),
        .I3(funCode_IBUF[0]),
        .I4(funCode_IBUF[1]),
        .I5(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[4]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[5]_inst 
       (.I(microinstruccion_OBUF[5]),
        .O(microinstruccion[5]));
  LUT6 #(
    .INIT(64'h21119FBB21118EAA)) 
    \microinstruccion_OBUF[5]_inst_i_1 
       (.I0(opCode_IBUF[2]),
        .I1(opCode_IBUF[3]),
        .I2(opCode_IBUF[1]),
        .I3(opCode_IBUF[0]),
        .I4(opCode_IBUF[4]),
        .I5(\microinstruccion_OBUF[5]_inst_i_2_n_0 ),
        .O(microinstruccion_OBUF[5]));
  LUT6 #(
    .INIT(64'h0000000000004111)) 
    \microinstruccion_OBUF[5]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[1]),
        .I2(funCode_IBUF[2]),
        .I3(funCode_IBUF[0]),
        .I4(funCode_IBUF[3]),
        .I5(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[5]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[6]_inst 
       (.I(microinstruccion_OBUF[6]),
        .O(microinstruccion[6]));
  LUT6 #(
    .INIT(64'h0000000000101104)) 
    \microinstruccion_OBUF[6]_inst_i_4 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[3]),
        .I2(funCode_IBUF[2]),
        .I3(funCode_IBUF[0]),
        .I4(funCode_IBUF[1]),
        .I5(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[6]_inst_i_4_n_0 ));
  OBUF \microinstruccion_OBUF[7]_inst 
       (.I(microinstruccion_OBUF[7]),
        .O(microinstruccion[7]));
  LUT6 #(
    .INIT(64'h0000000034333400)) 
    \microinstruccion_OBUF[7]_inst_i_1 
       (.I0(opCode_IBUF[0]),
        .I1(opCode_IBUF[2]),
        .I2(opCode_IBUF[1]),
        .I3(opCode_IBUF[3]),
        .I4(\microinstruccion_OBUF[7]_inst_i_2_n_0 ),
        .I5(opCode_IBUF[4]),
        .O(microinstruccion_OBUF[7]));
  LUT6 #(
    .INIT(64'h0000000011100004)) 
    \microinstruccion_OBUF[7]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[3]),
        .I2(funCode_IBUF[1]),
        .I3(funCode_IBUF[0]),
        .I4(funCode_IBUF[2]),
        .I5(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[7]_inst_i_2_n_0 ));
  OBUF \microinstruccion_OBUF[8]_inst 
       (.I(microinstruccion_OBUF[8]),
        .O(microinstruccion[8]));
  OBUF \microinstruccion_OBUF[9]_inst 
       (.I(microinstruccion_OBUF[9]),
        .O(microinstruccion[9]));
  LUT6 #(
    .INIT(64'h0000000005050510)) 
    \microinstruccion_OBUF[9]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[0]),
        .I2(funCode_IBUF[3]),
        .I3(funCode_IBUF[1]),
        .I4(funCode_IBUF[2]),
        .I5(opCode_IBUF[1]),
        .O(\microinstruccion_OBUF[9]_inst_i_2_n_0 ));
  IBUF \opCode_IBUF[0]_inst 
       (.I(opCode[0]),
        .O(opCode_IBUF[0]));
  IBUF \opCode_IBUF[1]_inst 
       (.I(opCode[1]),
        .O(opCode_IBUF[1]));
  IBUF \opCode_IBUF[2]_inst 
       (.I(opCode[2]),
        .O(opCode_IBUF[2]));
  IBUF \opCode_IBUF[3]_inst 
       (.I(opCode[3]),
        .O(opCode_IBUF[3]));
  IBUF \opCode_IBUF[4]_inst 
       (.I(opCode[4]),
        .O(opCode_IBUF[4]));
  registro reg_com
       (.AR(CLR_IBUF),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .D(banderas_IBUF),
        .Q(Q),
        .\Q_reg[1]_0 (reg_com_n_0),
        .\Q_reg[1]_1 (reg_com_n_1),
        .\Q_reg[1]_2 (reg_com_n_8),
        .\Q_reg[1]_3 (reg_com_n_9),
        .funCode_IBUF(funCode_IBUF),
        .\microinstruccion[16] (\microinstruccion_OBUF[16]_inst_i_2_n_0 ),
        .\microinstruccion[16]_0 (level_com_n_6),
        .\microinstruccion[9] (\microinstruccion_OBUF[9]_inst_i_2_n_0 ),
        .\microinstruccion[9]_0 (level_com_n_7),
        .microinstruccion_OBUF({microinstruccion_OBUF[19],microinstruccion_OBUF[16],microinstruccion_OBUF[9],microinstruccion_OBUF[0]}),
        .nclk1(nclk1),
        .\opCode[0] (reg_com_n_10),
        .opCode_IBUF(opCode_IBUF),
        .pclk1(pclk1));
endmodule

module level
   (nclk1,
    pclk1,
    microinstruccion_OBUF,
    pclk1_reg_0,
    pclk1_reg_1,
    CLK_IBUF_BUFG,
    AR,
    opCode_IBUF,
    \microinstruccion[1] ,
    \microinstruccion[8] ,
    \microinstruccion[6] ,
    \microinstruccion[15] ,
    \microinstruccion_OBUF[6]_inst_i_1_0 ,
    Q,
    \microinstruccion_OBUF[1]_inst_i_1_0 ,
    \microinstruccion_OBUF[8]_inst_i_1_0 );
  output nclk1;
  output pclk1;
  output [3:0]microinstruccion_OBUF;
  output pclk1_reg_0;
  output pclk1_reg_1;
  input CLK_IBUF_BUFG;
  input [0:0]AR;
  input [4:0]opCode_IBUF;
  input \microinstruccion[1] ;
  input \microinstruccion[8] ;
  input \microinstruccion[6] ;
  input \microinstruccion[15] ;
  input \microinstruccion_OBUF[6]_inst_i_1_0 ;
  input [1:0]Q;
  input \microinstruccion_OBUF[1]_inst_i_1_0 ;
  input \microinstruccion_OBUF[8]_inst_i_1_0 ;

  wire [0:0]AR;
  wire CLK_IBUF_BUFG;
  wire [1:0]Q;
  wire \microinstruccion[15] ;
  wire \microinstruccion[1] ;
  wire \microinstruccion[6] ;
  wire \microinstruccion[8] ;
  wire [3:0]microinstruccion_OBUF;
  wire \microinstruccion_OBUF[15]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[15]_inst_i_4_n_0 ;
  wire \microinstruccion_OBUF[1]_inst_i_1_0 ;
  wire \microinstruccion_OBUF[1]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[6]_inst_i_1_0 ;
  wire \microinstruccion_OBUF[6]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[8]_inst_i_1_0 ;
  wire \microinstruccion_OBUF[8]_inst_i_2_n_0 ;
  wire nclk1;
  wire [4:0]opCode_IBUF;
  wire p_0_in;
  wire pclk1;
  wire pclk1_i_1_n_0;
  wire pclk1_reg_0;
  wire pclk1_reg_1;

  MUXF7 \microinstruccion_OBUF[15]_inst_i_1 
       (.I0(\microinstruccion_OBUF[15]_inst_i_2_n_0 ),
        .I1(\microinstruccion[15] ),
        .O(microinstruccion_OBUF[3]),
        .S(opCode_IBUF[2]));
  LUT5 #(
    .INIT(32'h0000F808)) 
    \microinstruccion_OBUF[15]_inst_i_2 
       (.I0(opCode_IBUF[1]),
        .I1(opCode_IBUF[0]),
        .I2(opCode_IBUF[4]),
        .I3(\microinstruccion_OBUF[15]_inst_i_4_n_0 ),
        .I4(opCode_IBUF[3]),
        .O(\microinstruccion_OBUF[15]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h4717676774717676)) 
    \microinstruccion_OBUF[15]_inst_i_4 
       (.I0(opCode_IBUF[1]),
        .I1(opCode_IBUF[0]),
        .I2(pclk1),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(nclk1),
        .O(\microinstruccion_OBUF[15]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hB898E8988B898E89)) 
    \microinstruccion_OBUF[16]_inst_i_3 
       (.I0(opCode_IBUF[1]),
        .I1(opCode_IBUF[0]),
        .I2(pclk1),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(nclk1),
        .O(pclk1_reg_0));
  LUT6 #(
    .INIT(64'h3010601003010601)) 
    \microinstruccion_OBUF[19]_inst_i_3 
       (.I0(opCode_IBUF[1]),
        .I1(opCode_IBUF[0]),
        .I2(pclk1),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(nclk1),
        .O(pclk1_reg_1));
  MUXF7 \microinstruccion_OBUF[1]_inst_i_1 
       (.I0(\microinstruccion_OBUF[1]_inst_i_2_n_0 ),
        .I1(\microinstruccion[1] ),
        .O(microinstruccion_OBUF[0]),
        .S(opCode_IBUF[2]));
  LUT4 #(
    .INIT(16'h4F4A)) 
    \microinstruccion_OBUF[1]_inst_i_2 
       (.I0(opCode_IBUF[3]),
        .I1(pclk1_reg_1),
        .I2(opCode_IBUF[4]),
        .I3(\microinstruccion_OBUF[1]_inst_i_1_0 ),
        .O(\microinstruccion_OBUF[1]_inst_i_2_n_0 ));
  MUXF7 \microinstruccion_OBUF[6]_inst_i_1 
       (.I0(\microinstruccion_OBUF[6]_inst_i_2_n_0 ),
        .I1(\microinstruccion[6] ),
        .O(microinstruccion_OBUF[1]),
        .S(opCode_IBUF[2]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \microinstruccion_OBUF[6]_inst_i_2 
       (.I0(opCode_IBUF[1]),
        .I1(opCode_IBUF[3]),
        .I2(\microinstruccion_OBUF[15]_inst_i_4_n_0 ),
        .I3(opCode_IBUF[4]),
        .I4(\microinstruccion_OBUF[6]_inst_i_1_0 ),
        .O(\microinstruccion_OBUF[6]_inst_i_2_n_0 ));
  MUXF7 \microinstruccion_OBUF[8]_inst_i_1 
       (.I0(\microinstruccion_OBUF[8]_inst_i_2_n_0 ),
        .I1(\microinstruccion[8] ),
        .O(microinstruccion_OBUF[2]),
        .S(opCode_IBUF[2]));
  LUT4 #(
    .INIT(16'h4F4A)) 
    \microinstruccion_OBUF[8]_inst_i_2 
       (.I0(opCode_IBUF[3]),
        .I1(pclk1_reg_1),
        .I2(opCode_IBUF[4]),
        .I3(\microinstruccion_OBUF[8]_inst_i_1_0 ),
        .O(\microinstruccion_OBUF[8]_inst_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    nclk1_i_1
       (.I0(nclk1),
        .O(p_0_in));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nclk1_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in),
        .Q(nclk1));
  LUT1 #(
    .INIT(2'h1)) 
    pclk1_i_1
       (.I0(pclk1),
        .O(pclk1_i_1_n_0));
  FDPE #(
    .INIT(1'b1)) 
    pclk1_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(pclk1_i_1_n_0),
        .PRE(AR),
        .Q(pclk1));
endmodule

module registro
   (\Q_reg[1]_0 ,
    \Q_reg[1]_1 ,
    Q,
    microinstruccion_OBUF,
    \Q_reg[1]_2 ,
    \Q_reg[1]_3 ,
    \opCode[0] ,
    opCode_IBUF,
    nclk1,
    pclk1,
    \microinstruccion[16] ,
    \microinstruccion[16]_0 ,
    \microinstruccion[9] ,
    \microinstruccion[9]_0 ,
    funCode_IBUF,
    D,
    CLK_IBUF_BUFG,
    AR);
  output \Q_reg[1]_0 ;
  output \Q_reg[1]_1 ;
  output [1:0]Q;
  output [3:0]microinstruccion_OBUF;
  output \Q_reg[1]_2 ;
  output \Q_reg[1]_3 ;
  output \opCode[0] ;
  input [4:0]opCode_IBUF;
  input nclk1;
  input pclk1;
  input \microinstruccion[16] ;
  input \microinstruccion[16]_0 ;
  input \microinstruccion[9] ;
  input \microinstruccion[9]_0 ;
  input [3:0]funCode_IBUF;
  input [1:0]D;
  input CLK_IBUF_BUFG;
  input [0:0]AR;

  wire [0:0]AR;
  wire CLK_IBUF_BUFG;
  wire [1:0]D;
  wire [1:0]Q;
  wire \Q_reg[1]_0 ;
  wire \Q_reg[1]_1 ;
  wire \Q_reg[1]_2 ;
  wire \Q_reg[1]_3 ;
  wire [3:0]funCode_IBUF;
  wire \microinstruccion[16] ;
  wire \microinstruccion[16]_0 ;
  wire \microinstruccion[9] ;
  wire \microinstruccion[9]_0 ;
  wire [3:0]microinstruccion_OBUF;
  wire \microinstruccion_OBUF[15]_inst_i_5_n_0 ;
  wire \microinstruccion_OBUF[19]_inst_i_2_n_0 ;
  wire \microinstruccion_OBUF[8]_inst_i_4_n_0 ;
  wire nclk1;
  wire \opCode[0] ;
  wire [4:0]opCode_IBUF;
  wire pclk1;

  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(microinstruccion_OBUF[0]),
        .CLR(AR),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(microinstruccion_OBUF[0]),
        .CLR(AR),
        .D(D[1]),
        .Q(Q[1]));
  LUT6 #(
    .INIT(64'h2111FFFF2111EEEE)) 
    \microinstruccion_OBUF[0]_inst_i_1 
       (.I0(opCode_IBUF[2]),
        .I1(opCode_IBUF[3]),
        .I2(opCode_IBUF[1]),
        .I3(opCode_IBUF[0]),
        .I4(opCode_IBUF[4]),
        .I5(\opCode[0] ),
        .O(microinstruccion_OBUF[0]));
  LUT6 #(
    .INIT(64'h0000000000015555)) 
    \microinstruccion_OBUF[0]_inst_i_2 
       (.I0(opCode_IBUF[0]),
        .I1(funCode_IBUF[2]),
        .I2(funCode_IBUF[1]),
        .I3(funCode_IBUF[0]),
        .I4(funCode_IBUF[3]),
        .I5(opCode_IBUF[1]),
        .O(\opCode[0] ));
  LUT5 #(
    .INIT(32'h3808080B)) 
    \microinstruccion_OBUF[15]_inst_i_3 
       (.I0(\microinstruccion_OBUF[15]_inst_i_5_n_0 ),
        .I1(opCode_IBUF[3]),
        .I2(opCode_IBUF[4]),
        .I3(opCode_IBUF[0]),
        .I4(opCode_IBUF[1]),
        .O(\Q_reg[1]_3 ));
  LUT6 #(
    .INIT(64'h8BFFFF8BC0CCCCC0)) 
    \microinstruccion_OBUF[15]_inst_i_5 
       (.I0(Q[0]),
        .I1(opCode_IBUF[1]),
        .I2(Q[1]),
        .I3(nclk1),
        .I4(pclk1),
        .I5(opCode_IBUF[0]),
        .O(\microinstruccion_OBUF[15]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00A000A0CF00C000)) 
    \microinstruccion_OBUF[16]_inst_i_1 
       (.I0(\microinstruccion_OBUF[19]_inst_i_2_n_0 ),
        .I1(\microinstruccion[16] ),
        .I2(opCode_IBUF[2]),
        .I3(opCode_IBUF[4]),
        .I4(\microinstruccion[16]_0 ),
        .I5(opCode_IBUF[3]),
        .O(microinstruccion_OBUF[2]));
  LUT5 #(
    .INIT(32'h08083000)) 
    \microinstruccion_OBUF[19]_inst_i_1 
       (.I0(\microinstruccion_OBUF[19]_inst_i_2_n_0 ),
        .I1(opCode_IBUF[2]),
        .I2(opCode_IBUF[4]),
        .I3(\microinstruccion[9]_0 ),
        .I4(opCode_IBUF[3]),
        .O(microinstruccion_OBUF[3]));
  LUT6 #(
    .INIT(64'h7040070400C0000C)) 
    \microinstruccion_OBUF[19]_inst_i_2 
       (.I0(Q[0]),
        .I1(opCode_IBUF[1]),
        .I2(nclk1),
        .I3(Q[1]),
        .I4(pclk1),
        .I5(opCode_IBUF[0]),
        .O(\microinstruccion_OBUF[19]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000BBB8)) 
    \microinstruccion_OBUF[1]_inst_i_3 
       (.I0(\microinstruccion_OBUF[8]_inst_i_4_n_0 ),
        .I1(opCode_IBUF[3]),
        .I2(opCode_IBUF[0]),
        .I3(opCode_IBUF[1]),
        .I4(opCode_IBUF[4]),
        .O(\Q_reg[1]_0 ));
  LUT5 #(
    .INIT(32'h00008B88)) 
    \microinstruccion_OBUF[6]_inst_i_3 
       (.I0(\microinstruccion_OBUF[15]_inst_i_5_n_0 ),
        .I1(opCode_IBUF[3]),
        .I2(opCode_IBUF[0]),
        .I3(opCode_IBUF[1]),
        .I4(opCode_IBUF[4]),
        .O(\Q_reg[1]_2 ));
  LUT5 #(
    .INIT(32'h3000BBBB)) 
    \microinstruccion_OBUF[8]_inst_i_3 
       (.I0(\microinstruccion_OBUF[8]_inst_i_4_n_0 ),
        .I1(opCode_IBUF[3]),
        .I2(opCode_IBUF[1]),
        .I3(opCode_IBUF[0]),
        .I4(opCode_IBUF[4]),
        .O(\Q_reg[1]_1 ));
  LUT6 #(
    .INIT(64'h7040070433F3333F)) 
    \microinstruccion_OBUF[8]_inst_i_4 
       (.I0(Q[0]),
        .I1(opCode_IBUF[1]),
        .I2(nclk1),
        .I3(Q[1]),
        .I4(pclk1),
        .I5(opCode_IBUF[0]),
        .O(\microinstruccion_OBUF[8]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0088008833300030)) 
    \microinstruccion_OBUF[9]_inst_i_1 
       (.I0(\microinstruccion_OBUF[19]_inst_i_2_n_0 ),
        .I1(opCode_IBUF[2]),
        .I2(\microinstruccion[9] ),
        .I3(opCode_IBUF[4]),
        .I4(\microinstruccion[9]_0 ),
        .I5(opCode_IBUF[3]),
        .O(microinstruccion_OBUF[1]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
