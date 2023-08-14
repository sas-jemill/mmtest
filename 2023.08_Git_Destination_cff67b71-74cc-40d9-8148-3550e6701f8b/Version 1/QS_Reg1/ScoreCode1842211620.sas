   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 03Jul2018:12:32:30
     -------------------------------------------------------*/

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
