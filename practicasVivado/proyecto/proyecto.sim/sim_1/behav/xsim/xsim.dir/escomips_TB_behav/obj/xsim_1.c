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
extern void execute_318(char*, char *);
extern void execute_319(char*, char *);
extern void execute_30(char*, char *);
extern void execute_317(char*, char *);
extern void execute_32(char*, char *);
extern void execute_34(char*, char *);
extern void execute_36(char*, char *);
extern void execute_38(char*, char *);
extern void execute_42(char*, char *);
extern void execute_44(char*, char *);
extern void execute_56(char*, char *);
extern void execute_49(char*, char *);
extern void execute_51(char*, char *);
extern void execute_53(char*, char *);
extern void execute_104(char*, char *);
extern void execute_112(char*, char *);
extern void execute_290(char*, char *);
extern void execute_115(char*, char *);
extern void execute_116(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void execute_123(char*, char *);
extern void execute_121(char*, char *);
extern void execute_122(char*, char *);
extern void execute_294(char*, char *);
extern void execute_295(char*, char *);
extern void execute_299(char*, char *);
extern void execute_301(char*, char *);
extern void execute_303(char*, char *);
extern void execute_305(char*, char *);
extern void execute_306(char*, char *);
extern void execute_307(char*, char *);
extern void execute_309(char*, char *);
extern void execute_311(char*, char *);
extern void execute_313(char*, char *);
extern void execute_315(char*, char *);
extern void execute_316(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[40] = {(funcp)execute_318, (funcp)execute_319, (funcp)execute_30, (funcp)execute_317, (funcp)execute_32, (funcp)execute_34, (funcp)execute_36, (funcp)execute_38, (funcp)execute_42, (funcp)execute_44, (funcp)execute_56, (funcp)execute_49, (funcp)execute_51, (funcp)execute_53, (funcp)execute_104, (funcp)execute_112, (funcp)execute_290, (funcp)execute_115, (funcp)execute_116, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)execute_123, (funcp)execute_121, (funcp)execute_122, (funcp)execute_294, (funcp)execute_295, (funcp)execute_299, (funcp)execute_301, (funcp)execute_303, (funcp)execute_305, (funcp)execute_306, (funcp)execute_307, (funcp)execute_309, (funcp)execute_311, (funcp)execute_313, (funcp)execute_315, (funcp)execute_316, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 40;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/escomips_TB_behav/xsim.reloc",  (void **)funcTab, 40);
	iki_vhdl_file_variable_register(dp + 2143680);
	iki_vhdl_file_variable_register(dp + 2143736);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/escomips_TB_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/escomips_TB_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
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
    iki_set_sv_type_file_path_name("xsim.dir/escomips_TB_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/escomips_TB_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/escomips_TB_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
