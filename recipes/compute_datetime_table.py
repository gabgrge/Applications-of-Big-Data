# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Read "cleaned_data" DataFrame
cleaned_data = dataiku.Dataset("cleaned_data")
listenings_df = cleaned_data.get_dataframe()

# Compute "datetime" DataFrame
datetime_df = listenings_df[["datetime"]].drop_duplicates().sort_values(ignore_index=True, by="datetime", ascending=False)
datetime_df["date"] = datetime_df["datetime"].dt.date
datetime_df["time"] = datetime_df["datetime"].dt.time
datetime_df["year"] = datetime_df["datetime"].dt.year
datetime_df["month"] = datetime_df["datetime"].dt.month
datetime_df["week"] = datetime_df["datetime"].dt.week
datetime_df["day"] = datetime_df["datetime"].dt.day


# Write recipe outputs
datetime = dataiku.Dataset("datetime")
datetime.write_with_schema(datetime_df)
