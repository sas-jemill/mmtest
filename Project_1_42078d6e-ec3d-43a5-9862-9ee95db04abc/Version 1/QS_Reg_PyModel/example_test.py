import os
import os.path
import sys

sys.path.append('/models/resources/viya/6da10709-ffe8-47bf-933c-0ff89d539bae/')

import hmeq_logistic_score

import settings_6da10709_ffe8_47bf_933c_0ff89d539bae

settings_6da10709_ffe8_47bf_933c_0ff89d539bae.pickle_path = '/models/resources/viya/6da10709-ffe8-47bf-933c-0ff89d539bae/'

def score_record(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ):
    "Output: EM_EVENTPROBABILITY,EM_CLASSIFICATION"
    return hmeq_logistic_score.scoreHMEQLogisticModel(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ)

print(score_record("","",5.88,38.17,145.81,115.42,27.84,120.89,68.02))
