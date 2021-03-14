/*
 * three_phase_WPT.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "three_phase_WPT".
 *
 * Model version              : 6.41
 * Simulink Coder version : 9.4 (R2020b) 29-Jul-2020
 * C source code generated on : Sun Mar 14 13:48:58 2021
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "three_phase_WPT.h"
#include "three_phase_WPT_private.h"

const real_T three_phase_WPT_RGND = 0.0;/* real_T ground */

/* Block signals (default storage) */
B_three_phase_WPT_T three_phase_WPT_B;

/* Block states (default storage) */
DW_three_phase_WPT_T three_phase_WPT_DW;

/* Real-time model */
static RT_MODEL_three_phase_WPT_T three_phase_WPT_M_;
RT_MODEL_three_phase_WPT_T *const three_phase_WPT_M = &three_phase_WPT_M_;
real_T rt_modd_snf(real_T u0, real_T u1)
{
  real_T q;
  real_T y;
  boolean_T yEq;
  y = u0;
  if (u1 == 0.0) {
    if (u0 == 0.0) {
      y = u1;
    }
  } else if (rtIsNaN(u0) || rtIsNaN(u1) || rtIsInf(u0)) {
    y = (rtNaN);
  } else if (u0 == 0.0) {
    y = 0.0 / u1;
  } else if (rtIsInf(u1)) {
    if ((u1 < 0.0) != (u0 < 0.0)) {
      y = u1;
    }
  } else {
    y = fmod(u0, u1);
    yEq = (y == 0.0);
    if ((!yEq) && (u1 > floor(u1))) {
      q = fabs(u0 / u1);
      yEq = !(fabs(q - floor(q + 0.5)) > DBL_EPSILON * q);
    }

    if (yEq) {
      y = u1 * 0.0;
    } else {
      if ((u0 < 0.0) != (u1 < 0.0)) {
        y += u1;
      }
    }
  }

  return y;
}

