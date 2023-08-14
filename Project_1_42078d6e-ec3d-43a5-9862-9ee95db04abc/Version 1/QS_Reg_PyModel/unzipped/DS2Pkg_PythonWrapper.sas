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
      resultCode = pm.useModule('model_exec_8e9ba40e-0661-4768-b546-dacc1c40098d', 1);
      if resultCode then do;
         resultCode = pm.appendSrcLine('import sys');
         resultCode = pm.appendSrcLine('sys.path.append("/models/resources/viya/6da10709-ffe8-47bf-933c-0ff89d539bae/")');
         resultCode = pm.appendSrcLine('import settings_6da10709_ffe8_47bf_933c_0ff89d539bae');
         resultCode = pm.appendSrcLine('settings_6da10709_ffe8_47bf_933c_0ff89d539bae.pickle_path = "/models/resources/viya/6da10709-ffe8-47bf-933c-0ff89d539bae/"');
         resultCode = pm.appendSrcLine('import hmeq_logistic_score_4ad17a31_a7b2_4c85_9662_08cabd3c8cba');
         resultCode = pm.appendSrcLine('def scoreHMEQLogisticModel(JOB, REASON, CLAGE, CLNO, DEBTINC, DELINQ, DEROG, NINQ, YOJ):');
         resultCode = pm.appendSrcLine('    "Output: EM_EVENTPROBABILITY, EM_CLASSIFICATION"');
         resultCode = pm.appendSrcLine('    return hmeq_logistic_score_4ad17a31_a7b2_4c85_9662_08cabd3c8cba.scoreHMEQLogisticModel(JOB, REASON, CLAGE, CLNO, DEBTINC, DELINQ, DEROG, NINQ, YOJ)');

         revision = pm.publish(pm.getSource(), 'model_exec_8e9ba40e-0661-4768-b546-dacc1c40098d');
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