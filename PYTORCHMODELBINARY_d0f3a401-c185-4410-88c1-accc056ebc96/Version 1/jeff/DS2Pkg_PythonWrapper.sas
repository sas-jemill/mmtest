package pythonScore / overwrite=yes;
dcl package pymas pm;
dcl package logger logr('App.MM.Python.DS2');
dcl varchar(32767) character set utf8 pypgm;
dcl int resultCode revision;

method score(double "Sonar_0",
double "Sonar_1",
double "Sonar_2",
double "Sonar_3",
double "Sonar_4",
double "Sonar_5",
double "Sonar_6",
double "Sonar_7",
double "Sonar_8",
double "Sonar_9",
double "Sonar_10",
double "Sonar_11",
double "Sonar_12",
double "Sonar_13",
double "Sonar_14",
double "Sonar_15",
double "Sonar_16",
double "Sonar_17",
double "Sonar_18",
double "Sonar_19",
double "Sonar_20",
double "Sonar_21",
double "Sonar_22",
double "Sonar_23",
double "Sonar_24",
double "Sonar_25",
double "Sonar_26",
double "Sonar_27",
double "Sonar_28",
double "Sonar_29",
double "Sonar_30",
double "Sonar_31",
double "Sonar_32",
double "Sonar_33",
double "Sonar_34",
double "Sonar_35",
double "Sonar_36",
double "Sonar_37",
double "Sonar_38",
double "Sonar_39",
double "Sonar_40",
double "Sonar_41",
double "Sonar_42",
double "Sonar_43",
double "Sonar_44",
double "Sonar_45",
double "Sonar_46",
double "Sonar_47",
double "Sonar_48",
double "Sonar_49",
double "Sonar_50",
double "Sonar_51",
double "Sonar_52",
double "Sonar_53",
double "Sonar_54",
double "Sonar_55",
double "Sonar_56",
double "Sonar_57",
double "Sonar_58",
double "Sonar_59",
in_out double resultCode,
in_out varchar(100) "EM_CLASSIFICATION",
in_out double "EM_EVENTPROBABILITY");

   resultCode = revision = 0;
   if null(pm) then do;
      pm = _new_ pymas();
      resultCode = pm.useModule('model_exec_60490066-9898-4fc4-bdc7-68d860d1e40e', 1);
      if resultCode then do;
         resultCode = pm.appendSrcLine('import sys');
         resultCode = pm.appendSrcLine('sys.path.append("/models/resources/viya/b2594160-9dcf-465f-98a4-fc7da950ffe5/")');
         resultCode = pm.appendSrcLine('import settings_b2594160_9dcf_465f_98a4_fc7da950ffe5');
         resultCode = pm.appendSrcLine('settings_b2594160_9dcf_465f_98a4_fc7da950ffe5.pickle_path = "/models/resources/viya/b2594160-9dcf-465f-98a4-fc7da950ffe5/"');
         resultCode = pm.appendSrcLine('import score_deep_model_21bb031c_80ff_45ac_8342_04e3245dd116');
         resultCode = pm.appendSrcLine('def score(Sonar_0, Sonar_1, Sonar_2, Sonar_3, Sonar_4, Sonar_5, Sonar_6, Sonar_7, Sonar_8, Sonar_9, Sonar_10, Sonar_11, Sonar_12, Sonar_13, Sonar_14, Sonar_15, Sonar_16, Sonar_17, Sonar_18, Sonar_19, Sonar_20, Sonar_21, Sonar_22, Sonar_23, Sonar_24, Sonar_25, Sonar_26, Sonar_27, Sonar_28, Sonar_29, Sonar_30, Sonar_31, Sonar_32, Sonar_33, Sonar_34, Sonar_35, Sonar_36, Sonar_37, Sonar_38, Sonar_39, Sonar_40, Sonar_41, Sonar_42, Sonar_43, Sonar_44, Sonar_45, Sonar_46, Sonar_47, Sonar_48, Sonar_49, Sonar_50, Sonar_51, Sonar_52, Sonar_53, Sonar_54, Sonar_55, Sonar_56, Sonar_57, Sonar_58, Sonar_59):');
         resultCode = pm.appendSrcLine('    "Output: EM_CLASSIFICATION, EM_EVENTPROBABILITY"');
         resultCode = pm.appendSrcLine('    return score_deep_model_21bb031c_80ff_45ac_8342_04e3245dd116.score(Sonar_0, Sonar_1, Sonar_2, Sonar_3, Sonar_4, Sonar_5, Sonar_6, Sonar_7, Sonar_8, Sonar_9, Sonar_10, Sonar_11, Sonar_12, Sonar_13, Sonar_14, Sonar_15, Sonar_16, Sonar_17, Sonar_18, Sonar_19, Sonar_20, Sonar_21, Sonar_22, Sonar_23, Sonar_24, Sonar_25, Sonar_26, Sonar_27, Sonar_28, Sonar_29, Sonar_30, Sonar_31, Sonar_32, Sonar_33, Sonar_34, Sonar_35, Sonar_36, Sonar_37, Sonar_38, Sonar_39, Sonar_40, Sonar_41, Sonar_42, Sonar_43, Sonar_44, Sonar_45, Sonar_46, Sonar_47, Sonar_48, Sonar_49, Sonar_50, Sonar_51, Sonar_52, Sonar_53, Sonar_54, Sonar_55, Sonar_56, Sonar_57, Sonar_58, Sonar_59)');

         revision = pm.publish(pm.getSource(), 'model_exec_60490066-9898-4fc4-bdc7-68d860d1e40e');
         if ( revision < 1 ) then do;
            logr.log( 'e', 'py.publish() failed.');
            resultCode = -1;
            return;
         end;
      end;
   end;

   resultCode = pm.useMethod('score');
   if resultCode then do;
      logr.log('E', 'useMethod() failed. resultCode=$s', resultCode);
      return;
   end;
   resultCode = pm.setDouble('Sonar_0', Sonar_0);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_0 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_1', Sonar_1);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_1 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_2', Sonar_2);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_2 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_3', Sonar_3);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_3 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_4', Sonar_4);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_4 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_5', Sonar_5);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_5 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_6', Sonar_6);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_6 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_7', Sonar_7);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_7 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_8', Sonar_8);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_8 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_9', Sonar_9);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_9 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_10', Sonar_10);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_10 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_11', Sonar_11);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_11 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_12', Sonar_12);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_12 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_13', Sonar_13);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_13 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_14', Sonar_14);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_14 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_15', Sonar_15);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_15 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_16', Sonar_16);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_16 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_17', Sonar_17);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_17 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_18', Sonar_18);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_18 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_19', Sonar_19);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_19 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_20', Sonar_20);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_20 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_21', Sonar_21);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_21 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_22', Sonar_22);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_22 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_23', Sonar_23);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_23 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_24', Sonar_24);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_24 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_25', Sonar_25);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_25 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_26', Sonar_26);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_26 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_27', Sonar_27);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_27 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_28', Sonar_28);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_28 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_29', Sonar_29);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_29 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_30', Sonar_30);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_30 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_31', Sonar_31);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_31 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_32', Sonar_32);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_32 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_33', Sonar_33);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_33 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_34', Sonar_34);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_34 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_35', Sonar_35);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_35 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_36', Sonar_36);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_36 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_37', Sonar_37);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_37 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_38', Sonar_38);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_38 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_39', Sonar_39);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_39 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_40', Sonar_40);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_40 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_41', Sonar_41);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_41 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_42', Sonar_42);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_42 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_43', Sonar_43);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_43 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_44', Sonar_44);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_44 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_45', Sonar_45);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_45 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_46', Sonar_46);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_46 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_47', Sonar_47);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_47 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_48', Sonar_48);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_48 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_49', Sonar_49);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_49 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_50', Sonar_50);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_50 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_51', Sonar_51);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_51 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_52', Sonar_52);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_52 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_53', Sonar_53);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_53 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_54', Sonar_54);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_54 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_55', Sonar_55);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_55 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_56', Sonar_56);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_56 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_57', Sonar_57);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_57 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_58', Sonar_58);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_58 failed.  resultCode=$s', resultCode);
   resultCode = pm.setDouble('Sonar_59', Sonar_59);
   if resultCode then
      logr.log('E', 'setDouble for Sonar_59 failed.  resultCode=$s', resultCode);
   resultCode = pm.execute();
   if (resultCode) then
      logr.log('E', 'Error: pm.execute failed.  resultCode=$s', resultCode);
   else do;
      "EM_CLASSIFICATION" = pm.getString('EM_CLASSIFICATION');
      "EM_EVENTPROBABILITY" = pm.getDouble('EM_EVENTPROBABILITY');
   end;
end;

endpackage;
