
import math
import pickle
import pandas as pd
import numpy as np
from pathlib import Path
import torch

model = torch.load('deep_model.pth')


def score(Sonar_0, Sonar_1, Sonar_2, Sonar_3, Sonar_4, Sonar_5, Sonar_6, Sonar_7, Sonar_8, Sonar_9, Sonar_10, Sonar_11,
          Sonar_12, Sonar_13, Sonar_14, Sonar_15, Sonar_16, Sonar_17, Sonar_18, Sonar_19, Sonar_20, Sonar_21, Sonar_22,
          Sonar_23, Sonar_24, Sonar_25, Sonar_26, Sonar_27, Sonar_28, Sonar_29, Sonar_30, Sonar_31, Sonar_32, Sonar_33,
          Sonar_34, Sonar_35, Sonar_36, Sonar_37, Sonar_38, Sonar_39, Sonar_40, Sonar_41, Sonar_42, Sonar_43, Sonar_44,
          Sonar_45, Sonar_46, Sonar_47, Sonar_48, Sonar_49, Sonar_50, Sonar_51, Sonar_52, Sonar_53, Sonar_54, Sonar_55,
          Sonar_56, Sonar_57, Sonar_58, Sonar_59):
    "Output: EM_CLASSIFICATION, EM_EVENTPROBABILITY"


    index = None
    if not isinstance(Sonar_0, pd.Series):
        index = [0]

    input_array = pd.DataFrame(
        {"Sonar_0": Sonar_0, "Sonar_1": Sonar_1, "Sonar_2": Sonar_2, "Sonar_3": Sonar_3,
         "Sonar_4": Sonar_4, "Sonar_5": Sonar_5, "Sonar_6": Sonar_6, "Sonar_7": Sonar_7,
         "Sonar_8": Sonar_8, "Sonar_9": Sonar_9, "Sonar_10": Sonar_10, "Sonar_11":
             Sonar_11, "Sonar_12": Sonar_12, "Sonar_13": Sonar_13, "Sonar_14": Sonar_14,
         "Sonar_15": Sonar_15, "Sonar_16": Sonar_16, "Sonar_17": Sonar_17, "Sonar_18":
             Sonar_18, "Sonar_19": Sonar_19, "Sonar_20": Sonar_20, "Sonar_21": Sonar_21,
         "Sonar_22": Sonar_22, "Sonar_23": Sonar_23, "Sonar_24": Sonar_24, "Sonar_25":
             Sonar_25, "Sonar_26": Sonar_26, "Sonar_27": Sonar_27, "Sonar_28": Sonar_28,
         "Sonar_29": Sonar_29, "Sonar_30": Sonar_30, "Sonar_31": Sonar_31, "Sonar_32":
             Sonar_32, "Sonar_33": Sonar_33, "Sonar_34": Sonar_34, "Sonar_35": Sonar_35,
         "Sonar_36": Sonar_36, "Sonar_37": Sonar_37, "Sonar_38": Sonar_38, "Sonar_39":
             Sonar_39, "Sonar_40": Sonar_40, "Sonar_41": Sonar_41, "Sonar_42": Sonar_42,
         "Sonar_43": Sonar_43, "Sonar_44": Sonar_44, "Sonar_45": Sonar_45, "Sonar_46":
             Sonar_46, "Sonar_47": Sonar_47, "Sonar_48": Sonar_48, "Sonar_49": Sonar_49,
         "Sonar_50": Sonar_50, "Sonar_51": Sonar_51, "Sonar_52": Sonar_52, "Sonar_53":
             Sonar_53, "Sonar_54": Sonar_54, "Sonar_55": Sonar_55, "Sonar_56": Sonar_56,
         "Sonar_57": Sonar_57, "Sonar_58": Sonar_58, "Sonar_59": Sonar_59}, index=index
    )

    input_array = impute_missing_values(input_array)
    prediction = model.predict(input_array).tolist()

    # Check for numpy values and convert to a CAS readable representation
    if isinstance(prediction, np.ndarray):
        prediction = prediction.tolist()

    target_values = ['R', 'M']

    if input_array.shape[0] == 1:
        return target_values[prediction[0].index(max(prediction[0]))], max(prediction[0])
    else:
        df = pd.DataFrame(prediction)
        index = np.argmax(df.values, axis=1)
        classifications = np.array(target_values)[index]
        max_proba = np.max(df.values, axis=1)
        return pd.DataFrame({'EM_CLASSIFICATION': classifications, 'EM_EVENTPROBABILITY': max_proba})

def impute_missing_values(data):
    impute_values = \
        {'Sonar_54': 0.009290384, 'Sonar_21': 0.6242751, 'Sonar_0': 0.029163944,
        'Sonar_25': 0.69986635, 'Sonar_5': 0.10457019, 'Sonar_26': 0.7021548,
        'Sonar_13': 0.29656827, 'Sonar_18': 0.5048115, 'Sonar_53': 0.010940866,
        'Sonar_59': 0.0065072114, 'Sonar_4': 0.075202405, 'Sonar_37': 0.3396572,
        'Sonar_38': 0.3257995, 'Sonar_44': 0.19723222, 'Sonar_33': 0.40323317,
        'Sonar_36': 0.36380672, 'Sonar_41': 0.27829325, 'Sonar_34': 0.39257115,
        'Sonar_20': 0.60906017, 'Sonar_10': 0.236013, 'Sonar_48': 0.05192885,
        'Sonar_46': 0.122452885, 'Sonar_3': 0.05389231, 'Sonar_15': 0.37848657,
        'Sonar_31': 0.4390404, 'Sonar_14': 0.32020143, 'Sonar_51': 0.0134201925,
        'Sonar_32': 0.4172197, 'Sonar_28': 0.64207405, 'Sonar_16': 0.4159832,
        'Sonar_24': 0.67542356, 'Sonar_52': 0.010709135, 'Sonar_6': 0.12174663,
        'Sonar_55': 0.008221635, 'Sonar_39': 0.31120676, 'Sonar_56': 0.007820193,
        'Sonar_19': 0.56304663, 'Sonar_23': 0.6726543, 'Sonar_50': 0.016068751,
        'Sonar_49': 0.020424038, 'Sonar_17': 0.45231825, 'Sonar_40': 0.28925192,
        'Sonar_8': 0.17800286, 'Sonar_1': 0.038436536, 'Sonar_11': 0.25022116,
        'Sonar_35': 0.3848476, 'Sonar_57': 0.007949038, 'Sonar_22': 0.646975,
        'Sonar_29': 0.5809279, 'Sonar_58': 0.007941346, 'Sonar_9': 0.20825914,
        'Sonar_30': 0.5044755, 'Sonar_45': 0.16063125, 'Sonar_2': 0.04383221,
        'Sonar_47': 0.09142404, 'Sonar_43': 0.214075, 'Sonar_12': 0.2733053, 'Sonar_42':
        0.24654183, 'Sonar_7': 0.13479903, 'Sonar_27': 0.694024}
    return data.fillna(impute_values)