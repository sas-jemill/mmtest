import os
import os.path
import sys

sys.path.append('/models/resources/viya/83f89704-6b56-437f-b320-5de4a8de4fd8/')

import hmeq_logistic_score

import settings_83f89704_6b56_437f_b320_5de4a8de4fd8

settings_83f89704_6b56_437f_b320_5de4a8de4fd8.pickle_path = '/models/resources/viya/83f89704-6b56-437f-b320-5de4a8de4fd8/'

def score_record(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ):
    "Output: EM_EVENTPROBABILITY,EM_CLASSIFICATION"
    return hmeq_logistic_score.scoreHMEQLogisticModel(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ)

print(score_record("","",183.21,68.91,95.36,11.33,52.21,176.06,143.19))
