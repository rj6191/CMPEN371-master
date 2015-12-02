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
static const char *ng0 = "C:/Users/Kevin/Desktop/new lab2 with testbenches/TopLevel_tb.vhd";



static void work_a_2433312762_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;

LAB0:    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3080);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 6909);
    *((int *)t2) = 0;
    t4 = (t0 + 6913);
    *((int *)t4) = 9;
    t5 = 0;
    t6 = 9;

LAB8:    if (t5 <= t6)
        goto LAB9;

LAB11:    xsi_set_current_line(111, ng0);

LAB43:    *((char **)t1) = &&LAB44;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(89, ng0);
    t7 = (t0 + 2288U);
    t8 = *((char **)t7);
    t9 = (30 - 30);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t7 = (t0 + 6909);
    t12 = *((int *)t7);
    t13 = (t12 - 0);
    t14 = (t13 * 1);
    t15 = (31U * t14);
    t16 = (0 + t15);
    t17 = (t16 + t11);
    t18 = (t8 + t17);
    t19 = *((unsigned char *)t18);
    t20 = (t0 + 3656);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = t19;
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2288U);
    t4 = *((char **)t2);
    t9 = (29 - 30);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t2 = (t0 + 6909);
    t12 = *((int *)t2);
    t13 = (t12 - 0);
    t14 = (t13 * 1);
    t15 = (31U * t14);
    t16 = (0 + t15);
    t17 = (t16 + t11);
    t7 = (t4 + t17);
    t19 = *((unsigned char *)t7);
    t8 = (t0 + 3720);
    t18 = (t8 + 56U);
    t20 = *((char **)t18);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t19;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2288U);
    t4 = *((char **)t2);
    t9 = (28 - 30);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t2 = (t0 + 6909);
    t12 = *((int *)t2);
    t13 = (t12 - 0);
    t14 = (t13 * 1);
    t15 = (31U * t14);
    t16 = (0 + t15);
    t17 = (t16 + t11);
    t7 = (t4 + t17);
    t19 = *((unsigned char *)t7);
    t8 = (t0 + 3784);
    t18 = (t8 + 56U);
    t20 = *((char **)t18);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t19;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2288U);
    t4 = *((char **)t2);
    t10 = (30 - 27);
    t11 = (t10 * 1U);
    t2 = (t0 + 6909);
    t9 = *((int *)t2);
    t12 = (t9 - 0);
    t14 = (t12 * 1);
    t15 = (31U * t14);
    t16 = (0 + t15);
    t17 = (t16 + t11);
    t7 = (t4 + t17);
    t8 = (t0 + 3848);
    t18 = (t8 + 56U);
    t20 = *((char **)t18);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(95, ng0);
    t3 = (2 * 1000LL);
    t2 = (t0 + 3080);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:    t2 = (t0 + 6909);
    t5 = *((int *)t2);
    t4 = (t0 + 6913);
    t6 = *((int *)t4);
    if (t5 == t6)
        goto LAB11;

LAB40:    t9 = (t5 + 1);
    t5 = t9;
    t7 = (t0 + 6909);
    *((int *)t7) = t5;
    goto LAB8;

LAB12:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 2288U);
    t7 = *((char **)t2);
    t10 = (30 - 19);
    t11 = (t10 * 1U);
    t2 = (t0 + 6909);
    t9 = *((int *)t2);
    t12 = (t9 - 0);
    t14 = (t12 * 1);
    t15 = (31U * t14);
    t16 = (0 + t15);
    t17 = (t16 + t11);
    t8 = (t7 + t17);
    t19 = 1;
    if (8U == 8U)
        goto LAB18;

LAB19:    t19 = 0;

LAB20:    if (t19 == 0)
        goto LAB16;

LAB17:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 2288U);
    t7 = *((char **)t2);
    t10 = (30 - 11);
    t11 = (t10 * 1U);
    t2 = (t0 + 6909);
    t9 = *((int *)t2);
    t12 = (t9 - 0);
    t14 = (t12 * 1);
    t15 = (31U * t14);
    t16 = (0 + t15);
    t17 = (t16 + t11);
    t8 = (t7 + t17);
    t19 = 1;
    if (7U == 7U)
        goto LAB26;

LAB27:    t19 = 0;

LAB28:    if (t19 == 0)
        goto LAB24;

LAB25:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 1992U);
    t4 = *((char **)t2);
    t2 = (t0 + 2288U);
    t7 = *((char **)t2);
    t10 = (30 - 4);
    t11 = (t10 * 1U);
    t2 = (t0 + 6909);
    t9 = *((int *)t2);
    t12 = (t9 - 0);
    t14 = (t12 * 1);
    t15 = (31U * t14);
    t16 = (0 + t15);
    t17 = (t16 + t11);
    t8 = (t7 + t17);
    t19 = 1;
    if (5U == 5U)
        goto LAB34;

LAB35:    t19 = 0;

LAB36:    if (t19 == 0)
        goto LAB32;

LAB33:    goto LAB10;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    t21 = (t0 + 6917);
    xsi_report(t21, 29U, (unsigned char)3);
    goto LAB17;

LAB18:    t25 = 0;

LAB21:    if (t25 < 8U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t18 = (t4 + t25);
    t20 = (t8 + t25);
    if (*((unsigned char *)t18) != *((unsigned char *)t20))
        goto LAB19;

LAB23:    t25 = (t25 + 1);
    goto LAB21;

LAB24:    t21 = (t0 + 6946);
    xsi_report(t21, 31U, (unsigned char)3);
    goto LAB25;

LAB26:    t25 = 0;

LAB29:    if (t25 < 7U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t18 = (t4 + t25);
    t20 = (t8 + t25);
    if (*((unsigned char *)t18) != *((unsigned char *)t20))
        goto LAB27;

LAB31:    t25 = (t25 + 1);
    goto LAB29;

LAB32:    t21 = (t0 + 6977);
    xsi_report(t21, 30U, (unsigned char)3);
    goto LAB33;

LAB34:    t25 = 0;

LAB37:    if (t25 < 5U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t18 = (t4 + t25);
    t20 = (t8 + t25);
    if (*((unsigned char *)t18) != *((unsigned char *)t20))
        goto LAB35;

LAB39:    t25 = (t25 + 1);
    goto LAB37;

LAB41:    goto LAB2;

LAB42:    goto LAB41;

LAB44:    goto LAB42;

}


extern void work_a_2433312762_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2433312762_2372691052_p_0};
	xsi_register_didat("work_a_2433312762_2372691052", "isim/TopLevel_tb_isim_beh.exe.sim/work/a_2433312762_2372691052.didat");
	xsi_register_executes(pe);
}
