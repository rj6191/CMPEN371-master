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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "H:/Github/CMPEN371/Lab04/kjb5568_rjl5336_library/DFF_enable.vhd";



static void kjb5568_rjl5336_library_a_0046527848_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 1312U);
    t4 = xsi_signal_has_event(t3);
    if (t4 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t3 = (t0 + 2992);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t5 = (t0 + 1032U);
    t12 = *((char **)t5);
    t13 = *((unsigned char *)t12);
    t5 = (t0 + 3072);
    t14 = (t5 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = t13;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB5:    t5 = (t0 + 1192U);
    t9 = *((char **)t5);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)3);
    t1 = t11;
    goto LAB7;

LAB8:    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    t2 = t8;
    goto LAB10;

}


extern void kjb5568_rjl5336_library_a_0046527848_3212880686_init()
{
	static char *pe[] = {(void *)kjb5568_rjl5336_library_a_0046527848_3212880686_p_0};
	xsi_register_didat("kjb5568_rjl5336_library_a_0046527848_3212880686", "isim/lab04_kjb5568_rjl5336_isim_beh.exe.sim/kjb5568_rjl5336_library/a_0046527848_3212880686.didat");
	xsi_register_executes(pe);
}
