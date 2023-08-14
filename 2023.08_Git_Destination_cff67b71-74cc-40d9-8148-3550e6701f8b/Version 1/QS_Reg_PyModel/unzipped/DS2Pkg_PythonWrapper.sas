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
      resultCode = pm.useModule('model_exec_309782c6-dd7e-4f4c-81a8-4407d04c396d', 1);
      if resultCode then do;
         resultCode = pm.appendSrcLine('import sys');
         resultCode = pm.appendSrcLine('sys.path.append("/models/resources/viya/bb5abc4f-7b3f-4463-aebb-855946e39903/")');
         resultCode = pm.appendSrcLine('import settings_bb5abc4f_7b3f_4463_aebb_855946e39903');
         resultCode = pm.appendSrcLine('settings_bb5abc4f_7b3f_4463_aebb_855946e39903.pickle_path = "/models/resources/viya/bb5abc4f-7b3f-4463-aebb-855946e39903/"');
         resultCode = pm.appendSrcLine('import hmeq_logistic_score_d98fe0b6_d7c3_477b_b2cf_629b7e5b9551');
         resultCode = pm.appendSrcLine('def scoreHMEQLogisticModel(JOB, REASON, CLAGE, CLNO, DEBTINC, DELINQ, DEROG, NINQ, YOJ):');
         resultCode = pm.appendSrcLine('    "Output: EM_EVENTPROBABILITY, EM_CLASSIFICATION"');
         resultCode = pm.appendSrcLine('    return hmeq_logistic_score_d98fe0b6_d7c3_477b_b2cf_629b7e5b9551.scoreHMEQLogisticModel(JOB, REASON, CLAGE, CLNO, DEBTINC, DELINQ, DEROG, NINQ, YOJ)');

         revision = pm.publish(pm.getSource(), 'model_exec_309782c6-dd7e-4f4c-81a8-4407d04c396d');
         if ( revision < 1 ) then do;
            logr.log( 'e', 'py.publish() failed.');
            resultCode = -1;
            return;
         end;
      end;
   end;

   resultCode = pm.useMethod('scoreHMEQLogisticModel');
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
