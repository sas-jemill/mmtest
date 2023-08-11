import os
import os.path
import sys

sys.path.append('/models/resources/viya/18519eb0-f8b3-414e-97da-b3e8650f68df/')

import hmeq_logistic_score

import settings_18519eb0_f8b3_414e_97da_b3e8650f68df

settings_18519eb0_f8b3_414e_97da_b3e8650f68df.pickle_path = '/models/resources/viya/18519eb0-f8b3-414e-97da-b3e8650f68df/'

def score_record(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ):
    "Output: EM_EVENTPROBABILITY,EM_CLASSIFICATION"
    return hmeq_logistic_score.scoreHMEQLogisticModel(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ)

print(score_record("","",26.22,188.13,17.64,89.78,89.45,180.22,37.28))
