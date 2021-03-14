/*
 * three_phase_WPT.h
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

#ifndef RTW_HEADER_three_phase_WPT_h_
#define RTW_HEADER_three_phase_WPT_h_
#include <stddef.h>
#include <string.h>
#include <float.h>
#include <math.h>
#ifndef three_phase_WPT_COMMON_INCLUDES_
#define three_phase_WPT_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "rt_logging.h"
#endif                                 /* three_phase_WPT_COMMON_INCLUDES_ */

#include "three_phase_WPT_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rt_nonfinite.h"
#include "rtGetInf.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm) ((rtm)->CTOutputIncnstWithState)
#endif

#ifndef rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm, val) ((rtm)->CTOutputIncnstWithState = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
#define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
#define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWLogInfo
#define rtmGetRTWLogInfo(rtm)          ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetSampleHitArray
#define rtmGetSampleHitArray(rtm)      ((rtm)->Timing.sampleHitArray)
#endif

#ifndef rtmGetStepSize
#define rtmGetStepSize(rtm)            ((rtm)->Timing.stepSize)
#endif

#ifndef rtmGetZCCacheNeedsReset
#define rtmGetZCCacheNeedsReset(rtm)   ((rtm)->zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
#define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->zCCacheNeedsReset = (val))
#endif

#ifndef rtmGet_TimeOfLastOutput
#define rtmGet_TimeOfLastOutput(rtm)   ((rtm)->Timing.timeOfLastOutput)
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                ((rtm)->Timing.t)
#endif

#ifndef rtmGetTStart
#define rtmGetTStart(rtm)              ((rtm)->Timing.tStart)
#endif

#ifndef rtmGetTimeOfLastOutput
#define rtmGetTimeOfLastOutput(rtm)    ((rtm)->Timing.timeOfLastOutput)
#endif

/* Block signals (default storage) */
typedef struct {
  real_T SwitchCurrents[18];           /* '<S174>/SwitchCurrents' */
  real_T DC;                           /* '<S11>/DC' */
  real_T eee;                          /* '<S144>/eee' */
  real_T eee_f;                        /* '<S146>/eee' */
  real_T eee_e;                        /* '<S148>/eee' */
  real_T eee_n;                        /* '<S150>/eee' */
  real_T eee_c;                        /* '<S152>/eee' */
  real_T eee_cv;                       /* '<S154>/eee' */
  real_T Sum;                          /* '<S170>/Sum' */
  real_T StateSpace_o1[47];            /* '<S170>/State-Space' */
  real_T StateSpace_o2[18];            /* '<S170>/State-Space' */
  real_T StateSpace_o3;                /* '<S170>/State-Space' */
  real_T Gain7;                        /* '<S4>/Gain7' */
  real_T Gain3;                        /* '<S4>/Gain3' */
  real_T Gain6;                        /* '<S4>/Gain6' */
  real_T DataTypeConversion;           /* '<S36>/Data Type Conversion' */
  real_T DataTypeConversion_j;         /* '<S50>/Data Type Conversion' */
  real_T DataTypeConversion_p;         /* '<S64>/Data Type Conversion' */
  real_T DataTypeConversion_m;         /* '<S43>/Data Type Conversion' */
  real_T DataTypeConversion_b;         /* '<S57>/Data Type Conversion' */
  real_T DataTypeConversion_d;         /* '<S71>/Data Type Conversion' */
  boolean_T NOT;                       /* '<S4>/NOT' */
  boolean_T NOT1;                      /* '<S4>/NOT1' */
  boolean_T NOT2;                      /* '<S4>/NOT2' */
} B_three_phase_WPT_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T UnitDelay_DSTATE;             /* '<S170>/Unit Delay' */
  real_T StateSpace_DSTATE[28];        /* '<S170>/State-Space' */
  real_T UnitDelay_DSTATE_i;           /* '<S4>/Unit Delay' */
  real_T UnitDelay1_DSTATE;            /* '<S4>/Unit Delay1' */
  real_T StateSpace_RWORK;             /* '<S170>/State-Space' */
  void *StateSpace_PWORK[65];          /* '<S170>/State-Space' */
  int_T StateSpace_IWORK[12];          /* '<S170>/State-Space' */
} DW_three_phase_WPT_T;

