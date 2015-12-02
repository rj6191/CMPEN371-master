/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *STD_STANDARD;
char *KJB5568_RJL5336_LIBRARY_P_2395063211;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    kjb5568_rjl5336_library_p_2395063211_init();
    kjb5568_rjl5336_library_a_0120057300_3212880686_init();
    kjb5568_rjl5336_library_a_1152670293_3212880686_init();


    xsi_register_tops("kjb5568_rjl5336_library_a_1152670293_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    KJB5568_RJL5336_LIBRARY_P_2395063211 = xsi_get_engine_memory("kjb5568_rjl5336_library_p_2395063211");

    return xsi_run_simulation(argc, argv);

}
