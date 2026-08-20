/* jenner-check bundle: t001_hmeq_logistic_scorecode
   Source: QS_Reg1/dmcas_scorecode.sas (SAS Model Manager export)
   This is the exact generated logistic-regression scoring code for the
   classic HMEQ (home equity) "BAD" model, byte-for-byte as exported by
   SAS Model Manager -- only the surrounding DATA step (INFILE/mock rows,
   and the closing RUN;) was added so it runs standalone. The scoring
   logic below -- imputations, the 12-term linear predictor, and the
   logistic link -- is untouched. */

data work.scored;
   informat CLAGE CLNO DEBTINC DELINQ DEROG NINQ VALUE YOJ LOAN best32.;
   informat JOB REASON $10.;
   input LOAN CLAGE CLNO DEBTINC DELINQ DEROG JOB $ NINQ REASON $ VALUE YOJ;
   datalines;
11000 94.3 15 32.9 0 0 Other 1 DebtCon 76200 9.5
5000 210.7 22 41.2 1 0 Mgr 0 HomeImp 154000 7.0
18000 60.1 9 . 2 1 Sales 3 DebtCon 68500 2.5
25000 300.4 28 24.8 0 0 Office 0 DebtCon 210000 15.0
9000 . 12 38.6 4 2 Self 2 HomeImp 45000 1.0
14000 145.0 18 29.4 0 0 ProfExe 0 DebtCon 132500 11.5
7000 88.9 6 . 3 1 Other 4 HomeImp 39800 0.5
30000 402.2 33 18.9 0 0 Mgr 0 DebtCon 265000 20.0
12500 122.6 14 45.1 1 0 Sales 1 HomeImp 88000 4.0
16000 175.3 20 33.2 0 0 Office 0 DebtCon 121000 8.5
6000 55.2 8 51.7 5 3 . 6 DebtCon 32000 0.2
21000 260.0 25 27.6 0 0 ProfExe 0 HomeImp 189000 13.0
;
run;

data work.scored;
   set work.scored;

/* --- unmodified scoring code from QS_Reg1/dmcas_scorecode.sas starts here --- */

* Imputation Method = MEAN ;
Label 'IMP_CLAGE'n = 'Imputed IMP_CLAGE';
Length 'IMP_CLAGE'n 8;
if missing('CLAGE'n) then do;
   'IMP_CLAGE'n = 182.72103159;
end;
else 'IMP_CLAGE'n = 'CLAGE'n;

* Imputation Method = MEAN ;
Label 'IMP_CLNO'n = 'Imputed IMP_CLNO';
Length 'IMP_CLNO'n 8;
if missing('CLNO'n) then do;
   'IMP_CLNO'n = 21.133236785;
end;
else 'IMP_CLNO'n = 'CLNO'n;

* Imputation Method = MEAN ;
Label 'IMP_DEBTINC'n = 'Imputed IMP_DEBTINC';
Length 'IMP_DEBTINC'n 8;
if missing('DEBTINC'n) then do;
   'IMP_DEBTINC'n = 33.34492691;
end;
else 'IMP_DEBTINC'n = 'DEBTINC'n;

* Imputation Method = COUNT ;
Label 'IMP_DELINQ'n = 'Imputed IMP_DELINQ';
Length 'IMP_DELINQ'n 8;
if missing('DELINQ'n) then do;
   'IMP_DELINQ'n = 0;
end;
else 'IMP_DELINQ'n = 'DELINQ'n;

* Imputation Method = COUNT ;
Label 'IMP_DEROG'n = 'Imputed IMP_DEROG';
Length 'IMP_DEROG'n 8;
if missing('DEROG'n) then do;
   'IMP_DEROG'n = 0;
end;
else 'IMP_DEROG'n = 'DEROG'n;

* Imputation Method = COUNT ;
Label 'IMP_JOB'n = 'Imputed IMP_JOB';
Length 'IMP_JOB'n $7;
if missing('JOB'n) then do;
   'IMP_JOB'n = 'Other';
end;
else 'IMP_JOB'n = 'JOB'n;

* Imputation Method = COUNT ;
Label 'IMP_NINQ'n = 'Imputed IMP_NINQ';
Length 'IMP_NINQ'n 8;
if missing('NINQ'n) then do;
   'IMP_NINQ'n = 0;
end;
else 'IMP_NINQ'n = 'NINQ'n;

* Imputation Method = COUNT ;
Label 'IMP_REASON'n = 'Imputed IMP_REASON';
Length 'IMP_REASON'n $7;
if missing('REASON'n) then do;
   'IMP_REASON'n = 'DebtCon';
end;
else 'IMP_REASON'n = 'REASON'n;

