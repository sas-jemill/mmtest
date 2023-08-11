import math
import numpy
import pandas
import pickle
from pathlib import Path

import settings

with open(Path(settings.pickle_path) / "hmeq_logistic.pickle", "rb") as _pFile:
    _thisModelFit = pickle.load(_pFile)
    
def one_hot_encoding(data_series, dummy_columns):
    data_series = data_series.str.strip()
    data_ohe = pandas.get_dummies(data_series, columns=dummy_columns)
    
    ohe_columns = data_ohe.columns.tolist()
    
    missing_columns = list(set(dummy_columns) - set(ohe_columns))
    for col in missing_columns:
        data_ohe[col] = 0
    extra_columns = list(set(ohe_columns) - set(dummy_columns))
    data_ohe = data_ohe.drop(columns=extra_columns, axis=1)
    
    return data_ohe


def scoreHMEQLogisticModel(JOB, REASON, CLAGE, CLNO, DEBTINC, DELINQ, DEROG, NINQ, YOJ):
    "Output: EM_EVENTPROBABILITY, EM_CLASSIFICATION"
    
    try:
       _thisModelFit
    except NameError:
        with open(Path(settings.pickle_path) / "hmeq_logistic.pickle", "rb") as _pFile:
            _thisModelFit = pickle.load(_pFile)

    # Threshold for the misclassification error (BAD: 0-No, 1-Yes)
    _threshPredProb = 0.08941485864562787

    # Impute the overall median for missing values
    CLAGE = CLAGE.fillna(173.46666666666600)
    CLNO = CLNO.fillna(20.0)
    DEBTINC = DEBTINC.fillna(34.81826181858690)
    DELINQ = DELINQ.fillna(0.45)
    YOJ = YOJ.fillna(8.96954921803128)
    DEROG = DEROG.fillna(0.0)
    NINQ = NINQ.fillna(0.0)
    JOB = JOB.fillna('Other')
    REASON = REASON.fillna('DebtCon')
    
    dummy_columns = ['Mgr', 'Office', 'Other', 'ProfExe', 'Sales']
    JOB_ohe = one_hot_encoding(JOB, dummy_columns)

    
    dummy_columns = ['DebtCon']
    REASON_ohe = one_hot_encoding(REASON, dummy_columns)

    const = pandas.Series([1.0] * len(JOB))

    # Construct the input array for scoring (the first term is for the Intercept)
    input_array = pandas.concat([const, JOB_ohe, REASON_ohe, CLAGE, CLNO, DEBTINC, DELINQ, DEROG, NINQ, YOJ], axis=1)


    # Calculate the predicted probabilities
    _predProb = _thisModelFit.predict(input_array)

    # Retrieve the event probability
    EM_EVENTPROBABILITY = _predProb.iloc[:, 1].astype(float)

    # Determine the predicted target category
    EM_CLASSIFICATION = EM_EVENTPROBABILITY > _threshPredProb
    EM_CLASSIFICATION = EM_CLASSIFICATION.map({True: "1", False: "0"})

    return(EM_EVENTPROBABILITY, EM_CLASSIFICATION)