/* Model step function */
void three_phase_WPT_step(void)
{
  /* local block i/o variables */
  real_T rtb_uR;
  real_T rtb_Sum;
  real_T rtb_Sum1;
  real_T rtb_donotdeletethisgain;
  real_T rtb_Switch;
  real_T rtb_MathFunction;
  real_T rtb_SineWave;
  real_T rtb_SineWave_tmp;
  boolean_T rtb_RelationalOperator;
  boolean_T rtb_RelationalOperator1;
  boolean_T rtb_RelationalOperator2;

  /* Constant: '<S174>/SwitchCurrents' */
  memcpy(&three_phase_WPT_B.SwitchCurrents[0],
         &three_phase_WPT_P.SwitchCurrents_Value[0], 18U * sizeof(real_T));

  /* Constant: '<S11>/DC' */
  three_phase_WPT_B.DC = three_phase_WPT_P.VDC;

  /* Constant: '<S144>/eee' */
  three_phase_WPT_B.eee = three_phase_WPT_P.eee_Value;

  /* Constant: '<S146>/eee' */
  three_phase_WPT_B.eee_f = three_phase_WPT_P.eee_Value_p;

  /* Constant: '<S148>/eee' */
  three_phase_WPT_B.eee_e = three_phase_WPT_P.eee_Value_m;

  /* Constant: '<S150>/eee' */
  three_phase_WPT_B.eee_n = three_phase_WPT_P.eee_Value_k;

  /* Constant: '<S152>/eee' */
  three_phase_WPT_B.eee_c = three_phase_WPT_P.eee_Value_j;

  /* Constant: '<S154>/eee' */
  three_phase_WPT_B.eee_cv = three_phase_WPT_P.eee_Value_i;

  /* Gain: '<S96>/do not delete this gain' incorporates:
   *  Abs: '<S167>/Abs'
   *  Constant: '<S6>/Constant'
   */
  rtb_donotdeletethisgain = fabs(three_phase_WPT_P.RL);

  /* Switch: '<S167>/Switch' incorporates:
   *  Constant: '<S6>/Constant'
   *  Signum: '<S167>/Sign'
   */
  if (rtb_donotdeletethisgain > three_phase_WPT_P.VariableResistor_Rabsmin) {
    /* Gain: '<S96>/do not delete this gain' incorporates:
     *  Constant: '<S6>/Constant'
     */
    rtb_donotdeletethisgain = three_phase_WPT_P.RL;
  } else {
    if (three_phase_WPT_P.RL < 0.0) {
      /* Signum: '<S167>/Sign' */
      rtb_SineWave_tmp = -1.0;
    } else if (three_phase_WPT_P.RL > 0.0) {
      /* Signum: '<S167>/Sign' */
      rtb_SineWave_tmp = 1.0;
    } else if (three_phase_WPT_P.RL == 0.0) {
      /* Signum: '<S167>/Sign' */
      rtb_SineWave_tmp = 0.0;
    } else {
      /* Signum: '<S167>/Sign' */
      rtb_SineWave_tmp = (rtNaN);
    }

    /* Switch: '<S167>/Switch1' incorporates:
     *  Constant: '<S6>/Constant'
     *  Signum: '<S167>/Sign'
     */
    if (rtb_SineWave_tmp > three_phase_WPT_P.Switch1_Threshold) {
      /* Gain: '<S96>/do not delete this gain' incorporates:
       *  Constant: '<S167>/Constant'
       */
      rtb_donotdeletethisgain = three_phase_WPT_P.VariableResistor_Rabsmin;
    } else {
      /* Gain: '<S96>/do not delete this gain' incorporates:
       *  Constant: '<S167>/Constant1'
       */
      rtb_donotdeletethisgain = -three_phase_WPT_P.VariableResistor_Rabsmin;
    }

    /* End of Switch: '<S167>/Switch1' */
  }

  /* End of Switch: '<S167>/Switch' */

  /* Product: '<S117>/1//R' incorporates:
   *  Constant: '<S117>/Constant5'
   */
  rtb_uR = three_phase_WPT_P.Constant5_Value / rtb_donotdeletethisgain;

  /* Sum: '<S170>/Sum' incorporates:
   *  UnitDelay: '<S170>/Unit Delay'
   */
  three_phase_WPT_B.Sum = rtb_uR - three_phase_WPT_DW.UnitDelay_DSTATE;

  /* S-Function (sfun_spssw_discc_DSS): '<S170>/State-Space' */

  /* Level2 S-Function Block: '<S170>/State-Space' (sfun_spssw_discc_DSS) */
  {
    SimStruct *rts = three_phase_WPT_M->childSfunctions[0];
    sfcnOutputs(rts,0);
  }

  /* Gain: '<S96>/do not delete this gain' incorporates:
   *  Gain: '<S14>/do not delete this gain'
   */
  rtb_donotdeletethisgain = three_phase_WPT_P.donotdeletethisgain_Gain *
    three_phase_WPT_B.StateSpace_o1[29];

  /* Switch: '<S118>/Switch' incorporates:
   *  Gain: '<S12>/do not delete this gain'
   */
  rtb_Switch = three_phase_WPT_P.donotdeletethisgain_Gain_n *
    three_phase_WPT_B.StateSpace_o1[18];

  /* Switch: '<S118>/Switch' incorporates:
   *  Gain: '<S100>/do not delete this gain'
   */
  rtb_Switch = three_phase_WPT_P.donotdeletethisgain_Gain_b *
    three_phase_WPT_B.StateSpace_o1[39];

  /* Gain: '<S96>/do not delete this gain' */
  rtb_donotdeletethisgain = three_phase_WPT_P.donotdeletethisgain_Gain_p *
    three_phase_WPT_B.StateSpace_o1[37];

  /* Math: '<S118>/Math Function' incorporates:
   *  Gain: '<S132>/do not delete this gain'
   */
  rtb_MathFunction = three_phase_WPT_P.donotdeletethisgain_Gain_d *
    three_phase_WPT_B.StateSpace_o1[43];

  /* Sin: '<S4>/Sine Wave' incorporates:
   *  Sin: '<S4>/Sine Wave1'
   *  Sin: '<S4>/Sine Wave2'
   */
  rtb_SineWave_tmp = three_phase_WPT_P.f_motor * 2.0 * 3.1415926535897931 *
    three_phase_WPT_M->Timing.t[0];
  rtb_SineWave = sin(rtb_SineWave_tmp + three_phase_WPT_P.SineWave_Phase) *
    three_phase_WPT_P.ma + three_phase_WPT_P.SineWave_Bias;

  /* Gain: '<S4>/Gain7' incorporates:
   *  Abs: '<S4>/Abs'
   *  Constant: '<S4>/Constant'
   *  Gain: '<S4>/Gain'
   *  Sum: '<S4>/Sum2'
   */
  three_phase_WPT_B.Gain7 = (three_phase_WPT_P.Gain_Gain * fabs(rtb_SineWave) +
    three_phase_WPT_P.Constant_Value) * three_phase_WPT_P.Gain7_Gain;

  /* Math: '<S118>/Math Function' incorporates:
   *  Gain: '<S136>/do not delete this gain'
   */
  rtb_MathFunction = three_phase_WPT_P.donotdeletethisgain_Gain_f *
    three_phase_WPT_B.StateSpace_o1[25];

  /* Math: '<S118>/Math Function' incorporates:
   *  Constant: '<Root>/fsw'
   *  Gain: '<S4>/Gain1'
   *  Gain: '<S4>/Gain2'
   */
  rtb_MathFunction = three_phase_WPT_P.Gain2_Gain * three_phase_WPT_P.fsw_Value *
    three_phase_WPT_P.SampleTime;

  /* Sum: '<S4>/Sum' incorporates:
   *  UnitDelay: '<S4>/Unit Delay'
   */
  rtb_Sum = three_phase_WPT_DW.UnitDelay_DSTATE_i + rtb_MathFunction;

  /* Gain: '<S4>/Gain3' incorporates:
   *  Trigonometry: '<S4>/Asin'
   *  Trigonometry: '<S4>/Sin'
   */
  three_phase_WPT_B.Gain3 = three_phase_WPT_P.Gain3_Gain * asin(sin(rtb_Sum));

  /* Switch: '<S118>/Switch' incorporates:
   *  Constant: '<Root>/fsw_motor'
   *  Gain: '<S4>/Gain4'
   *  Gain: '<S4>/Gain5'
   */
  rtb_Switch = three_phase_WPT_P.Gain5_Gain * three_phase_WPT_P.fsw_motor_Value *
    three_phase_WPT_P.SampleTime;

  /* Sum: '<S4>/Sum1' incorporates:
   *  UnitDelay: '<S4>/Unit Delay1'
   */
  rtb_Sum1 = three_phase_WPT_DW.UnitDelay1_DSTATE + rtb_Switch;

  /* Gain: '<S4>/Gain6' incorporates:
   *  Trigonometry: '<S4>/Asin1'
   *  Trigonometry: '<S4>/Sin1'
   */
  three_phase_WPT_B.Gain6 = three_phase_WPT_P.Gain6_Gain * asin(sin(rtb_Sum1));

  /* RelationalOperator: '<S4>/Relational Operator' */
  rtb_RelationalOperator = (three_phase_WPT_B.Gain3 > rtb_SineWave);

  /* Logic: '<S4>/NOT' */
  three_phase_WPT_B.NOT = !rtb_RelationalOperator;

  /* RelationalOperator: '<S4>/Relational Operator1' incorporates:
   *  Sin: '<S4>/Sine Wave1'
   */
  rtb_RelationalOperator1 = (three_phase_WPT_B.Gain6 > sin(rtb_SineWave_tmp +
    three_phase_WPT_P.SineWave1_Phase) * three_phase_WPT_P.ma +
    three_phase_WPT_P.SineWave1_Bias);

  /* Logic: '<S4>/NOT1' */
  three_phase_WPT_B.NOT1 = !rtb_RelationalOperator1;

  /* RelationalOperator: '<S4>/Relational Operator2' incorporates:
   *  Sin: '<S4>/Sine Wave2'
   */
  rtb_RelationalOperator2 = (three_phase_WPT_B.Gain6 > sin(rtb_SineWave_tmp +
    three_phase_WPT_P.SineWave2_Phase) * three_phase_WPT_P.ma +
    three_phase_WPT_P.SineWave2_Bias);

  /* Logic: '<S4>/NOT2' */
  three_phase_WPT_B.NOT2 = !rtb_RelationalOperator2;

  /* DataTypeConversion: '<S36>/Data Type Conversion' */
  three_phase_WPT_B.DataTypeConversion = rtb_RelationalOperator;

  /* DataTypeConversion: '<S50>/Data Type Conversion' */
  three_phase_WPT_B.DataTypeConversion_j = rtb_RelationalOperator1;

  /* DataTypeConversion: '<S64>/Data Type Conversion' */
  three_phase_WPT_B.DataTypeConversion_p = rtb_RelationalOperator2;

  /* DataTypeConversion: '<S43>/Data Type Conversion' */
  three_phase_WPT_B.DataTypeConversion_m = three_phase_WPT_B.NOT;

  /* DataTypeConversion: '<S57>/Data Type Conversion' */
  three_phase_WPT_B.DataTypeConversion_b = three_phase_WPT_B.NOT1;

  /* DataTypeConversion: '<S71>/Data Type Conversion' */
  three_phase_WPT_B.DataTypeConversion_d = three_phase_WPT_B.NOT2;

  /* Math: '<S118>/Math Function' incorporates:
   *  DigitalClock: '<S118>/Digital Clock'
   */
  rtb_MathFunction = three_phase_WPT_M->Timing.t[1];

  /* Switch: '<S118>/Switch' incorporates:
   *  Constant: '<S118>/Constant'
   */
  if (three_phase_WPT_P.StairGenerator_RepeatPattern >
      three_phase_WPT_P.Switch_Threshold) {
    /* Switch: '<S118>/Switch' incorporates:
     *  Constant: '<S118>/Constant2'
     */
    rtb_Switch = three_phase_WPT_P.Constant2_Value;
  } else {
    /* Switch: '<S118>/Switch' incorporates:
     *  Constant: '<S118>/Constant1'
     */
    rtb_Switch = three_phase_WPT_P.Constant1_Value;
  }

  /* End of Switch: '<S118>/Switch' */

  /* Math: '<S118>/Math Function' */
  rtb_MathFunction = rt_modd_snf(rtb_MathFunction, rtb_Switch);

  /* Matfile logging */
  rt_UpdateTXYLogVars(three_phase_WPT_M->rtwLogInfo,
                      (three_phase_WPT_M->Timing.t));

  /* Update for UnitDelay: '<S170>/Unit Delay' */
  three_phase_WPT_DW.UnitDelay_DSTATE = rtb_uR;

  /* Update for S-Function (sfun_spssw_discc_DSS): '<S170>/State-Space' */
  /* Level2 S-Function Block: '<S170>/State-Space' (sfun_spssw_discc_DSS) */
  {
    SimStruct *rts = three_phase_WPT_M->childSfunctions[0];
    sfcnUpdate(rts,0);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  /* Update for UnitDelay: '<S4>/Unit Delay' */
  three_phase_WPT_DW.UnitDelay_DSTATE_i = rtb_Sum;

  /* Update for UnitDelay: '<S4>/Unit Delay1' */
  three_phase_WPT_DW.UnitDelay1_DSTATE = rtb_Sum1;

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.0s, 0.0s] */
    if ((rtmGetTFinal(three_phase_WPT_M)!=-1) &&
        !((rtmGetTFinal(three_phase_WPT_M)-three_phase_WPT_M->Timing.t[0]) >
          three_phase_WPT_M->Timing.t[0] * (DBL_EPSILON))) {
      rtmSetErrorStatus(three_phase_WPT_M, "Simulation finished");
    }

    if (rtmGetStopRequested(three_phase_WPT_M)) {
      rtmSetErrorStatus(three_phase_WPT_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++three_phase_WPT_M->Timing.clockTick0)) {
    ++three_phase_WPT_M->Timing.clockTickH0;
  }

  three_phase_WPT_M->Timing.t[0] = three_phase_WPT_M->Timing.clockTick0 *
    three_phase_WPT_M->Timing.stepSize0 + three_phase_WPT_M->Timing.clockTickH0 *
    three_phase_WPT_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [1.0E-8s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++three_phase_WPT_M->Timing.clockTick1)) {
      ++three_phase_WPT_M->Timing.clockTickH1;
    }

    three_phase_WPT_M->Timing.t[1] = three_phase_WPT_M->Timing.clockTick1 *
      three_phase_WPT_M->Timing.stepSize1 +
      three_phase_WPT_M->Timing.clockTickH1 *
      three_phase_WPT_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Model initialize function */
