import pandas as pd, numpy as np


def is_artist_unknown(a):
    if pd.isna(a):
        return np.nan
    if a == "<Unknown>":
        return True
    else:
        return False
