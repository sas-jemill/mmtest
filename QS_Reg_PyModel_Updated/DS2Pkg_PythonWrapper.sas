package pythonScore / overwrite=yes;
dcl package pymas pm;
dcl package logger logr('App.MM.Python.DS2');
dcl varchar(32767) character set utf8 pypgm;
dcl int resultCode revision;

method score(varchar(100) "JOB",
varchar(100) "REASON",
double "CLAGE",
double "CLNO",
double "DEBTINC",
double "DELINQ",
double "DEROG",
double "NINQ",
double "YOJ",
in_out double resultCode,
in_out double "EM_EVENTPROBABILITY",
in_out varchar(100) "EM_CLASSIFICATION");

   resultCode = revision = 0;
   if null(pm) then do;
      pm = _new_ pymas();
      resultCode = pm.useModule('model_exec_90496973-1eef-479a-bc38-49b9612184e6', 1);
      if resultCode then do;
         resultCode = pm.appendSrcLine('import sys');
         resultCode = pm.appendSrcLine('sys.path.append("/models/resources/viya/9b3bc29c-1fb0-4bbb-85fd-0682bd4a7183/")');
         resultCode = pm.appendSrcLine('import settings_9b3bc29c_1fb0_4bbb_85fd_0682bd4a7183');
         resultCode = pm.appendSrcLine('settings_9b3bc29c_1fb0_4bbb_85fd_0682bd4a7183.pickle_path = "/models/resources/viya/9b3bc29c-1fb0-4bbb-85fd-0682bd4a7183/"');
         resultCode = pm.appendSrcLine('import hmeq_logistic_score_daee1149_d94a_41e4_a681_b6014e21f052');
         resultCode = pm.appendSrcLine('def score_hmeq_log_reg_model(REASON, JOB, YOJ, DEROG, DELINQ, CLAGE, NINQ, CLNO, DEBTINC):');
         resultCode = pm.appendSrcLine('    "Output: EM_CLASSIFICATION, EM_EVENTPROBABILITY"');
         resultCode = pm.appendSrcLine('    return hmeq_logistic_score_daee1149_d94a_41e4_a681_b6014e21f052.score_hmeq_log_reg_model(REASON, JOB, YOJ, DEROG, DELINQ, CLAGE, NINQ, CLNO, DEBTINC)');

         revision = pm.publish(pm.getSource(), 'model_exec_90496973-1eef-479a-bc38-49b9612184e6');
         if ( revision < 1 ) then do;
            logr.log( 'e', 'py.publish() failed.');
            resultCode = -1;
            return;
         end;
      end;
   end;

   resultCode = pm.useMethod('score_hmeq_log_reg_model');
   if resultCode then do;
      logr.log('E', 'useMethod() failed. resultCode=$s', resultCode);
      return;
   end;
   resultCode = pm.setString('JOB', JOB);
   if resultCode then
      logr.log('E', 'setString for JOB failed.  resultCode=$s', resultCode);
   resultCode = pm.setString('REASON', REASON);
   if resultCode then
      logr.log('E', 'setString for REASON failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('CLAGE', CLAGE);
   if resultCode then
      logr.log('E', 'setDouble for CLAGE failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('CLNO', CLNO);
   if resultCode then
      logr.log('E', 'setDouble for CLNO failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('DEBTINC', DEBTINC);
   if resultCode then
      logr.log('E', 'setDouble for DEBTINC failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('DELINQ', DELINQ);
   if resultCode then
      logr.log('E', 'setDouble for DELINQ failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('DEROG', DEROG);
   if resultCode then
      logr.log('E', 'setDouble for DEROG failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('NINQ', NINQ);
   if resultCode then
      logr.log('E', 'setDouble for NINQ failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('YOJ', YOJ);
   if resultCode then
      logr.log('E', 'setDouble for YOJ failed.  resultCode=$s', resultCode);
   resultCode = pm.execute();
   if (resultCode) then
      logr.log('E', 'Error: pm.execute failed.  resultCode=$s', resultCode);
   else do;
      "EM_EVENTPROBABILITY" = pm.getDouble('EM_EVENTPROBABILITY');
      "EM_CLASSIFICATION" = pm.getString('EM_CLASSIFICATION');
   end;
end;

endpackage;