/* Parameters (default storage) */
struct P_three_phase_WPT_T_ {
  real_T RL;                           /* Variable: RL
                                        * Referenced by: '<S6>/Constant'
                                        */
  real_T SampleTime;                   /* Variable: SampleTime
                                        * Referenced by:
                                        *   '<S4>/Gain1'
                                        *   '<S4>/Gain4'
                                        */
  real_T Tfinal;                       /* Variable: Tfinal
                                        * Referenced by: '<S118>/Time'
                                        */
  real_T VDC;                          /* Variable: VDC
                                        * Referenced by: '<S11>/DC'
                                        */
  real_T f_motor;                      /* Variable: f_motor
                                        * Referenced by:
                                        *   '<S4>/Sine Wave'
                                        *   '<S4>/Sine Wave1'
                                        *   '<S4>/Sine Wave2'
                                        */
  real_T ma;                           /* Variable: ma
                                        * Referenced by:
                                        *   '<S4>/Sine Wave'
                                        *   '<S4>/Sine Wave1'
                                        *   '<S4>/Sine Wave2'
                                        */
  real_T VariableResistor_Rabsmin;   /* Mask Parameter: VariableResistor_Rabsmin
                                      * Referenced by:
                                      *   '<S167>/Constant'
                                      *   '<S167>/Constant1'
                                      *   '<S167>/Switch'
                                      */
  real_T StairGenerator_RepeatPattern;
                                 /* Mask Parameter: StairGenerator_RepeatPattern
                                  * Referenced by: '<S118>/Constant'
                                  */
  boolean_T DetectFallNonpositive_vinit;
                                  /* Mask Parameter: DetectFallNonpositive_vinit
                                   * Referenced by: '<S120>/Delay Input1'
                                   */
  real_T Constant2_Value;              /* Expression: TimeInput( end )
                                        * Referenced by: '<S118>/Constant2'
                                        */
  real_T Constant1_Value;              /* Expression: 0
                                        * Referenced by: '<S118>/Constant1'
                                        */
  real_T Switch1_Threshold;            /* Expression: 0
                                        * Referenced by: '<S167>/Switch1'
                                        */
  real_T SwitchCurrents_Value[18];     /* Expression: zeros(18,1)
                                        * Referenced by: '<S174>/SwitchCurrents'
                                        */
  real_T eee_Value;                    /* Expression: Vf
                                        * Referenced by: '<S144>/eee'
                                        */
  real_T eee_Value_p;                  /* Expression: Vf
                                        * Referenced by: '<S146>/eee'
                                        */
  real_T eee_Value_m;                  /* Expression: Vf
                                        * Referenced by: '<S148>/eee'
                                        */
  real_T eee_Value_k;                  /* Expression: Vf
                                        * Referenced by: '<S150>/eee'
                                        */
  real_T eee_Value_j;                  /* Expression: Vf
                                        * Referenced by: '<S152>/eee'
                                        */
  real_T eee_Value_i;                  /* Expression: Vf
                                        * Referenced by: '<S154>/eee'
                                        */
  real_T Constant5_Value;              /* Expression: 1
                                        * Referenced by: '<S117>/Constant5'
                                        */
  real_T UnitDelay_InitialCondition;   /* Expression: 0
                                        * Referenced by: '<S170>/Unit Delay'
                                        */
  real_T StateSpace_P1_Size[2];        /* Computed Parameter: StateSpace_P1_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P1;                /* Expression: S.Ts
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P2_Size[2];        /* Computed Parameter: StateSpace_P2_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P2[784];           /* Expression: S.A
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P3_Size[2];        /* Computed Parameter: StateSpace_P3_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P3[728];           /* Expression: S.B
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P4_Size[2];        /* Computed Parameter: StateSpace_P4_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P4[1316];          /* Expression: S.C
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P5_Size[2];        /* Computed Parameter: StateSpace_P5_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P5[1222];          /* Expression: S.D
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P6_Size[2];        /* Computed Parameter: StateSpace_P6_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P6[28];            /* Expression: S.x0
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P7_Size[2];        /* Computed Parameter: StateSpace_P7_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P7;                /* Expression: S.EnableUseOfTLC
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P8_Size[2];        /* Computed Parameter: StateSpace_P8_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P8[3];             /* Expression: S.NonLinearDim
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P9_Size[2];        /* Computed Parameter: StateSpace_P9_Size
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P10_Size[2];      /* Computed Parameter: StateSpace_P10_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P10;               /* Expression: S.NonLinear_Inputs
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P11_Size[2];      /* Computed Parameter: StateSpace_P11_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P11;               /* Expression: S.NonLinear_Outputs
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P12_Size[2];      /* Computed Parameter: StateSpace_P12_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P13_Size[2];      /* Computed Parameter: StateSpace_P13_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P13;               /* Expression: S.NonLinearIterative
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P14_Size[2];      /* Computed Parameter: StateSpace_P14_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P14;               /* Expression: S.NonLinear_SizeVI
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P15_Size[2];      /* Computed Parameter: StateSpace_P15_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P16_Size[2];      /* Computed Parameter: StateSpace_P16_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P16;               /* Expression: S.NonLinear_Method
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P17_Size[2];      /* Computed Parameter: StateSpace_P17_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P17;               /* Expression: S.Nonlinear_Tolerance
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P18_Size[2];      /* Computed Parameter: StateSpace_P18_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P18;               /* Expression: double(nMaxIteration)
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P19_Size[2];      /* Computed Parameter: StateSpace_P19_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P19;           /* Expression: double(ContinueOnMaxIteration)
                                    * Referenced by: '<S170>/State-Space'
                                    */
  real_T StateSpace_P20_Size[2];      /* Computed Parameter: StateSpace_P20_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P20[18];           /* Expression: S.SwitchResistance
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P21_Size[2];      /* Computed Parameter: StateSpace_P21_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P21[18];           /* Expression: S.SwitchType
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P22_Size[2];      /* Computed Parameter: StateSpace_P22_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P22[18];           /* Expression: S.SwitchGateInitialValue
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P23_Size[2];      /* Computed Parameter: StateSpace_P23_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P23[18];           /* Expression: S.OutputsToResetToZero
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T StateSpace_P24_Size[2];      /* Computed Parameter: StateSpace_P24_Size
                                       * Referenced by: '<S170>/State-Space'
                                       */
  real_T StateSpace_P24;               /* Expression: double(S.TBEON)
                                        * Referenced by: '<S170>/State-Space'
                                        */
  real_T donotdeletethisgain_Gain;     /* Expression: 1
                                        * Referenced by: '<S14>/do not delete this gain'
                                        */
  real_T donotdeletethisgain_Gain_n;   /* Expression: 1
                                        * Referenced by: '<S12>/do not delete this gain'
                                        */
  real_T donotdeletethisgain_Gain_b;   /* Expression: 1
                                        * Referenced by: '<S100>/do not delete this gain'
                                        */
  real_T donotdeletethisgain_Gain_p;   /* Expression: 1
                                        * Referenced by: '<S96>/do not delete this gain'
                                        */
  real_T donotdeletethisgain_Gain_d;   /* Expression: 1
                                        * Referenced by: '<S132>/do not delete this gain'
                                        */
  real_T Constant_Value;               /* Expression: 100
                                        * Referenced by: '<S4>/Constant'
                                        */
  real_T SineWave_Bias;                /* Expression: 0
                                        * Referenced by: '<S4>/Sine Wave'
                                        */
  real_T SineWave_Phase;               /* Expression: 0
                                        * Referenced by: '<S4>/Sine Wave'
                                        */
  real_T Gain_Gain;                    /* Expression: -22.5
                                        * Referenced by: '<S4>/Gain'
                                        */
  real_T Gain7_Gain;                   /* Expression: 1000
                                        * Referenced by: '<S4>/Gain7'
                                        */
  real_T donotdeletethisgain_Gain_f;   /* Expression: 1
                                        * Referenced by: '<S136>/do not delete this gain'
                                        */
  real_T UnitDelay_InitialCondition_j; /* Expression: 0
                                        * Referenced by: '<S4>/Unit Delay'
                                        */
  real_T fsw_Value;                    /* Expression: 80e3
                                        * Referenced by: '<Root>/fsw'
                                        */
  real_T Gain2_Gain;                   /* Expression: 2*pi
                                        * Referenced by: '<S4>/Gain2'
                                        */
  real_T Gain3_Gain;                   /* Expression: 2/pi
                                        * Referenced by: '<S4>/Gain3'
                                        */
  real_T UnitDelay1_InitialCondition;  /* Expression: 0
                                        * Referenced by: '<S4>/Unit Delay1'
                                        */
  real_T fsw_motor_Value;              /* Expression: 80e3
                                        * Referenced by: '<Root>/fsw_motor'
                                        */
  real_T Gain5_Gain;                   /* Expression: 2*pi
                                        * Referenced by: '<S4>/Gain5'
                                        */
  real_T Gain6_Gain;                   /* Expression: 2/pi
                                        * Referenced by: '<S4>/Gain6'
                                        */
  real_T SineWave1_Bias;               /* Expression: 0
                                        * Referenced by: '<S4>/Sine Wave1'
                                        */
  real_T SineWave1_Phase;              /* Expression: -2*pi/3
                                        * Referenced by: '<S4>/Sine Wave1'
                                        */
  real_T SineWave2_Bias;               /* Expression: 0
                                        * Referenced by: '<S4>/Sine Wave2'
                                        */
  real_T SineWave2_Phase;              /* Expression: 2*pi/3
                                        * Referenced by: '<S4>/Sine Wave2'
                                        */
  real_T Switch_Threshold;             /* Expression: 0
                                        * Referenced by: '<S118>/Switch'
                                        */
  int8_T Index_Y0;                     /* Computed Parameter: Index_Y0
                                        * Referenced by: '<S119>/Index'
                                        */
  uint8_T Constant_Value_k;            /* Computed Parameter: Constant_Value_k
                                        * Referenced by: '<S121>/Constant'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_three_phase_WPT_T {
  struct SimStruct_tag * *childSfunctions;
  const char_T *errorStatus;
  SS_SimMode simMode;
  RTWLogInfo *rtwLogInfo;
  RTWSolverInfo solverInfo;
  RTWSolverInfo *solverInfoPtr;
  void *sfcnInfo;

  /*
   * NonInlinedSFcns:
   * The following substructure contains information regarding
   * non-inlined s-functions used in the model.
   */
  struct {
    RTWSfcnInfo sfcnInfo;
    time_T *taskTimePtrs[2];
    SimStruct childSFunctions[1];
    SimStruct *childSFunctionPtrs[1];
    struct _ssBlkInfo2 blkInfo2[1];
    struct _ssSFcnModelMethods2 methods2[1];
    struct _ssSFcnModelMethods3 methods3[1];
    struct _ssSFcnModelMethods4 methods4[1];
    struct _ssStatesInfo2 statesInfo2[1];
    ssPeriodicStatesInfo periodicStatesInfo[1];
    struct _ssPortInfo2 inputOutputPortInfo2[1];
    struct {
      time_T sfcnPeriod[1];
      time_T sfcnOffset[1];
      int_T sfcnTsMap[1];
      struct _ssPortInputs inputPortInfo[3];
      struct _ssInPortUnit inputPortUnits[3];
      struct _ssInPortCoSimAttribute inputPortCoSimAttribute[3];
      real_T const *UPtrs0[26];
      real_T const *UPtrs1[18];
      real_T const *UPtrs2[1];
      struct _ssPortOutputs outputPortInfo[3];
      struct _ssOutPortUnit outputPortUnits[3];
      struct _ssOutPortCoSimAttribute outputPortCoSimAttribute[3];
      uint_T attribs[24];
      mxArray *params[24];
      struct _ssDWorkRecord dWork[4];
      struct _ssDWorkAuxRecord dWorkAux[4];
    } Sfcn0;
  } NonInlinedSFcns;

  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T options;
    int_T numContStates;
    int_T numU;
    int_T numY;
    int_T numSampTimes;
    int_T numBlocks;
    int_T numBlockIO;
    int_T numBlockPrms;
    int_T numDwork;
    int_T numSFcnPrms;
    int_T numSFcns;
    int_T numIports;
    int_T numOports;
    int_T numNonSampZCs;
    int_T sysDirFeedThru;
    int_T rtwGenSfcn;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T stepSize;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    time_T stepSize1;
    time_T tStart;
    time_T tFinal;
    time_T timeOfLastOutput;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *sampleTimes;
    time_T *offsetTimes;
    int_T *sampleTimeTaskIDPtr;
    int_T *sampleHits;
    int_T *perTaskSampleHits;
    time_T *t;
    time_T sampleTimesArray[2];
    time_T offsetTimesArray[2];
    int_T sampleTimeTaskIDArray[2];
    int_T sampleHitArray[2];
    int_T perTaskSampleHitsArray[4];
    time_T tArray[2];
  } Timing;
};

