/*----------------------------------------------------------------------------------*/
/* Product:            Visual Data Mining and Machine Learning                      */
/* Release Version:    V2023.04                                                     */
/* Component Version:  V2023.03                                                     */
/* CAS Version:        V.04.00M0P04022023                                           */
/* SAS Version:        V.04.00M0P040223                                             */
/* Site Number:        70180938                                                     */
/* Host:               sas-cas-server-default-client                                */
/* Encoding:           utf-8                                                        */
/* Java Encoding:      UTF8                                                         */
/* Locale:             en_US                                                        */
/* Project GUID:       548fba9a-7719-499d-84f7-1ae46089cc6a                         */
/* Node GUID:          6782d884-dc7c-41ca-b033-9942cc24e35d                         */
/* Node Id:            64M119IZNT0CIZVX261E8Y63H                                    */
/* Algorithm:          Decision Tree                                                */
/* Generated by:       edmdev                                                       */
/* Date:               04APR2023:13:49:41                                           */
/*----------------------------------------------------------------------------------*/
data sasep.out;
   dcl package score _64M119IZNT0CIZVX261E8Y63H();
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
      _64M119IZNT0CIZVX261E8Y63H.setvars(allvars);
      _64M119IZNT0CIZVX261E8Y63H.setkey(n'9636B08DE2FBC5D80727A2A7B7C3A43630FC0F85');
   end;
    
   method post_64M119IZNT0CIZVX261E8Y63H();
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
    
 
   method run();
      set SASEP.IN;
      _64M119IZNT0CIZVX261E8Y63H.scoreRecord();
      post_64M119IZNT0CIZVX261E8Y63H();
   end;
 
   method term();
   end;
 
enddata;