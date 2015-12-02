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
static const char *ng0 = "C:/Users/kalvi_000/Desktop/Lab08/kjb5568_rjl5336_library/CompareGRT.vhd";
extern char *IEEE_P_2592010699;



static void kjb5568_rjl5336_library_a_0734988709_1181938964_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4024);
    t4 = xsi_vhdl_greater(t1, t2, 10U, t3, 10U);
    if (t4 != 0)
        goto LAB3;

LAB4:    t10 = (t0 + 1192U);
    t11 = *((char **)t10);
    t10 = (t0 + 1032U);
    t12 = *((char **)t10);
    t10 = ((IEEE_P_2592010699) + 4024);
    t13 = xsi_vhdl_greater(t10, t11, 10U, t12, 10U);
    if (t13 != 0)
        goto LAB5;

LAB6:
LAB7:    t19 = (t0 + 3032);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t19);

LAB2:    t24 = (t0 + 2952);
    *((int *)t24) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 3032);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB2;

LAB5:    t14 = (t0 + 3032);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t14);
    goto LAB2;

LAB8:    goto LAB2;

}


extern void kjb5568_rjl5336_library_a_0734988709_1181938964_init()
{
	static char *pe[] = {(void *)kjb5568_rjl5336_library_a_0734988709_1181938964_p_0};
	xsi_register_didat("kjb5568_rjl5336_library_a_0734988709_1181938964", "isim/VGA_Control_isim_beh.exe.sim/kjb5568_rjl5336_library/a_0734988709_1181938964.didat");
	xsi_register_executes(pe);
}
