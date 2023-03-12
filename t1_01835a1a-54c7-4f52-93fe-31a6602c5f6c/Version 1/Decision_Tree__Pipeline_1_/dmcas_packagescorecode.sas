/*----------------------------------------------------------------------------------*/
/* Product:            Visual Data Mining and Machine Learning                      */
/* Release Version:    V2023.03                                                     */
/* Component Version:  V2023.03                                                     */
/* CAS Version:        V.04.00M0P03092023                                           */
/* SAS Version:        V.04.00M0P030923                                             */
/* Site Number:        70180938                                                     */
/* Host:               sas-cas-server-default-client                                */
/* Encoding:           utf-8                                                        */
/* Java Encoding:      UTF8                                                         */
/* Locale:             en_US                                                        */
/* Project GUID:       946027af-dd2b-4df8-8d1e-713df27a4990                         */
/* Node GUID:          f2d5e3d3-55b9-4648-b36a-5e333dbd54ce                         */
/* Node Id:            EDJVN1SV56BHDMZQWK4274RTA                                    */
/* Algorithm:          Decision Tree                                                */
/* Generated by:       edmdev                                                       */
/* Date:               12MAR2023:16:17:25                                           */
/*----------------------------------------------------------------------------------*/
package MS_f2d5e3d355b94648b36a5e333dbd54ce_12MAR2023161725203 / overwrite=yes;
   dcl package score _EDJVN1SV56BHDMZQWK4274RTA();
   dcl double EM_EVENTPROBABILITY;
   dcl double "DELINQ";
   dcl nchar(12) EM_CLASSIFICATION;
   dcl double "DEBTINC";
   dcl double EM_PROBABILITY;
   dcl double "VALUE";
   dcl double "DEROG";
   dcl double "CLNO";
   dcl double "CLAGE";
   dcl double "P_BAD1" having label n'Predicted: BAD=1';
   dcl double "P_BAD0" having label n'Predicted: BAD=0';
   dcl nchar(32) "I_BAD" having label n'Into: BAD';
   dcl nchar(4) "_WARN_" having label n'Warnings';
   varlist allvars [_all_];
 
    
   method init();
      _EDJVN1SV56BHDMZQWK4274RTA.setvars(allvars);
      _EDJVN1SV56BHDMZQWK4274RTA.setkey(n'D4B7D26830DA97174895408E829C3E7D26650464');
   end;
    
   method post_EDJVN1SV56BHDMZQWK4274RTA();
      dcl double _P_;
       
      if "P_BAD0" = . then "P_BAD0" = 0.8000839983;
      if "P_BAD1" = . then "P_BAD1" = 0.1999160017;
      if MISSING("I_BAD") then do ;
      _P_ = 0.0;
      if "P_BAD1" > _P_ then do ;
      _P_ = "P_BAD1";
      "I_BAD" = '           1';
      end;
      if "P_BAD0" > _P_ then do ;
      _P_ = "P_BAD0";
      "I_BAD" = '           0';
      end;
      end;
      EM_EVENTPROBABILITY = "P_BAD1";
      EM_CLASSIFICATION = "I_BAD";
      EM_PROBABILITY = MAX("P_BAD1", "P_BAD0");
    
   end;
    
 
   method score(
      double "CLAGE",
      double "CLNO",
      double "DEBTINC",
      double "DELINQ",
      double "DEROG",
      double "VALUE",
      IN_OUT char(12) "EM_CLASSIFICATION",
      IN_OUT double "EM_EVENTPROBABILITY",
      IN_OUT double "EM_PROBABILITY",
      IN_OUT char(32) "I_BAD",
      IN_OUT double "P_BAD0",
      IN_OUT double "P_BAD1",
      IN_OUT double "_P_",
      IN_OUT char(4) "_WARN_"
   );
      this."CLAGE"= "CLAGE";
      this."CLNO"= "CLNO";
      this."DEBTINC"= "DEBTINC";
      this."DELINQ"= "DELINQ";
      this."DEROG"= "DEROG";
      this."VALUE"= "VALUE";
 
      _EDJVN1SV56BHDMZQWK4274RTA.scoreRecord();
      post_EDJVN1SV56BHDMZQWK4274RTA();
 
      "EM_CLASSIFICATION"= this."EM_CLASSIFICATION";
      "EM_EVENTPROBABILITY"= this."EM_EVENTPROBABILITY";
      "EM_PROBABILITY"= this."EM_PROBABILITY";
      "I_BAD"= this."I_BAD";
      "P_BAD0"= this."P_BAD0";
      "P_BAD1"= this."P_BAD1";
      "_P_"= this."_P_";
      "_WARN_"= this."_WARN_";
   end;
 
 
   method predictedscore(
      double "CLAGE",
      double "CLNO",
      double "DEBTINC",
      double "DELINQ",
      double "DEROG",
      double "VALUE",
      IN_OUT char(12) "EM_CLASSIFICATION",
      IN_OUT double "EM_EVENTPROBABILITY",
      IN_OUT double "EM_PROBABILITY",
      IN_OUT char(32) "I_BAD",
      IN_OUT double "P_BAD0",
      IN_OUT double "P_BAD1",
      IN_OUT char(4) "_WARN_"
   );
      this."CLAGE"= "CLAGE";
      this."CLNO"= "CLNO";
      this."DEBTINC"= "DEBTINC";
      this."DELINQ"= "DELINQ";
      this."DEROG"= "DEROG";
      this."VALUE"= "VALUE";
 
      _EDJVN1SV56BHDMZQWK4274RTA.scoreRecord();
      post_EDJVN1SV56BHDMZQWK4274RTA();
 
      "EM_CLASSIFICATION"= this."EM_CLASSIFICATION";
      "EM_EVENTPROBABILITY"= this."EM_EVENTPROBABILITY";
      "EM_PROBABILITY"= this."EM_PROBABILITY";
      "I_BAD"= this."I_BAD";
      "P_BAD0"= this."P_BAD0";
      "P_BAD1"= this."P_BAD1";
      "_WARN_"= this."_WARN_";
   end;
 
endpackage;
