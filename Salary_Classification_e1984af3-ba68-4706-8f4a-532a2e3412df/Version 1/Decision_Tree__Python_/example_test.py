import os
import os.path
import sys

sys.path.append('/models/resources/viya/5f7118c4-072a-4daa-9f55-573f50f13dd8/')

import score_dtc

import settings_5f7118c4_072a_4daa_9f55_573f50f13dd8

settings_5f7118c4_072a_4daa_9f55_573f50f13dd8.pickle_path = '/models/resources/viya/5f7118c4-072a-4daa-9f55-573f50f13dd8/'

def score_record(Age,WorkClass,Education,MartialStatus,Relationship,Race,Sex,HoursPerWeek,GE50K):
    "Output: EM_CLASSIFICATION,EM_EVENTPROBABILITY"
    return score_dtc.score(Age,WorkClass,Education,MartialStatus,Relationship,Race,Sex,HoursPerWeek,GE50K)

print(score_record(183.21,"","","","","","",164.10,147.46))
