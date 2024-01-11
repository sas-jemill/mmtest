import numpy
import pandas as pd
import pickle
import settings

with open(settings.pickle_path + "hmeq_logistic.pickle", "rb") as _pickle_file:
    _thisModelFit = pickle.load(_pickle_file)


def score_hmeq_log_reg_model(REASON, JOB, YOJ, DEROG, DELINQ, CLAGE, NINQ, CLNO, DEBTINC):
    "Output: EM_CLASSIFICATION, EM_EVENTPROBABILITY"
    
    try:
        global _thisModelFit
    except NameError:
        with open(settings.pickle_path + "hmeq_logistic.pickle", "rb") as _file:
            _thisModelFit = pickle.load(_file)

    # Threshold for the misclassification error (BAD: 0-No, 1-Yes)
    threshold = 0.08941485864562787 

    # If/Else block to differentiate between single and batch data
    if not isinstance(JOB, pd.Series):
        index = [0]
    else:
        index = None

    input_array = pd.DataFrame(
        {
            "JOB": JOB,
            "REASON": REASON,
            "CLAGE": CLAGE,
            "CLNO": CLNO,
            "DEBTINC": DEBTINC,
            "DELINQ": DELINQ,
            "DEROG": DEROG,
            "NINQ": NINQ,
            "YOJ": YOJ
        },
        index=index
    )

    input_array = impute_missing_values(input_array)

    JOB_expected = ["Mgr", "Office", "Other", "ProfExe", "Sales"]
    input_array["JOB"] = input_array["JOB"].str.strip()
    JOB_dummies = pd.get_dummies(JOB, prefix="JOB", prefix_sep="_")
    JOB_dummies = JOB_dummies.reindex(
        columns=[f"JOB_{value}" for value in JOB_expected], fill_value=0.0
    )

    input_array["REASON"] = input_array["REASON"].str.strip()
    REASON_dummies = pd.DataFrame(
        numpy.where(input_array["REASON"] == "DebtCon", 1.0, 0.0),
        columns=["REASON_DebtCon"]
    )

    input_array = input_array.drop(["JOB", "REASON"], axis=1)
    input_array = pd.concat([input_array, JOB_dummies, REASON_dummies], axis=1)

    input_array.insert(0, "const", 1.0)

    prediction = _thisModelFit.predict(input_array).values.tolist()

    if isinstance(prediction, numpy.ndarray):
        prediction = prediction.tolist()

    if input_array.shape[0] == 1:
        if prediction[0][1] > threshold:
            EM_CLASSIFICATION = "1"
        else:
            EM_CLASSIFICATION = "0"
        return EM_CLASSIFICATION, prediction[0][1]
    else:
        df = pd.DataFrame(prediction)
        proba = df[1]
        classifications = numpy.where(df[1] > threshold, "1", "0")
        return pd.DataFrame(
            {"EM_CLASSIFICATION": classifications, "EM_EVENTPROBABILITY": proba}
        )


def impute_missing_values(data):
    impute_values = {
        "CLAGE": 173.46666666666600,
        "CLNO": 20.0,
        "DEBTINC": 34.81826181858690,
        "DELINQ": 0.45,
        "YOJ": 8.96954921803128,
        "DEROG": 0.0,
        "NINQ": 0.0,
        "JOB": "Other",
        "REASON": "DebtCon"
    }
    return data.fillna(impute_values)
