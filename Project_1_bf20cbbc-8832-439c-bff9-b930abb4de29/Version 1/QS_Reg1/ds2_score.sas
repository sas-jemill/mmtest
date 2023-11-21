ds2_options sas tkgmac scond=none;
 data SASEP.out;
 #_local _P_;
 #_local MACLOGBIG;
 #_local _J_;
 #_local _I_;
 #_local _TEMP_;
 #_local _LINP_;
 #_local _BADVAL_;
 dcl double "IMP_CLAGE";
 dcl double "IMP_CLNO";
 dcl double "IMP_DEBTINC";
 dcl double "IMP_DELINQ";
 dcl double "IMP_DEROG";
 dcl char(7) "IMP_JOB";
 dcl double "IMP_NINQ";
 dcl char(7) "IMP_REASON";
 dcl double "IMP_VALUE";
 dcl double "IMP_YOJ";
 dcl char(1) I_BAD;
 dcl double EM_EVENTPROBABILITY;
 dcl char(32) EM_CLASSIFICATION;
 dcl double EM_PROBABILITY;
 dcl double "CLAGE";
dcl double "CLNO";
dcl double "DEBTINC";
dcl double "DELINQ";
dcl double "DEROG";
dcl char(7) "JOB";
dcl double "NINQ";
dcl char(7) "REASON";
dcl double "VALUE";
dcl double "YOJ";
method run();
dcl char(2) _IMP_DELINQ_;
 dcl char(1) _LEVELS_41660269_[2];
 dcl double _BETA_41660269_0_[12];
 dcl double _XROW_41660269_0_[12];
 _LEVELS_41660269_:=('1', '0');
_BETA_41660269_0_:=(15.2099229188495, -0.0067863182529, -15.8913398466484, 
-14.7358791844994, -14.575119245976, -13.2075412833863, -13.5842973508738, 
-0.01351528261406, -0.12102452803093, -0.04581261089043, 0.07752573846945, 
0);
set SASEP.in;
if MISSING("CLAGE") then do ;
"IMP_CLAGE" = 182.72103159;
end;
 else "IMP_CLAGE" = "CLAGE";
if MISSING("CLNO") then do ;
"IMP_CLNO" = 21.133236785;
end;
 else "IMP_CLNO" = "CLNO";
if MISSING("DEBTINC") then do ;
"IMP_DEBTINC" = 33.34492691;
end;
 else "IMP_DEBTINC" = "DEBTINC";
if MISSING("DELINQ") then do ;
"IMP_DELINQ" = 0.0;
end;
 else "IMP_DELINQ" = "DELINQ";
if MISSING("DEROG") then do ;
"IMP_DEROG" = 0.0;
end;
 else "IMP_DEROG" = "DEROG";
if MISSING("JOB") then do ;
"IMP_JOB" = 'Other';
end;
 else "IMP_JOB" = "JOB";
if MISSING("NINQ") then do ;
"IMP_NINQ" = 0.0;
end;
 else "IMP_NINQ" = "NINQ";
if MISSING("REASON") then do ;
"IMP_REASON" = 'DebtCon';
end;
 else "IMP_REASON" = "REASON";
if MISSING("VALUE") then do ;
"IMP_VALUE" = 103838.32787;
end;
 else "IMP_VALUE" = "VALUE";
if MISSING("YOJ") then do ;
"IMP_YOJ" = 8.8720137825;
end;
 else "IMP_YOJ" = "YOJ";
_BADVAL_ = 0.0;
_LINP_ = 0.0;
_TEMP_ = 0.0;
_I_ = 0.0;
_J_ = 0.0;
MACLOGBIG = 7.0978271289338392E+02;
_IMP_DELINQ_ = LEFT(TRIM(put(IMP_DELINQ, BEST2.)));
if MISSING(IMP_CLAGE) then do ;
_BADVAL_ = 1.0;
goto SKIP_41660269_0;
end;
do _I_ = 1.0 to 12.0;
_XROW_41660269_0_[_I_] = 0.0;
end;
_XROW_41660269_0_[1.0] = 1.0;
_XROW_41660269_0_[2.0] = IMP_CLAGE;
_TEMP_ = 1.0;
select (_IMP_DELINQ_);
when ('0') _XROW_41660269_0_[3.0] = _TEMP_;
when ('1') _XROW_41660269_0_[4.0] = _TEMP_;
when ('2') _XROW_41660269_0_[5.0] = _TEMP_;
when ('3') _XROW_41660269_0_[6.0] = _TEMP_;
when ('4') _XROW_41660269_0_[7.0] = _TEMP_;
when ('5') _XROW_41660269_0_[8.0] = _TEMP_;
when ('6') _XROW_41660269_0_[9.0] = _TEMP_;
when ('7') _XROW_41660269_0_[10.0] = _TEMP_;
when ('8') _XROW_41660269_0_[11.0] = _TEMP_;
when ('10') _XROW_41660269_0_[12.0] = _TEMP_;
otherwise do ;
_BADVAL_ = 1.0;
goto SKIP_41660269_0;
end;
end;
do _I_ = 1.0 to 12.0;
_LINP_ + _XROW_41660269_0_[_I_] * _BETA_41660269_0_[_I_];
end;
SKIP_41660269_0: if (_BADVAL_ = 0.0) & ^MISSING(_LINP_) then do ;
if (_LINP_ > 0.0) then do ;
P_BAD1 = 1.0 / (1.0 + EXP(-_LINP_));
end;
 else do ;
P_BAD1 = EXP(_LINP_) / (1.0 + EXP(_LINP_));
end;
P_BAD0 = 1.0 - P_BAD1;
if P_BAD1 >= 0.5 then do ;
I_BAD = _LEVELS_41660269_[1.0];
end;
 else do ;
I_BAD = _LEVELS_41660269_[2.0];
end;
end;
 else do ;
_LINP_ = .;
P_BAD1 = .;
P_BAD0 = .;
I_BAD = ' ';
end;
if "P_BAD0" = . then "P_BAD0" = 0.8000839983;
if "P_BAD1" = . then "P_BAD1" = 0.1999160017;
if MISSING("I_BAD") then do ;
_P_ = 0.0;
if "P_BAD1" > _P_ then do ;
_P_ = "P_BAD1";
"I_BAD" = '1';
end;
if "P_BAD0" > _P_ then do ;
_P_ = "P_BAD0";
"I_BAD" = '0';
end;
end;
EM_EVENTPROBABILITY = "P_BAD1";
EM_CLASSIFICATION = "I_BAD";
EM_PROBABILITY = MAX("P_BAD1", "P_BAD0");
_return: ;
end;
 enddata;
