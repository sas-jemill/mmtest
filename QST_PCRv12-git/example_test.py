import os
import os.path
import sys

sys.path.append('/models/resources/viya/79afa4c7-741f-4784-97b5-1ef958002fab/')

import hmeq_logistic_score

import settings_79afa4c7_741f_4784_97b5_1ef958002fab

settings_79afa4c7_741f_4784_97b5_1ef958002fab.pickle_path = '/models/resources/viya/79afa4c7-741f-4784-97b5-1ef958002fab/'

def score_record(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ):
    "Output: EM_EVENTPROBABILITY,EM_CLASSIFICATION"
    return hmeq_logistic_score.scoreHMEQLogisticModel(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ)

print(score_record("","",14.53,167.75,185.82,137.86,152.63,2.56,20.89))
