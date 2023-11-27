*------------------------------------------------------------*;
* Macro Variables for input, output data and files;
  %let dm_datalib =;
  %let dm_lib     = WORK;
  %let dm_folder  = %sysfunc(pathname(work));
*------------------------------------------------------------*;
*------------------------------------------------------------*;
  * Preparing the training data for modeling;
*------------------------------------------------------------*;
%macro dm_rejected;
'CLAGE'n 'CLNO'n 'DEBTINC'n 'DELINQ'n 'DEROG'n 'JOB'n 'MORTDUE'n 'NINQ'n
'REASON'n 'VALUE'n 'YOJ'n
%mend dm_rejected;

data &dm_datalib.._input_3TGRU4C7W246Y2F95WL4DCYGM/ SESSREF=&_SESSREF_;
  set &dm_datalib..'DM_94HZQG9RVPZ4RDZIBCY5ULSVP'n;

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
drop %dm_rejected;
run;
*------------------------------------------------------------*;
  * Training for logisticreg;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
  * Initializing Variable Macros;
*------------------------------------------------------------*;
%macro dm_unary_input;
%mend dm_unary_input;
%global dm_num_unary_input;
%let dm_num_unary_input = 0;
%macro dm_interval_input;
'IMP_CLAGE'n 'IMP_CLNO'n 'IMP_DEBTINC'n 'IMP_VALUE'n 'IMP_YOJ'n 'LOAN'n
%mend dm_interval_input;
%global dm_num_interval_input;
%let dm_num_interval_input = 6 ;
%macro dm_binary_input;
'IMP_REASON'n
%mend dm_binary_input;
%global dm_num_binary_input;
%let dm_num_binary_input = 1 ;
%macro dm_nominal_input;
'IMP_DELINQ'n 'IMP_DEROG'n 'IMP_JOB'n 'IMP_NINQ'n
%mend dm_nominal_input;
%global dm_num_nominal_input;
%let dm_num_nominal_input = 4 ;
%macro dm_ordinal_input;
%mend dm_ordinal_input;
%global dm_num_ordinal_input;
%let dm_num_ordinal_input = 0;
%macro dm_class_input;
'IMP_DELINQ'n 'IMP_DEROG'n 'IMP_JOB'n 'IMP_NINQ'n 'IMP_REASON'n
%mend dm_class_input;
%global dm_num_class_input;
%let dm_num_class_input = 5 ;
%macro dm_segment;
%mend dm_segment;
%global dm_num_segment;
%let dm_num_segment = 0;
%macro dm_id;
%mend dm_id;
%global dm_num_id;
%let dm_num_id = 0;
%macro dm_text;
%mend dm_text;
%global dm_num_text;
%let dm_num_text = 0;
%macro dm_strat_vars;
'BAD'n
%mend dm_strat_vars;
%global dm_num_strat_vars;
%let dm_num_strat_vars = 1 ;
*------------------------------------------------------------*;
  * Component Code;
*------------------------------------------------------------*;
proc genselect data=dmcaslib.'_input_3TGRU4C7W246Y2F95WL4DCYGM'n
     tech=NRRIDG normalize=YES
  ;
  partition rolevar='_PartInd_'n (TRAIN='1' VALIDATE='0' TEST='2');
  class
     %dm_class_input
     /
     order=formatted
  ;
  model 'BAD'n
     (event='1')=
     %dm_interval_input
     %dm_class_input
     / link=LOGIT dist=BINARY
  ;
  selection method=STEPWISE( choose=SBC stop=SBC slEntry=0.05 slStay=0.05 Hierarchy=NONE select=SBC );
  ods output 
     PredProbName = DMLIB.PredProbName ModelInfo = DMLIB.PredIntoName
     SelectionSummary = &dm_lib..Selection(drop=Control)
     ParameterEstimates   = &dm_lib..ParamEstsA
     FitStatistics        = &dm_lib..OutFit
  ;
  code file="&dm_file_scorecode."  pcatall iprob labelid=41660269;
run;
