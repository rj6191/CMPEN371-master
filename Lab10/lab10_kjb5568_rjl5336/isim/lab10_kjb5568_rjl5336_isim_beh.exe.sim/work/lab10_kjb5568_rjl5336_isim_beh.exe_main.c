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

char *IEEE_P_1242562249;
char *IEEE_P_2592010699;
char *KJB5568_RJL5336_LIBRARY_P_2395063211;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    kjb5568_rjl5336_library_p_2395063211_init();
    kjb5568_rjl5336_library_a_1286796162_3212880686_init();
    kjb5568_rjl5336_library_a_0421237610_3212880686_init();
    kjb5568_rjl5336_library_a_1130988942_3990940387_init();
    kjb5568_rjl5336_library_a_0648073780_1181938964_init();
    kjb5568_rjl5336_library_a_3621777219_1181938964_init();
    work_a_0771243646_3212880686_init();
    work_a_2649315539_3212880686_init();
    work_a_2800383554_3212880686_init();
    kjb5568_rjl5336_library_a_3021730621_3212880686_init();
    kjb5568_rjl5336_library_a_1966193098_1181938964_init();
    kjb5568_rjl5336_library_a_0120057300_3212880686_init();
    work_a_0945777706_3212880686_init();
    kjb5568_rjl5336_library_a_0040434513_3212880686_init();
    kjb5568_rjl5336_library_a_1600632057_1181938964_init();
    kjb5568_rjl5336_library_a_1799425940_3212880686_init();
    work_a_1965107973_3212880686_init();


    xsi_register_tops("work_a_1965107973_3212880686");

    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    KJB5568_RJL5336_LIBRARY_P_2395063211 = xsi_get_engine_memory("kjb5568_rjl5336_library_p_2395063211");
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}
