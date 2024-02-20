import os
import os.path
import sys

sys.path.append('/models/resources/viya/b2594160-9dcf-465f-98a4-fc7da950ffe5/')

import score_deep_model

import settings_b2594160_9dcf_465f_98a4_fc7da950ffe5

settings_b2594160_9dcf_465f_98a4_fc7da950ffe5.pickle_path = '/models/resources/viya/b2594160-9dcf-465f-98a4-fc7da950ffe5/'

def score_record(Sonar_0,Sonar_1,Sonar_2,Sonar_3,Sonar_4,Sonar_5,Sonar_6,Sonar_7,Sonar_8,Sonar_9,Sonar_10,Sonar_11,Sonar_12,Sonar_13,Sonar_14,Sonar_15,Sonar_16,Sonar_17,Sonar_18,Sonar_19,Sonar_20,Sonar_21,Sonar_22,Sonar_23,Sonar_24,Sonar_25,Sonar_26,Sonar_27,Sonar_28,Sonar_29,Sonar_30,Sonar_31,Sonar_32,Sonar_33,Sonar_34,Sonar_35,Sonar_36,Sonar_37,Sonar_38,Sonar_39,Sonar_40,Sonar_41,Sonar_42,Sonar_43,Sonar_44,Sonar_45,Sonar_46,Sonar_47,Sonar_48,Sonar_49,Sonar_50,Sonar_51,Sonar_52,Sonar_53,Sonar_54,Sonar_55,Sonar_56,Sonar_57,Sonar_58,Sonar_59):
    "Output: EM_CLASSIFICATION,EM_EVENTPROBABILITY"
    return score_deep_model.score(Sonar_0,Sonar_1,Sonar_2,Sonar_3,Sonar_4,Sonar_5,Sonar_6,Sonar_7,Sonar_8,Sonar_9,Sonar_10,Sonar_11,Sonar_12,Sonar_13,Sonar_14,Sonar_15,Sonar_16,Sonar_17,Sonar_18,Sonar_19,Sonar_20,Sonar_21,Sonar_22,Sonar_23,Sonar_24,Sonar_25,Sonar_26,Sonar_27,Sonar_28,Sonar_29,Sonar_30,Sonar_31,Sonar_32,Sonar_33,Sonar_34,Sonar_35,Sonar_36,Sonar_37,Sonar_38,Sonar_39,Sonar_40,Sonar_41,Sonar_42,Sonar_43,Sonar_44,Sonar_45,Sonar_46,Sonar_47,Sonar_48,Sonar_49,Sonar_50,Sonar_51,Sonar_52,Sonar_53,Sonar_54,Sonar_55,Sonar_56,Sonar_57,Sonar_58,Sonar_59)

print(score_record(174.00,192.84,124.14,188.16,158.33,165.40,110.71,169.18,2.22,154.33,49.48,185.88,198.86,58.60,110.11,175.84,142.05,41.43,136.74,135.81,167.00,60.63,51.29,119.09,166.24,24.16,190.56,11.18,38.48,73.21,109.75,22.34,85.81,71.54,143.57,154.48,74.53,14.02,51.78,163.73,45.56,153.96,25.83,58.93,112.12,18.55,93.24,161.30,122.89,119.04,4.39,81.02,129.27,135.06,136.13,187.51,147.71,8.82,23.01,16.59))