* Imputation Method = MEAN ;
Label 'IMP_VALUE'n = 'Imputed IMP_VALUE';
Length 'IMP_VALUE'n 8;
if missing('VALUE'n) then do;
   'IMP_VALUE'n = 103838.32787;
end;
else 'IMP_VALUE'n = 'VALUE'n;

* Imputation Method = MEAN ;
Label 'IMP_YOJ'n = 'Imputed IMP_YOJ';
Length 'IMP_YOJ'n 8;
if missing('YOJ'n) then do;
   'IMP_YOJ'n = 8.8720137825;
end;
else 'IMP_YOJ'n = 'YOJ'n;

   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_41660269_0_{12} _temporary_;
   array _beta_41660269_0_{12} _temporary_ (    15.2099229188495
           -0.0067863182529
          -15.8913398466484
          -14.7358791844994
           -14.575119245976
          -13.2075412833863
          -13.5842973508738
          -0.01351528261406
          -0.12102452803093
          -0.04581261089043
           0.07752573846945
                          0);

   length _IMP_DELINQ_ $2; drop _IMP_DELINQ_;
   _IMP_DELINQ_ = left(trim(put(IMP_DELINQ,BEST2.)));
   if missing(IMP_CLAGE)
      then do;
         _badval_ = 1;
         goto skip_41660269_0;
   end;

   do _i_=1 to 12; _xrow_41660269_0_{_i_} = 0; end;

   _xrow_41660269_0_[1] = 1;

   _xrow_41660269_0_[2] = IMP_CLAGE;

   _temp_ = 1;
   select (_IMP_DELINQ_);
      when ('0') _xrow_41660269_0_[3] = _temp_;
      when ('1') _xrow_41660269_0_[4] = _temp_;
      when ('2') _xrow_41660269_0_[5] = _temp_;
      when ('3') _xrow_41660269_0_[6] = _temp_;
      when ('4') _xrow_41660269_0_[7] = _temp_;
      when ('5') _xrow_41660269_0_[8] = _temp_;
      when ('6') _xrow_41660269_0_[9] = _temp_;
      when ('7') _xrow_41660269_0_[10] = _temp_;
      when ('8') _xrow_41660269_0_[11] = _temp_;
      when ('10') _xrow_41660269_0_[12] = _temp_;
      otherwise do; _badval_ = 1; goto skip_41660269_0; end;
   end;

   do _i_=1 to 12;
      _linp_ + _xrow_41660269_0_{_i_} * _beta_41660269_0_{_i_};
   end;

   skip_41660269_0:
   length I_BAD $1;
   label I_BAD = 'Into: BAD';
   array _levels_41660269_{2} $ 1 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_BAD1 = 'Predicted: BAD=1';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_BAD1 = 1 / (1+exp(-_linp_));
      end; else do;
         P_BAD1 = exp(_linp_) / (1+exp(_linp_));
      end;
      P_BAD0 = 1 - P_BAD1;
      if P_BAD1 >= 0.5                  then do;
         I_BAD = _levels_41660269_{1};
      end; else do;
         I_BAD = _levels_41660269_{2};
      end;
   end; else do;
      _linp_ = .;
      P_BAD1 = .;
      P_BAD0 = .;
      I_BAD = ' ';
   end;


   *------------------------------------------------------------*;
   * Initializing missing posterior and classification variables ;
   *------------------------------------------------------------*;
   if "P_BAD0"n = . then "P_BAD0"n =0.8000839983;
   if "P_BAD1"n = . then "P_BAD1"n =0.1999160017;
   if missing('I_BAD'n) then do;
      drop _P_;
      _P_= 0.0 ;
      if 'P_BAD1'n > _P_ then do;
      _P_ = 'P_BAD1'n;
      'I_BAD'n = '1';
      end;
      if 'P_BAD0'n > _P_ then do;
      _P_ = 'P_BAD0'n;
      'I_BAD'n = '0';
      end;
   end;
*------------------------------------------------------------*;
* Generating fixed output names;
*------------------------------------------------------------*;
Length EM_EVENTPROBABILITY 8;
LABEL EM_EVENTPROBABILITY = "Predicted for BAD =1";
EM_EVENTPROBABILITY ='P_BAD1'n;
LENGTH EM_CLASSIFICATION $32;
LABEL EM_CLASSIFICATION= "Predicted for BAD";
EM_CLASSIFICATION ='I_BAD'n;
Length EM_PROBABILITY 8;
LABEL EM_PROBABILITY = "Probability of Classification";
EM_PROBABILITY = max('P_BAD1'n,'P_BAD0'n);

/* --- unmodified scoring code from QS_Reg1/dmcas_scorecode.sas ends here --- */

run;

proc print data=work.scored label noobs;
   var LOAN JOB REASON I_BAD EM_EVENTPROBABILITY EM_CLASSIFICATION;
run;

proc freq data=work.scored;
   tables I_BAD;
run;
