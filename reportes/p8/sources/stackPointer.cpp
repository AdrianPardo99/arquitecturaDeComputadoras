/*
 * Alumno: Gonzalez Pardo Adrian
 * Grupo: 3CV8
 * Practica 9
 */
#include <bits/stdc++.h>

#define tamPC 8

using namespace std;
class Stack{
private:
  bool UP,DW,WPC,CLR;
  unsigned short PC[tamPC],SP;
  unsigned short PCin,PCout;
public:
  Stack(){
    srand(time(NULL));
  }
  bool getUP(){
    return this->UP;
  }

  bool getDW(){
    return this->DW;
  }

  bool getWPC(){
    return this->WPC;
  }

  bool getCLR(){
    return this->CLR;
  }

  unsigned short *getPC(){
    return this->PC;
  }

  unsigned short getSP(){
    return this->SP;
  }

  unsigned short getPCin(){
    return this->PCin;
  }

  unsigned short getPCout(){
    return this->PCout;
  }

  void setUP(bool UP){
    this->UP=UP;
  }

  void setDW(bool DW){
    this->DW=DW;
  }

  void setWPC(bool WPC){
    this->WPC=WPC;
  }

  void setCLR(bool CLR){
    this->CLR=CLR;
  }

  void setSP(unsigned short SP){
    this->SP=SP;
  }

  void setPCin(unsigned short PCin){
    this->PCin=PCin;
  }

  void setPCout(unsigned short PCout){
    this->PCout=PCout;
  }

  void set(){
    for(int i=0;i<tamPC;i++){
      *(PC+i)=(unsigned short)(rand()%65535)-16384;
    }
    setSP(0);
  }

  void get(){
    for(int i=0;i<8;i++){
      printf("\tPC[%d] = %d\n",i,*(PC+i));
    }
  }

  void operacion(unsigned short PCin,bool UP,bool DW,bool WPC, bool CLR){
    setPCin(PCin);
    setUP(UP);
    setDW(DW);
    setWPC(WPC);
    setCLR(CLR);
    if(getCLR()){
      setSP(0);
      for(int i=0;i<tamPC;i++){
        *(PC+i)=0;
      }
      PCout=*(PC+getSP());
      return;
    }
    if(!getWPC()&&!getUP()&&!getDW()){
      setSP(getSP());
      *(PC+getSP())+=1;
      PCout=*(PC+getSP());
      return ;
    }
    if(getWPC()&&!getUP()&&!getDW()){
      setSP(getSP());
      *(PC+getSP())=PCin;
      PCout=*(PC+getSP());
      return;
    }
    if(getWPC()&&getUP()&&!getDW()){
      if(getSP()+1<tamPC){
        setSP(getSP()+1);
      }else{
        setSP(0);
      }
      *(PC+getSP())=PCin;
      PCout=*(PC+getSP());
      return;
    }
    if(!getWPC()&&!getUP()&&getDW()){
      if(getSP()>0){
        setSP(getSP()-1);
      }else{
        setSP(tamPC-1);
      }
      *(PC+getSP())+=1;
      PCout=*(PC+getSP());
      return;
    }

  }

  void operacion(){
    printf("PC[%d] = %d\n",getSP(),*(PC+getSP()));
  }
};
int main(int argc, char *argv[]) {
  Stack st;
  printf("Set()\n");
  st.set();
  st.get();
  printf("CLR\n");
  st.operacion(0,0,0,0,1);
  st.get();
  st.operacion();
  printf("Instruccion\n");
  printf("LI R6, #87     \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("LI R8, #90     \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("B 34           \t");
  st.operacion(34,0,0,1,0);
  st.operacion();
  printf("ADD R8, R2, R3 \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("SUB R1, R2, R3 \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("CALL 0x61      \t");
  st.operacion(61,1,0,1,0);
  st.operacion();
  printf("LI R6, #87     \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("LI R8, #90     \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("CALL 100       \t");
  st.operacion(100,1,0,1,0);
  st.operacion();
  printf("ADD R8, R2, R3 \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("SUB R1, R2, R3 \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("LI R6, #87     \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("RET            \t");
  st.operacion(0,0,1,0,0);
  st.operacion();
  printf("SUB R1, R2, R3 \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("LI R6, #87     \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("RET            \t");
  st.operacion(0,0,1,0,0);
  st.operacion();
  printf("B 300          \t");
  st.operacion(300,0,0,1,0);
  st.operacion();
  printf("CALL 889       \t");
  st.operacion(889,1,0,1,0);
  st.operacion();
  printf("ADD R8, R2, R3 \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("SUB R1, R2, R3 \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("LI R6, #87     \t");
  st.operacion(0,0,0,0,0);
  st.operacion();
  printf("RET            \t");
  st.operacion(0,0,1,0,0);
  st.operacion();
  printf("RET            \t");
  st.operacion(0,0,1,0,0);
  st.operacion();
  printf("Get\n");
  st.get();
  return 0;
}
