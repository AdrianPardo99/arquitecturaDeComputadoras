/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern void execute_343(char*, char *);
extern void execute_344(char*, char *);
extern void execute_33(char*, char *);
extern void execute_35(char*, char *);
extern void execute_36(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_63(char*, char *);
extern void execute_73(char*, char *);
extern void execute_77(char*, char *);
extern void execute_81(char*, char *);
extern void execute_85(char*, char *);
extern void execute_90(char*, char *);
extern void execute_97(char*, char *);
extern void execute_104(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_108(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_116(char*, char *);
extern void execute_117(char*, char *);
extern void execute_124(char*, char *);
extern void execute_128(char*, char *);
extern void execute_134(char*, char *);
extern void execute_138(char*, char *);
extern void execute_148(char*, char *);
extern void execute_156(char*, char *);
extern void execute_163(char*, char *);
extern void execute_168(char*, char *);
extern void execute_176(char*, char *);
extern void execute_184(char*, char *);
extern void execute_192(char*, char *);
extern void execute_206(char*, char *);
extern void execute_219(char*, char *);
extern void execute_223(char*, char *);
extern void execute_230(char*, char *);
extern void execute_234(char*, char *);
extern void execute_241(char*, char *);
extern void execute_248(char*, char *);
extern void execute_252(char*, char *);
extern void execute_262(char*, char *);
extern void execute_279(char*, char *);
extern void execute_280(char*, char *);
extern void execute_281(char*, char *);
extern void execute_283(char*, char *);
extern void execute_284(char*, char *);
extern void execute_285(char*, char *);
extern void execute_293(char*, char *);
extern void execute_297(char*, char *);
extern void execute_302(char*, char *);
extern void execute_306(char*, char *);
extern void execute_310(char*, char *);
extern void execute_315(char*, char *);
extern void execute_319(char*, char *);
extern void execute_324(char*, char *);
extern void execute_329(char*, char *);
extern void execute_334(char*, char *);
extern void execute_338(char*, char *);
extern void execute_342(char*, char *);
extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_39(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_42(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_118(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_140(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_149(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[74] = {(funcp)execute_343, (funcp)execute_344, (funcp)execute_33, (funcp)execute_35, (funcp)execute_36, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_63, (funcp)execute_73, (funcp)execute_77, (funcp)execute_81, (funcp)execute_85, (funcp)execute_90, (funcp)execute_97, (funcp)execute_104, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_112, (funcp)execute_113, (funcp)execute_114, (funcp)execute_116, (funcp)execute_117, (funcp)execute_124, (funcp)execute_128, (funcp)execute_134, (funcp)execute_138, (funcp)execute_148, (funcp)execute_156, (funcp)execute_163, (funcp)execute_168, (funcp)execute_176, (funcp)execute_184, (funcp)execute_192, (funcp)execute_206, (funcp)execute_219, (funcp)execute_223, (funcp)execute_230, (funcp)execute_234, (funcp)execute_241, (funcp)execute_248, (funcp)execute_252, (funcp)execute_262, (funcp)execute_279, (funcp)execute_280, (funcp)execute_281, (funcp)execute_283, (funcp)execute_284, (funcp)execute_285, (funcp)execute_293, (funcp)execute_297, (funcp)execute_302, (funcp)execute_306, (funcp)execute_310, (funcp)execute_315, (funcp)execute_319, (funcp)execute_324, (funcp)execute_329, (funcp)execute_334, (funcp)execute_338, (funcp)execute_342, (funcp)transaction_35, (funcp)transaction_36, (funcp)transaction_37, (funcp)transaction_38, (funcp)transaction_39, (funcp)transaction_42, (funcp)transaction_54, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_111, (funcp)transaction_118, (funcp)transaction_140, (funcp)transaction_149};
const int NumRelocateId= 74;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/arquitectura_TB_func_synth/xsim.reloc",  (void **)funcTab, 74);
	iki_vhdl_file_variable_register(dp + 45400);
	iki_vhdl_file_variable_register(dp + 45456);
	iki_vhdl_file_variable_register(dp + 56528);
	iki_vhdl_file_variable_register(dp + 56672);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/arquitectura_TB_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/arquitectura_TB_func_synth/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/arquitectura_TB_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/arquitectura_TB_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/arquitectura_TB_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
