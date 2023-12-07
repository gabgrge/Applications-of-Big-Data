import pandas as pd, numpy as np


def is_artist_unknown(a):
    if pd.isna(a):
        return np.nan
    if a in ["<Unknown>", "[unknown]"]:
        return True
    else:
        return False
