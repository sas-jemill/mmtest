import os
import os.path
import sys

sys.path.append('/models/resources/viya/9b3bc29c-1fb0-4bbb-85fd-0682bd4a7183/')

import hmeq_logistic_score

import settings_9b3bc29c_1fb0_4bbb_85fd_0682bd4a7183

settings_9b3bc29c_1fb0_4bbb_85fd_0682bd4a7183.pickle_path = '/models/resources/viya/9b3bc29c-1fb0-4bbb-85fd-0682bd4a7183/'

def score_record(REASON,JOB,YOJ,DEROG,DELINQ,CLAGE,NINQ,CLNO,DEBTINC):
    "Output: EM_CLASSIFICATION,EM_EVENTPROBABILITY"
    return hmeq_logistic_score.score_hmeq_log_reg_model(REASON,JOB,YOJ,DEROG,DELINQ,CLAGE,NINQ,CLNO,DEBTINC)

print(score_record("","",71.13,156.22,8.37,115.70,22.35,172.92,54.73))
