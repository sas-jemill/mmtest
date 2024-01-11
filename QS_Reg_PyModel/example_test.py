import os
import os.path
import sys

sys.path.append('/models/resources/viya/f1c0c33e-c5a1-4704-9744-f584550f0aa6/')

import hmeq_logistic_score

import settings_f1c0c33e_c5a1_4704_9744_f584550f0aa6

settings_f1c0c33e_c5a1_4704_9744_f584550f0aa6.pickle_path = '/models/resources/viya/f1c0c33e-c5a1-4704-9744-f584550f0aa6/'

def score_record(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ):
    "Output: EM_EVENTPROBABILITY,EM_CLASSIFICATION"
    return hmeq_logistic_score.scoreHMEQLogisticModel(JOB,REASON,CLAGE,CLNO,DEBTINC,DELINQ,DEROG,NINQ,YOJ)

print(score_record("","",5.97,118.14,83.93,120.93,12.16,69.41,132.23))
