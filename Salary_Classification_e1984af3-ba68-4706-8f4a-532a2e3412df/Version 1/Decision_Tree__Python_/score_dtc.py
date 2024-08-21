import math
import pickle
import pandas as pd
import numpy as np
from pathlib import Path

import settings

with open(Path(settings.pickle_path) / "dtc.pickle", "rb") as pickle_model:
    model = pickle.load(pickle_model)

def score(Age, WorkClass, Education, MartialStatus, Relationship, Race, Sex, HoursPerWeek, GE50K):
    "Output: EM_CLASSIFICATION, EM_EVENTPROBABILITY"

    try:
        global model
    except NameError:
        with open(Path(settings.pickle_path) / "dtc.pickle", "rb") as pickle_model:
            model = pickle.load(pickle_model)


    index=None
    if not isinstance(Age, pd.Series):
        index=[0]
    input_array = pd.DataFrame(
        {"Age": Age, "WorkClass": WorkClass, "Education": Education, "MartialStatus":
        MartialStatus, "Relationship": Relationship, "Race": Race, "Sex": Sex,
        "HoursPerWeek": HoursPerWeek, "GE50K": GE50K}, index=index
    )
    prediction = model.predict_proba(input_array).tolist()

    # Check for numpy values and convert to a CAS readable representation
    if isinstance(prediction, np.ndarray):
        prediction = prediction.tolist()

    if input_array.shape[0] == 1:
        if prediction[0][1] > 0.5:
            EM_CLASSIFICATION = "1"
        else:
            EM_CLASSIFICATION = "0"
        return EM_CLASSIFICATION, prediction[0][1]
    else:
        df = pd.DataFrame(prediction)
        proba = df[1]
        classifications = np.where(df[1] > 0.5, '1', '0')
        return pd.DataFrame({'EM_CLASSIFICATION': classifications, 'EM_EVENTPROBABILITY': proba})