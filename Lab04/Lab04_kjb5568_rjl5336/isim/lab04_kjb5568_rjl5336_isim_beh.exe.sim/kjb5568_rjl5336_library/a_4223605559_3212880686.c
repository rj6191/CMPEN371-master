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
static const char *ng0 = "H:/Github/CMPEN371/Lab04/kjb5568_rjl5336_library/counterupdown_nbit.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void kjb5568_rjl5336_library_a_4223605559_3212880686_p_0(char *t0)
{
    char t22[16];
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
    unsigned char t14;
    char *t15;
    int t16;
    int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 1472U);
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
LAB3:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1992U);
    t5 = *((char **)t3);
    t16 = *((int *)t5);
    t3 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t22, t16, 16);
    t6 = (t0 + 3736);
    t9 = (t6 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t3, 16U);
    xsi_driver_first_trans_fast_port(t6);
    t3 = (t0 + 3592);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(36, ng0);
    t5 = (t0 + 1192U);
    t12 = *((char **)t5);
    t13 = *((unsigned char *)t12);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB11;

LAB13:    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t1 = *((unsigned char *)t5);
    t2 = (t1 == (unsigned char)3);
    if (t2 != 0)
        goto LAB14;

LAB15:    t3 = (t0 + 1672U);
    t5 = *((char **)t3);
    t1 = *((unsigned char *)t5);
    t2 = (t1 == (unsigned char)3);
    if (t2 != 0)
        goto LAB16;

LAB17:
LAB12:    goto LAB3;

LAB5:    t5 = (t0 + 1032U);
    t9 = *((char **)t5);
    t10 = *((unsigned char *)t9);
    t11 = (t10 == (unsigned char)3);
    t1 = t11;
    goto LAB7;

LAB8:    t5 = (t0 + 1512U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    t2 = t8;
    goto LAB10;

LAB11:    xsi_set_current_line(37, ng0);
    t5 = (t0 + 1992U);
    t15 = *((char **)t5);
    t16 = *((int *)t15);
    t17 = (t16 + 1);
    t5 = (t0 + 3672);
    t18 = (t5 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    *((int *)t21) = t17;
    xsi_driver_first_trans_fast(t5);
    goto LAB12;

LAB14:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 1992U);
    t6 = *((char **)t3);
    t16 = *((int *)t6);
    t17 = (t16 - 1);
    t3 = (t0 + 3672);
    t9 = (t3 + 56U);
    t12 = *((char **)t9);
    t15 = (t12 + 56U);
    t18 = *((char **)t15);
    *((int *)t18) = t17;
    xsi_driver_first_trans_fast(t3);
    goto LAB12;

LAB16:    xsi_set_current_line(41, ng0);
    t3 = (t0 + 3672);
    t6 = (t3 + 56U);
    t9 = *((char **)t6);
    t12 = (t9 + 56U);
    t15 = *((char **)t12);
    *((int *)t15) = 0;
    xsi_driver_first_trans_fast(t3);
    goto LAB12;

}


extern void kjb5568_rjl5336_library_a_4223605559_3212880686_init()
{
	static char *pe[] = {(void *)kjb5568_rjl5336_library_a_4223605559_3212880686_p_0};
	xsi_register_didat("kjb5568_rjl5336_library_a_4223605559_3212880686", "isim/lab04_kjb5568_rjl5336_isim_beh.exe.sim/kjb5568_rjl5336_library/a_4223605559_3212880686.didat");
	xsi_register_executes(pe);
}
