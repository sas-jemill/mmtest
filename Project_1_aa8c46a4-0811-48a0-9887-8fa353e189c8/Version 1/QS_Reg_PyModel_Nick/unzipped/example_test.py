import os
import os.path
import sys

sys.path.append('/models/resources/viya/e5fe68d3-baea-489b-97e9-14169ceb1de8/')

import hmeq_logistic_score

import settings_e5fe68d3_baea_489b_97e9_14169ceb1de8

settings_e5fe68d3_baea_489b_97e9_14169ceb1de8.pickle_path = '/models/resources/viya/e5fe68d3-baea-489b-97e9-14169ceb1de8/'

def score_record(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ):
    "Output: EM_EVENTPROBABILITY,EM_CLASSIFICATION"
    return hmeq_logistic_score.scoreHMEQLogisticModel(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ)

print(score_record("","",115.37,63.47,100.80,138.40,138.03,131.66,176.30))
