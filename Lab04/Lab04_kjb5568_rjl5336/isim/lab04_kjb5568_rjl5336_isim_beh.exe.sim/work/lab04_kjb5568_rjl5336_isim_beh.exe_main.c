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

char *KJB5568_RJL5336_LIBRARY_P_2395063211;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    kjb5568_rjl5336_library_p_2395063211_init();
    kjb5568_rjl5336_library_a_0046527848_3212880686_init();
    kjb5568_rjl5336_library_a_1473390551_3212880686_init();
    kjb5568_rjl5336_library_a_3264794668_3212880686_init();
    kjb5568_rjl5336_library_a_3505398161_3212880686_init();
    kjb5568_rjl5336_library_a_1874319323_3212880686_init();
    kjb5568_rjl5336_library_a_2064541777_3212880686_init();
    kjb5568_rjl5336_library_a_0421237610_3212880686_init();
    kjb5568_rjl5336_library_a_4223605559_3212880686_init();
    kjb5568_rjl5336_library_a_1346204245_3212880686_init();
    kjb5568_rjl5336_library_a_1238305182_3212880686_init();
    kjb5568_rjl5336_library_a_3895477794_3212880686_init();
    kjb5568_rjl5336_library_a_0040434513_3212880686_init();
    kjb5568_rjl5336_library_a_1600632057_1181938964_init();
    kjb5568_rjl5336_library_a_1799425940_3212880686_init();
    work_a_3917199915_1181938964_init();


    xsi_register_tops("work_a_3917199915_1181938964");

    KJB5568_RJL5336_LIBRARY_P_2395063211 = xsi_get_engine_memory("kjb5568_rjl5336_library_p_2395063211");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