/* Block parameters (default storage) */
extern P_three_phase_WPT_T three_phase_WPT_P;

/* Block signals (default storage) */
extern B_three_phase_WPT_T three_phase_WPT_B;

/* Block states (default storage) */
extern DW_three_phase_WPT_T three_phase_WPT_DW;

/* External data declarations for dependent source files */
extern const real_T three_phase_WPT_RGND;/* real_T ground */

/* Model entry point functions */
extern void three_phase_WPT_initialize(void);
extern void three_phase_WPT_step(void);
extern void three_phase_WPT_terminate(void);

/* Real-time Model object */
extern RT_MODEL_three_phase_WPT_T *const three_phase_WPT_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'three_phase_WPT'
 * '<S1>'   : 'three_phase_WPT/DC-Supply'
 * '<S2>'   : 'three_phase_WPT/Full-Bridge'
 * '<S3>'   : 'three_phase_WPT/MOTOR'
 * '<S4>'   : 'three_phase_WPT/PWM Block'
 * '<S5>'   : 'three_phase_WPT/Subsystem13'
 * '<S6>'   : 'three_phase_WPT/WPT'
 * '<S7>'   : 'three_phase_WPT/powergui'
 * '<S8>'   : 'three_phase_WPT/DC-Supply/DC Voltage Source'
 * '<S9>'   : 'three_phase_WPT/DC-Supply/Subsystem6'
 * '<S10>'  : 'three_phase_WPT/DC-Supply/Subsystem7'
 * '<S11>'  : 'three_phase_WPT/DC-Supply/DC Voltage Source/Model'
 * '<S12>'  : 'three_phase_WPT/DC-Supply/Subsystem6/Voltage Measurement'
 * '<S13>'  : 'three_phase_WPT/DC-Supply/Subsystem6/Voltage Measurement/Model'
 * '<S14>'  : 'three_phase_WPT/DC-Supply/Subsystem7/Current Measurement'
 * '<S15>'  : 'three_phase_WPT/DC-Supply/Subsystem7/Current Measurement/Model'
 * '<S16>'  : 'three_phase_WPT/Full-Bridge/Mosfet'
 * '<S17>'  : 'three_phase_WPT/Full-Bridge/Mosfet1'
 * '<S18>'  : 'three_phase_WPT/Full-Bridge/Mosfet2'
 * '<S19>'  : 'three_phase_WPT/Full-Bridge/Mosfet3'
 * '<S20>'  : 'three_phase_WPT/Full-Bridge/Mosfet4'
 * '<S21>'  : 'three_phase_WPT/Full-Bridge/Mosfet5'
 * '<S22>'  : 'three_phase_WPT/Full-Bridge/Subsystem'
 * '<S23>'  : 'three_phase_WPT/Full-Bridge/Subsystem1'
 * '<S24>'  : 'three_phase_WPT/Full-Bridge/Subsystem12'
 * '<S25>'  : 'three_phase_WPT/Full-Bridge/Subsystem13'
 * '<S26>'  : 'three_phase_WPT/Full-Bridge/Subsystem2'
 * '<S27>'  : 'three_phase_WPT/Full-Bridge/Subsystem3'
 * '<S28>'  : 'three_phase_WPT/Full-Bridge/Subsystem4'
 * '<S29>'  : 'three_phase_WPT/Full-Bridge/Subsystem8'
 * '<S30>'  : 'three_phase_WPT/Full-Bridge/Subsystem9'
 * '<S31>'  : 'three_phase_WPT/Full-Bridge/Mosfet/Diode'
 * '<S32>'  : 'three_phase_WPT/Full-Bridge/Mosfet/Ideal Switch'
 * '<S33>'  : 'three_phase_WPT/Full-Bridge/Mosfet/Measurement list'
 * '<S34>'  : 'three_phase_WPT/Full-Bridge/Mosfet/Diode/Model'
 * '<S35>'  : 'three_phase_WPT/Full-Bridge/Mosfet/Diode/Model/Measurement list'
 * '<S36>'  : 'three_phase_WPT/Full-Bridge/Mosfet/Ideal Switch/Model'
 * '<S37>'  : 'three_phase_WPT/Full-Bridge/Mosfet/Ideal Switch/Model/Measurement list'
 * '<S38>'  : 'three_phase_WPT/Full-Bridge/Mosfet1/Diode'
 * '<S39>'  : 'three_phase_WPT/Full-Bridge/Mosfet1/Ideal Switch'
 * '<S40>'  : 'three_phase_WPT/Full-Bridge/Mosfet1/Measurement list'
 * '<S41>'  : 'three_phase_WPT/Full-Bridge/Mosfet1/Diode/Model'
 * '<S42>'  : 'three_phase_WPT/Full-Bridge/Mosfet1/Diode/Model/Measurement list'
 * '<S43>'  : 'three_phase_WPT/Full-Bridge/Mosfet1/Ideal Switch/Model'
 * '<S44>'  : 'three_phase_WPT/Full-Bridge/Mosfet1/Ideal Switch/Model/Measurement list'
 * '<S45>'  : 'three_phase_WPT/Full-Bridge/Mosfet2/Diode'
 * '<S46>'  : 'three_phase_WPT/Full-Bridge/Mosfet2/Ideal Switch'
 * '<S47>'  : 'three_phase_WPT/Full-Bridge/Mosfet2/Measurement list'
 * '<S48>'  : 'three_phase_WPT/Full-Bridge/Mosfet2/Diode/Model'
 * '<S49>'  : 'three_phase_WPT/Full-Bridge/Mosfet2/Diode/Model/Measurement list'
 * '<S50>'  : 'three_phase_WPT/Full-Bridge/Mosfet2/Ideal Switch/Model'
 * '<S51>'  : 'three_phase_WPT/Full-Bridge/Mosfet2/Ideal Switch/Model/Measurement list'
 * '<S52>'  : 'three_phase_WPT/Full-Bridge/Mosfet3/Diode'
 * '<S53>'  : 'three_phase_WPT/Full-Bridge/Mosfet3/Ideal Switch'
 * '<S54>'  : 'three_phase_WPT/Full-Bridge/Mosfet3/Measurement list'
 * '<S55>'  : 'three_phase_WPT/Full-Bridge/Mosfet3/Diode/Model'
 * '<S56>'  : 'three_phase_WPT/Full-Bridge/Mosfet3/Diode/Model/Measurement list'
 * '<S57>'  : 'three_phase_WPT/Full-Bridge/Mosfet3/Ideal Switch/Model'
 * '<S58>'  : 'three_phase_WPT/Full-Bridge/Mosfet3/Ideal Switch/Model/Measurement list'
 * '<S59>'  : 'three_phase_WPT/Full-Bridge/Mosfet4/Diode'
 * '<S60>'  : 'three_phase_WPT/Full-Bridge/Mosfet4/Ideal Switch'
 * '<S61>'  : 'three_phase_WPT/Full-Bridge/Mosfet4/Measurement list'
 * '<S62>'  : 'three_phase_WPT/Full-Bridge/Mosfet4/Diode/Model'
 * '<S63>'  : 'three_phase_WPT/Full-Bridge/Mosfet4/Diode/Model/Measurement list'
 * '<S64>'  : 'three_phase_WPT/Full-Bridge/Mosfet4/Ideal Switch/Model'
 * '<S65>'  : 'three_phase_WPT/Full-Bridge/Mosfet4/Ideal Switch/Model/Measurement list'
 * '<S66>'  : 'three_phase_WPT/Full-Bridge/Mosfet5/Diode'
 * '<S67>'  : 'three_phase_WPT/Full-Bridge/Mosfet5/Ideal Switch'
 * '<S68>'  : 'three_phase_WPT/Full-Bridge/Mosfet5/Measurement list'
 * '<S69>'  : 'three_phase_WPT/Full-Bridge/Mosfet5/Diode/Model'
 * '<S70>'  : 'three_phase_WPT/Full-Bridge/Mosfet5/Diode/Model/Measurement list'
 * '<S71>'  : 'three_phase_WPT/Full-Bridge/Mosfet5/Ideal Switch/Model'
 * '<S72>'  : 'three_phase_WPT/Full-Bridge/Mosfet5/Ideal Switch/Model/Measurement list'
 * '<S73>'  : 'three_phase_WPT/Full-Bridge/Subsystem/Voltage Measurement'
 * '<S74>'  : 'three_phase_WPT/Full-Bridge/Subsystem/Voltage Measurement/Model'
 * '<S75>'  : 'three_phase_WPT/Full-Bridge/Subsystem1/Voltage Measurement'
 * '<S76>'  : 'three_phase_WPT/Full-Bridge/Subsystem1/Voltage Measurement/Model'
 * '<S77>'  : 'three_phase_WPT/Full-Bridge/Subsystem12/Current Measurement'
 * '<S78>'  : 'three_phase_WPT/Full-Bridge/Subsystem12/Current Measurement/Model'
 * '<S79>'  : 'three_phase_WPT/Full-Bridge/Subsystem13/Current Measurement'
 * '<S80>'  : 'three_phase_WPT/Full-Bridge/Subsystem13/Current Measurement/Model'
 * '<S81>'  : 'three_phase_WPT/Full-Bridge/Subsystem2/Voltage Measurement'
 * '<S82>'  : 'three_phase_WPT/Full-Bridge/Subsystem2/Voltage Measurement/Model'
 * '<S83>'  : 'three_phase_WPT/Full-Bridge/Subsystem3/Current Measurement'
 * '<S84>'  : 'three_phase_WPT/Full-Bridge/Subsystem3/Current Measurement/Model'
 * '<S85>'  : 'three_phase_WPT/Full-Bridge/Subsystem4/Current Measurement'
 * '<S86>'  : 'three_phase_WPT/Full-Bridge/Subsystem4/Current Measurement/Model'
 * '<S87>'  : 'three_phase_WPT/Full-Bridge/Subsystem8/Current Measurement'
 * '<S88>'  : 'three_phase_WPT/Full-Bridge/Subsystem8/Current Measurement/Model'
 * '<S89>'  : 'three_phase_WPT/Full-Bridge/Subsystem9/Current Measurement'
 * '<S90>'  : 'three_phase_WPT/Full-Bridge/Subsystem9/Current Measurement/Model'
 * '<S91>'  : 'three_phase_WPT/MOTOR/Subsystem1'
 * '<S92>'  : 'three_phase_WPT/MOTOR/Subsystem13'
 * '<S93>'  : 'three_phase_WPT/MOTOR/Subsystem2'
 * '<S94>'  : 'three_phase_WPT/MOTOR/Subsystem1/Current Measurement'
 * '<S95>'  : 'three_phase_WPT/MOTOR/Subsystem1/Current Measurement/Model'
 * '<S96>'  : 'three_phase_WPT/MOTOR/Subsystem13/Current Measurement'
 * '<S97>'  : 'three_phase_WPT/MOTOR/Subsystem13/Current Measurement/Model'
 * '<S98>'  : 'three_phase_WPT/MOTOR/Subsystem2/Current Measurement'
 * '<S99>'  : 'three_phase_WPT/MOTOR/Subsystem2/Current Measurement/Model'
 * '<S100>' : 'three_phase_WPT/Subsystem13/Current Measurement'
 * '<S101>' : 'three_phase_WPT/Subsystem13/Current Measurement/Model'
 * '<S102>' : 'three_phase_WPT/WPT/Stair Generator'
 * '<S103>' : 'three_phase_WPT/WPT/Subsystem'
 * '<S104>' : 'three_phase_WPT/WPT/Subsystem1'
 * '<S105>' : 'three_phase_WPT/WPT/Subsystem10'
 * '<S106>' : 'three_phase_WPT/WPT/Subsystem11'
 * '<S107>' : 'three_phase_WPT/WPT/Subsystem12'
 * '<S108>' : 'three_phase_WPT/WPT/Subsystem13'
 * '<S109>' : 'three_phase_WPT/WPT/Subsystem2'
 * '<S110>' : 'three_phase_WPT/WPT/Subsystem3'
 * '<S111>' : 'three_phase_WPT/WPT/Subsystem4'
 * '<S112>' : 'three_phase_WPT/WPT/Subsystem5'
 * '<S113>' : 'three_phase_WPT/WPT/Subsystem6'
 * '<S114>' : 'three_phase_WPT/WPT/Subsystem7'
 * '<S115>' : 'three_phase_WPT/WPT/Subsystem8'
 * '<S116>' : 'three_phase_WPT/WPT/Subsystem9'
 * '<S117>' : 'three_phase_WPT/WPT/Variable Resistor'
 * '<S118>' : 'three_phase_WPT/WPT/Stair Generator/Discrete'
 * '<S119>' : 'three_phase_WPT/WPT/Stair Generator/Discrete/While Iterator Subsystem'
 * '<S120>' : 'three_phase_WPT/WPT/Stair Generator/Discrete/While Iterator Subsystem/Detect Fall Nonpositive'
 * '<S121>' : 'three_phase_WPT/WPT/Stair Generator/Discrete/While Iterator Subsystem/Detect Fall Nonpositive/Nonpositive'
 * '<S122>' : 'three_phase_WPT/WPT/Subsystem/Voltage Measurement'
 * '<S123>' : 'three_phase_WPT/WPT/Subsystem/Voltage Measurement/Model'
 * '<S124>' : 'three_phase_WPT/WPT/Subsystem1/Current Measurement'
 * '<S125>' : 'three_phase_WPT/WPT/Subsystem1/Current Measurement/Model'
 * '<S126>' : 'three_phase_WPT/WPT/Subsystem10/Current Measurement'
 * '<S127>' : 'three_phase_WPT/WPT/Subsystem10/Current Measurement/Model'
 * '<S128>' : 'three_phase_WPT/WPT/Subsystem11/Current Measurement'
 * '<S129>' : 'three_phase_WPT/WPT/Subsystem11/Current Measurement/Model'
 * '<S130>' : 'three_phase_WPT/WPT/Subsystem12/Voltage Measurement'
 * '<S131>' : 'three_phase_WPT/WPT/Subsystem12/Voltage Measurement/Model'
 * '<S132>' : 'three_phase_WPT/WPT/Subsystem13/Current Measurement'
 * '<S133>' : 'three_phase_WPT/WPT/Subsystem13/Current Measurement/Model'
 * '<S134>' : 'three_phase_WPT/WPT/Subsystem2/Voltage Measurement'
 * '<S135>' : 'three_phase_WPT/WPT/Subsystem2/Voltage Measurement/Model'
 * '<S136>' : 'three_phase_WPT/WPT/Subsystem3/Voltage Measurement'
 * '<S137>' : 'three_phase_WPT/WPT/Subsystem3/Voltage Measurement/Model'
 * '<S138>' : 'three_phase_WPT/WPT/Subsystem4/Diode'
 * '<S139>' : 'three_phase_WPT/WPT/Subsystem4/Diode1'
 * '<S140>' : 'three_phase_WPT/WPT/Subsystem4/Diode2'
 * '<S141>' : 'three_phase_WPT/WPT/Subsystem4/Diode3'
 * '<S142>' : 'three_phase_WPT/WPT/Subsystem4/Diode4'
 * '<S143>' : 'three_phase_WPT/WPT/Subsystem4/Diode5'
 * '<S144>' : 'three_phase_WPT/WPT/Subsystem4/Diode/Model'
 * '<S145>' : 'three_phase_WPT/WPT/Subsystem4/Diode/Model/Measurement list'
 * '<S146>' : 'three_phase_WPT/WPT/Subsystem4/Diode1/Model'
 * '<S147>' : 'three_phase_WPT/WPT/Subsystem4/Diode1/Model/Measurement list'
 * '<S148>' : 'three_phase_WPT/WPT/Subsystem4/Diode2/Model'
 * '<S149>' : 'three_phase_WPT/WPT/Subsystem4/Diode2/Model/Measurement list'
 * '<S150>' : 'three_phase_WPT/WPT/Subsystem4/Diode3/Model'
 * '<S151>' : 'three_phase_WPT/WPT/Subsystem4/Diode3/Model/Measurement list'
 * '<S152>' : 'three_phase_WPT/WPT/Subsystem4/Diode4/Model'
 * '<S153>' : 'three_phase_WPT/WPT/Subsystem4/Diode4/Model/Measurement list'
 * '<S154>' : 'three_phase_WPT/WPT/Subsystem4/Diode5/Model'
 * '<S155>' : 'three_phase_WPT/WPT/Subsystem4/Diode5/Model/Measurement list'
 * '<S156>' : 'three_phase_WPT/WPT/Subsystem5/Voltage Measurement'
 * '<S157>' : 'three_phase_WPT/WPT/Subsystem5/Voltage Measurement/Model'
 * '<S158>' : 'three_phase_WPT/WPT/Subsystem6/Current Measurement'
 * '<S159>' : 'three_phase_WPT/WPT/Subsystem6/Current Measurement/Model'
 * '<S160>' : 'three_phase_WPT/WPT/Subsystem7/Current Measurement'
 * '<S161>' : 'three_phase_WPT/WPT/Subsystem7/Current Measurement/Model'
 * '<S162>' : 'three_phase_WPT/WPT/Subsystem8/Voltage Measurement'
 * '<S163>' : 'three_phase_WPT/WPT/Subsystem8/Voltage Measurement/Model'
 * '<S164>' : 'three_phase_WPT/WPT/Subsystem9/Voltage Measurement'
 * '<S165>' : 'three_phase_WPT/WPT/Subsystem9/Voltage Measurement/Model'
 * '<S166>' : 'three_phase_WPT/WPT/Variable Resistor/Dmatrix'
 * '<S167>' : 'three_phase_WPT/WPT/Variable Resistor/Nearzero resistance'
 * '<S168>' : 'three_phase_WPT/WPT/Variable Resistor/SrcI'
 * '<S169>' : 'three_phase_WPT/WPT/Variable Resistor/Vmeas'
 * '<S170>' : 'three_phase_WPT/powergui/EquivalentModel1'
 * '<S171>' : 'three_phase_WPT/powergui/EquivalentModel1/DSS in'
 * '<S172>' : 'three_phase_WPT/powergui/EquivalentModel1/DSS out'
 * '<S173>' : 'three_phase_WPT/powergui/EquivalentModel1/Gates'
 * '<S174>' : 'three_phase_WPT/powergui/EquivalentModel1/Sources'
 * '<S175>' : 'three_phase_WPT/powergui/EquivalentModel1/Status'
 * '<S176>' : 'three_phase_WPT/powergui/EquivalentModel1/Yout'
 */
#endif                                 /* RTW_HEADER_three_phase_WPT_h_ */