void three_phase_WPT_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)three_phase_WPT_M, 0,
                sizeof(RT_MODEL_three_phase_WPT_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&three_phase_WPT_M->solverInfo,
                          &three_phase_WPT_M->Timing.simTimeStep);
    rtsiSetTPtr(&three_phase_WPT_M->solverInfo, &rtmGetTPtr(three_phase_WPT_M));
    rtsiSetStepSizePtr(&three_phase_WPT_M->solverInfo,
                       &three_phase_WPT_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&three_phase_WPT_M->solverInfo, (&rtmGetErrorStatus
      (three_phase_WPT_M)));
    rtsiSetRTModelPtr(&three_phase_WPT_M->solverInfo, three_phase_WPT_M);
  }

  rtsiSetSimTimeStep(&three_phase_WPT_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&three_phase_WPT_M->solverInfo,"FixedStepDiscrete");
  three_phase_WPT_M->solverInfoPtr = (&three_phase_WPT_M->solverInfo);

  /* Initialize timing info */
  {
    int_T *mdlTsMap = three_phase_WPT_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    three_phase_WPT_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    three_phase_WPT_M->Timing.sampleTimes =
      (&three_phase_WPT_M->Timing.sampleTimesArray[0]);
    three_phase_WPT_M->Timing.offsetTimes =
      (&three_phase_WPT_M->Timing.offsetTimesArray[0]);

    /* task periods */
    three_phase_WPT_M->Timing.sampleTimes[0] = (0.0);
    three_phase_WPT_M->Timing.sampleTimes[1] = (1.0E-8);

    /* task offsets */
    three_phase_WPT_M->Timing.offsetTimes[0] = (0.0);
    three_phase_WPT_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(three_phase_WPT_M, &three_phase_WPT_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = three_phase_WPT_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    three_phase_WPT_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(three_phase_WPT_M, 0.2);
  three_phase_WPT_M->Timing.stepSize0 = 1.0E-8;
  three_phase_WPT_M->Timing.stepSize1 = 1.0E-8;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    three_phase_WPT_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(three_phase_WPT_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(three_phase_WPT_M->rtwLogInfo, (NULL));
    rtliSetLogT(three_phase_WPT_M->rtwLogInfo, "tout");
    rtliSetLogX(three_phase_WPT_M->rtwLogInfo, "");
    rtliSetLogXFinal(three_phase_WPT_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(three_phase_WPT_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(three_phase_WPT_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(three_phase_WPT_M->rtwLogInfo, 0);
    rtliSetLogDecimation(three_phase_WPT_M->rtwLogInfo, 1);
    rtliSetLogY(three_phase_WPT_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(three_phase_WPT_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(three_phase_WPT_M->rtwLogInfo, (NULL));
  }

  three_phase_WPT_M->solverInfoPtr = (&three_phase_WPT_M->solverInfo);
  three_phase_WPT_M->Timing.stepSize = (1.0E-8);
  rtsiSetFixedStepSize(&three_phase_WPT_M->solverInfo, 1.0E-8);
  rtsiSetSolverMode(&three_phase_WPT_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  (void) memset(((void *) &three_phase_WPT_B), 0,
                sizeof(B_three_phase_WPT_T));

  /* states (dwork) */
  (void) memset((void *)&three_phase_WPT_DW, 0,
                sizeof(DW_three_phase_WPT_T));

  /* child S-Function registration */
  {
    RTWSfcnInfo *sfcnInfo = &three_phase_WPT_M->NonInlinedSFcns.sfcnInfo;
    three_phase_WPT_M->sfcnInfo = (sfcnInfo);
    rtssSetErrorStatusPtr(sfcnInfo, (&rtmGetErrorStatus(three_phase_WPT_M)));
    rtssSetNumRootSampTimesPtr(sfcnInfo, &three_phase_WPT_M->Sizes.numSampTimes);
    three_phase_WPT_M->NonInlinedSFcns.taskTimePtrs[0] = &(rtmGetTPtr
      (three_phase_WPT_M)[0]);
    three_phase_WPT_M->NonInlinedSFcns.taskTimePtrs[1] = &(rtmGetTPtr
      (three_phase_WPT_M)[1]);
    rtssSetTPtrPtr(sfcnInfo,three_phase_WPT_M->NonInlinedSFcns.taskTimePtrs);
    rtssSetTStartPtr(sfcnInfo, &rtmGetTStart(three_phase_WPT_M));
    rtssSetTFinalPtr(sfcnInfo, &rtmGetTFinal(three_phase_WPT_M));
    rtssSetTimeOfLastOutputPtr(sfcnInfo, &rtmGetTimeOfLastOutput
      (three_phase_WPT_M));
    rtssSetStepSizePtr(sfcnInfo, &three_phase_WPT_M->Timing.stepSize);
    rtssSetStopRequestedPtr(sfcnInfo, &rtmGetStopRequested(three_phase_WPT_M));
    rtssSetDerivCacheNeedsResetPtr(sfcnInfo,
      &three_phase_WPT_M->derivCacheNeedsReset);
    rtssSetZCCacheNeedsResetPtr(sfcnInfo, &three_phase_WPT_M->zCCacheNeedsReset);
    rtssSetContTimeOutputInconsistentWithStateAtMajorStepPtr(sfcnInfo,
      &three_phase_WPT_M->CTOutputIncnstWithState);
    rtssSetSampleHitsPtr(sfcnInfo, &three_phase_WPT_M->Timing.sampleHits);
    rtssSetPerTaskSampleHitsPtr(sfcnInfo,
      &three_phase_WPT_M->Timing.perTaskSampleHits);
    rtssSetSimModePtr(sfcnInfo, &three_phase_WPT_M->simMode);
    rtssSetSolverInfoPtr(sfcnInfo, &three_phase_WPT_M->solverInfoPtr);
  }

  three_phase_WPT_M->Sizes.numSFcns = (1);

  /* register each child */
  {
    (void) memset((void *)&three_phase_WPT_M->NonInlinedSFcns.childSFunctions[0],
                  0,
                  1*sizeof(SimStruct));
    three_phase_WPT_M->childSfunctions =
      (&three_phase_WPT_M->NonInlinedSFcns.childSFunctionPtrs[0]);
    three_phase_WPT_M->childSfunctions[0] =
      (&three_phase_WPT_M->NonInlinedSFcns.childSFunctions[0]);

    /* Level2 S-Function Block: three_phase_WPT/<S170>/State-Space (sfun_spssw_discc_DSS) */
    {
      SimStruct *rts = three_phase_WPT_M->childSfunctions[0];

      /* timing info */
      time_T *sfcnPeriod = three_phase_WPT_M->NonInlinedSFcns.Sfcn0.sfcnPeriod;
      time_T *sfcnOffset = three_phase_WPT_M->NonInlinedSFcns.Sfcn0.sfcnOffset;
      int_T *sfcnTsMap = three_phase_WPT_M->NonInlinedSFcns.Sfcn0.sfcnTsMap;
      (void) memset((void*)sfcnPeriod, 0,
                    sizeof(time_T)*1);
      (void) memset((void*)sfcnOffset, 0,
                    sizeof(time_T)*1);
      ssSetSampleTimePtr(rts, &sfcnPeriod[0]);
      ssSetOffsetTimePtr(rts, &sfcnOffset[0]);
      ssSetSampleTimeTaskIDPtr(rts, sfcnTsMap);

      {
        ssSetBlkInfo2Ptr(rts, &three_phase_WPT_M->NonInlinedSFcns.blkInfo2[0]);
      }

      _ssSetBlkInfo2PortInfo2Ptr(rts,
        &three_phase_WPT_M->NonInlinedSFcns.inputOutputPortInfo2[0]);

      /* Set up the mdlInfo pointer */
      ssSetRTWSfcnInfo(rts, three_phase_WPT_M->sfcnInfo);

      /* Allocate memory of model methods 2 */
      {
        ssSetModelMethods2(rts, &three_phase_WPT_M->NonInlinedSFcns.methods2[0]);
      }

      /* Allocate memory of model methods 3 */
      {
        ssSetModelMethods3(rts, &three_phase_WPT_M->NonInlinedSFcns.methods3[0]);
      }

      /* Allocate memory of model methods 4 */
      {
        ssSetModelMethods4(rts, &three_phase_WPT_M->NonInlinedSFcns.methods4[0]);
      }

      /* Allocate memory for states auxilliary information */
      {
        ssSetStatesInfo2(rts, &three_phase_WPT_M->NonInlinedSFcns.statesInfo2[0]);
        ssSetPeriodicStatesInfo(rts,
          &three_phase_WPT_M->NonInlinedSFcns.periodicStatesInfo[0]);
      }

      /* inputs */
      {
        _ssSetNumInputPorts(rts, 3);
        ssSetPortInfoForInputs(rts,
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.inputPortInfo[0]);
        _ssSetPortInfo2ForInputUnits(rts,
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.inputPortUnits[0]);
        ssSetInputPortUnit(rts, 0, 0);
        ssSetInputPortUnit(rts, 1, 0);
        ssSetInputPortUnit(rts, 2, 0);
        _ssSetPortInfo2ForInputCoSimAttribute(rts,
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.inputPortCoSimAttribute[0]);
        ssSetInputPortIsContinuousQuantity(rts, 0, 0);
        ssSetInputPortIsContinuousQuantity(rts, 1, 0);
        ssSetInputPortIsContinuousQuantity(rts, 2, 0);

        /* port 0 */
        {
          real_T const **sfcnUPtrs = (real_T const **)
            &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.UPtrs0;

          {
            int_T i1;
            const real_T *u0 = &three_phase_WPT_B.SwitchCurrents[0];
            for (i1=0; i1 < 18; i1++) {
              sfcnUPtrs[i1] = &u0[i1];
            }

            sfcnUPtrs[18] = &three_phase_WPT_B.DC;
            sfcnUPtrs[19] = &three_phase_WPT_B.eee;
            sfcnUPtrs[20] = &three_phase_WPT_B.eee_f;
            sfcnUPtrs[21] = &three_phase_WPT_B.eee_e;
            sfcnUPtrs[22] = &three_phase_WPT_B.eee_n;
            sfcnUPtrs[23] = &three_phase_WPT_B.eee_c;
            sfcnUPtrs[24] = &three_phase_WPT_B.eee_cv;
            sfcnUPtrs[25] = ((const real_T*) &three_phase_WPT_RGND);
          }

          ssSetInputPortSignalPtrs(rts, 0, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 0, 1);
          ssSetInputPortWidth(rts, 0, 26);
        }

        /* port 1 */
        {
          real_T const **sfcnUPtrs = (real_T const **)
            &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.UPtrs1;
          sfcnUPtrs[0] = &three_phase_WPT_B.DataTypeConversion;
          sfcnUPtrs[1] = &three_phase_WPT_B.DataTypeConversion_m;
          sfcnUPtrs[2] = &three_phase_WPT_B.DataTypeConversion_j;
          sfcnUPtrs[3] = &three_phase_WPT_B.DataTypeConversion_b;
          sfcnUPtrs[4] = &three_phase_WPT_B.DataTypeConversion_p;
          sfcnUPtrs[5] = &three_phase_WPT_B.DataTypeConversion_d;
          sfcnUPtrs[6] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[7] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[8] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[9] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[10] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[11] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[12] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[13] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[14] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[15] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[16] = ((const real_T*) &three_phase_WPT_RGND);
          sfcnUPtrs[17] = ((const real_T*) &three_phase_WPT_RGND);
          ssSetInputPortSignalPtrs(rts, 1, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 1, 1);
          ssSetInputPortWidth(rts, 1, 18);
        }

        /* port 2 */
        {
          real_T const **sfcnUPtrs = (real_T const **)
            &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.UPtrs2;
          sfcnUPtrs[0] = &three_phase_WPT_B.Sum;
          ssSetInputPortSignalPtrs(rts, 2, (InputPtrsType)&sfcnUPtrs[0]);
          _ssSetInputPortNumDimensions(rts, 2, 1);
          ssSetInputPortWidth(rts, 2, 1);
        }
      }

      /* outputs */
      {
        ssSetPortInfoForOutputs(rts,
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.outputPortInfo[0]);
        _ssSetNumOutputPorts(rts, 3);
        _ssSetPortInfo2ForOutputUnits(rts,
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.outputPortUnits[0]);
        ssSetOutputPortUnit(rts, 0, 0);
        ssSetOutputPortUnit(rts, 1, 0);
        ssSetOutputPortUnit(rts, 2, 0);
        _ssSetPortInfo2ForOutputCoSimAttribute(rts,
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.outputPortCoSimAttribute[0]);
        ssSetOutputPortIsContinuousQuantity(rts, 0, 0);
        ssSetOutputPortIsContinuousQuantity(rts, 1, 0);
        ssSetOutputPortIsContinuousQuantity(rts, 2, 0);

        /* port 0 */
        {
          _ssSetOutputPortNumDimensions(rts, 0, 1);
          ssSetOutputPortWidth(rts, 0, 47);
          ssSetOutputPortSignal(rts, 0, ((real_T *)
            three_phase_WPT_B.StateSpace_o1));
        }

        /* port 1 */
        {
          _ssSetOutputPortNumDimensions(rts, 1, 1);
          ssSetOutputPortWidth(rts, 1, 18);
          ssSetOutputPortSignal(rts, 1, ((real_T *)
            three_phase_WPT_B.StateSpace_o2));
        }

        /* port 2 */
        {
          _ssSetOutputPortNumDimensions(rts, 2, 1);
          ssSetOutputPortWidth(rts, 2, 1);
          ssSetOutputPortSignal(rts, 2, ((real_T *)
            &three_phase_WPT_B.StateSpace_o3));
        }
      }

      /* states */
      ssSetDiscStates(rts, (real_T *) &three_phase_WPT_DW.StateSpace_DSTATE[0]);

      /* path info */
      ssSetModelName(rts, "State-Space");
      ssSetPath(rts, "three_phase_WPT/powergui/EquivalentModel1/State-Space");
      ssSetRTModel(rts,three_phase_WPT_M);
      ssSetParentSS(rts, (NULL));
      ssSetRootSS(rts, rts);
      ssSetVersion(rts, SIMSTRUCT_VERSION_LEVEL2);

      /* parameters */
      {
        mxArray **sfcnParams = (mxArray **)
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.params;
        ssSetSFcnParamsCount(rts, 24);
        ssSetSFcnParamsPtr(rts, &sfcnParams[0]);
        ssSetSFcnParam(rts, 0, (mxArray*)three_phase_WPT_P.StateSpace_P1_Size);
        ssSetSFcnParam(rts, 1, (mxArray*)three_phase_WPT_P.StateSpace_P2_Size);
        ssSetSFcnParam(rts, 2, (mxArray*)three_phase_WPT_P.StateSpace_P3_Size);
        ssSetSFcnParam(rts, 3, (mxArray*)three_phase_WPT_P.StateSpace_P4_Size);
        ssSetSFcnParam(rts, 4, (mxArray*)three_phase_WPT_P.StateSpace_P5_Size);
        ssSetSFcnParam(rts, 5, (mxArray*)three_phase_WPT_P.StateSpace_P6_Size);
        ssSetSFcnParam(rts, 6, (mxArray*)three_phase_WPT_P.StateSpace_P7_Size);
        ssSetSFcnParam(rts, 7, (mxArray*)three_phase_WPT_P.StateSpace_P8_Size);
        ssSetSFcnParam(rts, 8, (mxArray*)three_phase_WPT_P.StateSpace_P9_Size);
        ssSetSFcnParam(rts, 9, (mxArray*)three_phase_WPT_P.StateSpace_P10_Size);
        ssSetSFcnParam(rts, 10, (mxArray*)three_phase_WPT_P.StateSpace_P11_Size);
        ssSetSFcnParam(rts, 11, (mxArray*)three_phase_WPT_P.StateSpace_P12_Size);
        ssSetSFcnParam(rts, 12, (mxArray*)three_phase_WPT_P.StateSpace_P13_Size);
        ssSetSFcnParam(rts, 13, (mxArray*)three_phase_WPT_P.StateSpace_P14_Size);
        ssSetSFcnParam(rts, 14, (mxArray*)three_phase_WPT_P.StateSpace_P15_Size);
        ssSetSFcnParam(rts, 15, (mxArray*)three_phase_WPT_P.StateSpace_P16_Size);
        ssSetSFcnParam(rts, 16, (mxArray*)three_phase_WPT_P.StateSpace_P17_Size);
        ssSetSFcnParam(rts, 17, (mxArray*)three_phase_WPT_P.StateSpace_P18_Size);
        ssSetSFcnParam(rts, 18, (mxArray*)three_phase_WPT_P.StateSpace_P19_Size);
        ssSetSFcnParam(rts, 19, (mxArray*)three_phase_WPT_P.StateSpace_P20_Size);
        ssSetSFcnParam(rts, 20, (mxArray*)three_phase_WPT_P.StateSpace_P21_Size);
        ssSetSFcnParam(rts, 21, (mxArray*)three_phase_WPT_P.StateSpace_P22_Size);
        ssSetSFcnParam(rts, 22, (mxArray*)three_phase_WPT_P.StateSpace_P23_Size);
        ssSetSFcnParam(rts, 23, (mxArray*)three_phase_WPT_P.StateSpace_P24_Size);
      }

      /* work vectors */
      ssSetRWork(rts, (real_T *) &three_phase_WPT_DW.StateSpace_RWORK);
      ssSetIWork(rts, (int_T *) &three_phase_WPT_DW.StateSpace_IWORK[0]);
      ssSetPWork(rts, (void **) &three_phase_WPT_DW.StateSpace_PWORK[0]);

      {
        struct _ssDWorkRecord *dWorkRecord = (struct _ssDWorkRecord *)
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.dWork;
        struct _ssDWorkAuxRecord *dWorkAuxRecord = (struct _ssDWorkAuxRecord *)
          &three_phase_WPT_M->NonInlinedSFcns.Sfcn0.dWorkAux;
        ssSetSFcnDWork(rts, dWorkRecord);
        ssSetSFcnDWorkAux(rts, dWorkAuxRecord);
        _ssSetNumDWork(rts, 4);

        /* RWORK */
        ssSetDWorkWidth(rts, 0, 1);
        ssSetDWorkDataType(rts, 0,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 0, 0);
        ssSetDWork(rts, 0, &three_phase_WPT_DW.StateSpace_RWORK);

        /* IWORK */
        ssSetDWorkWidth(rts, 1, 12);
        ssSetDWorkDataType(rts, 1,SS_INTEGER);
        ssSetDWorkComplexSignal(rts, 1, 0);
        ssSetDWork(rts, 1, &three_phase_WPT_DW.StateSpace_IWORK[0]);

        /* PWORK */
        ssSetDWorkWidth(rts, 2, 65);
        ssSetDWorkDataType(rts, 2,SS_POINTER);
        ssSetDWorkComplexSignal(rts, 2, 0);
        ssSetDWork(rts, 2, &three_phase_WPT_DW.StateSpace_PWORK[0]);

        /* DSTATE */
        ssSetDWorkWidth(rts, 3, 28);
        ssSetDWorkDataType(rts, 3,SS_DOUBLE);
        ssSetDWorkComplexSignal(rts, 3, 0);
        ssSetDWorkUsedAsDState(rts, 3, 1);
        ssSetDWork(rts, 3, &three_phase_WPT_DW.StateSpace_DSTATE[0]);
      }

      /* registration */
      sfun_spssw_discc_DSS(rts);
      sfcnInitializeSizes(rts);
      sfcnInitializeSampleTimes(rts);

      /* adjust sample time */
      ssSetSampleTime(rts, 0, 1.0E-8);
      ssSetOffsetTime(rts, 0, 0.0);
      sfcnTsMap[0] = 1;

      /* set compiled values of dynamic vector attributes */
      ssSetNumNonsampledZCs(rts, 0);

      /* Update connectivity flags for each port */
      _ssSetInputPortConnected(rts, 0, 1);
      _ssSetInputPortConnected(rts, 1, 1);
      _ssSetInputPortConnected(rts, 2, 1);
      _ssSetOutputPortConnected(rts, 0, 1);
      _ssSetOutputPortConnected(rts, 1, 1);
      _ssSetOutputPortConnected(rts, 2, 1);
      _ssSetOutputPortBeingMerged(rts, 0, 0);
      _ssSetOutputPortBeingMerged(rts, 1, 0);
      _ssSetOutputPortBeingMerged(rts, 2, 0);

      /* Update the BufferDstPort flags for each input port */
      ssSetInputPortBufferDstPort(rts, 0, -1);
      ssSetInputPortBufferDstPort(rts, 1, -1);
      ssSetInputPortBufferDstPort(rts, 2, -1);
    }
  }

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(three_phase_WPT_M->rtwLogInfo, 0.0,
    rtmGetTFinal(three_phase_WPT_M), three_phase_WPT_M->Timing.stepSize0,
    (&rtmGetErrorStatus(three_phase_WPT_M)));

  /* Start for S-Function (sfun_spssw_discc_DSS): '<S170>/State-Space' */
  /* Level2 S-Function Block: '<S170>/State-Space' (sfun_spssw_discc_DSS) */
  {
    SimStruct *rts = three_phase_WPT_M->childSfunctions[0];
    sfcnStart(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  /* InitializeConditions for UnitDelay: '<S170>/Unit Delay' */
  three_phase_WPT_DW.UnitDelay_DSTATE =
    three_phase_WPT_P.UnitDelay_InitialCondition;

  /* InitializeConditions for S-Function (sfun_spssw_discc_DSS): '<S170>/State-Space' */
  /* Level2 S-Function Block: '<S170>/State-Space' (sfun_spssw_discc_DSS) */
  {
    SimStruct *rts = three_phase_WPT_M->childSfunctions[0];
    sfcnInitializeConditions(rts);
    if (ssGetErrorStatus(rts) != (NULL))
      return;
  }

  /* InitializeConditions for UnitDelay: '<S4>/Unit Delay' */
  three_phase_WPT_DW.UnitDelay_DSTATE_i =
    three_phase_WPT_P.UnitDelay_InitialCondition_j;

  /* InitializeConditions for UnitDelay: '<S4>/Unit Delay1' */
  three_phase_WPT_DW.UnitDelay1_DSTATE =
    three_phase_WPT_P.UnitDelay1_InitialCondition;
}

/* Model terminate function */
void three_phase_WPT_terminate(void)
{
  /* Terminate for S-Function (sfun_spssw_discc_DSS): '<S170>/State-Space' */
  /* Level2 S-Function Block: '<S170>/State-Space' (sfun_spssw_discc_DSS) */
  {
    SimStruct *rts = three_phase_WPT_M->childSfunctions[0];
    sfcnTerminate(rts);
  }
}
