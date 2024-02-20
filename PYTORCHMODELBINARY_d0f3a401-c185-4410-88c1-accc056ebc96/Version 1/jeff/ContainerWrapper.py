import argparse
import os
import os.path
import sys
import pandas as pd
import settings
settings.pickle_path = './'
import score_deep_model
parser = argparse.ArgumentParser(description='Score')
parser.add_argument('-m', dest='modelFile', help='model filename, default will be the model file hardcoded in the script')
parser.add_argument('-i', dest='scoreInputCSV', required=True, help='input filename')
parser.add_argument('-o', dest='scoreOutputCSV', required=True, help='output csv filename')
args = parser.parse_args()
model_file = args.modelFile
score_input_csv = args.scoreInputCSV
score_output_csv = args.scoreOutputCSV
if not os.path.isfile(score_input_csv):
    print('Not found input file',score_input_csv)
    sys.exit()
input_df = pd.read_csv(os.path.join(os.getcwd(), score_input_csv))
rowResult = []
for i, row in input_df.iterrows():
    rowResult.append(score_deep_model.score(row['Sonar_0'],row['Sonar_1'],row['Sonar_2'],row['Sonar_3'],row['Sonar_4'],row['Sonar_5'],row['Sonar_6'],row['Sonar_7'],row['Sonar_8'],row['Sonar_9'],row['Sonar_10'],row['Sonar_11'],row['Sonar_12'],row['Sonar_13'],row['Sonar_14'],row['Sonar_15'],row['Sonar_16'],row['Sonar_17'],row['Sonar_18'],row['Sonar_19'],row['Sonar_20'],row['Sonar_21'],row['Sonar_22'],row['Sonar_23'],row['Sonar_24'],row['Sonar_25'],row['Sonar_26'],row['Sonar_27'],row['Sonar_28'],row['Sonar_29'],row['Sonar_30'],row['Sonar_31'],row['Sonar_32'],row['Sonar_33'],row['Sonar_34'],row['Sonar_35'],row['Sonar_36'],row['Sonar_37'],row['Sonar_38'],row['Sonar_39'],row['Sonar_40'],row['Sonar_41'],row['Sonar_42'],row['Sonar_43'],row['Sonar_44'],row['Sonar_45'],row['Sonar_46'],row['Sonar_47'],row['Sonar_48'],row['Sonar_49'],row['Sonar_50'],row['Sonar_51'],row['Sonar_52'],row['Sonar_53'],row['Sonar_54'],row['Sonar_55'],row['Sonar_56'],row['Sonar_57'],row['Sonar_58'],row['Sonar_59']))
output_df = pd.DataFrame(rowResult, columns=['EM_CLASSIFICATION', 'EM_EVENTPROBABILITY'])
output_df = pd.merge(input_df, output_df, how='inner', left_index=True, right_index=True)
output_df.to_csv(score_output_csv, sep=',', index=False)
