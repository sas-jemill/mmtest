import os
import os.path
import sys

sys.path.append('/models/resources/viya/bb5abc4f-7b3f-4463-aebb-855946e39903/')

import hmeq_logistic_score

import settings_bb5abc4f_7b3f_4463_aebb_855946e39903

settings_bb5abc4f_7b3f_4463_aebb_855946e39903.pickle_path = '/models/resources/viya/bb5abc4f-7b3f-4463-aebb-855946e39903/'

def score_record(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ):
    "Output: EM_EVENTPROBABILITY,EM_CLASSIFICATION"
    return hmeq_logistic_score.scoreHMEQLogisticModel(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ)

print(score_record("","",35.44,153.07,116.12,76.97,198.09,198.25,142.49))
