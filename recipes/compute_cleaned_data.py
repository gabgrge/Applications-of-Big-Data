# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu
from utils import is_artist_unknown


# Read recipe inputs
extracted_data = dataiku.Dataset("extracted_data")
extracted_data_df = extracted_data.get_dataframe()


# Compute recipe outputs from inputs
# Normalize "datetime"
extracted_data_df["datetime"] = pd.to_datetime(extracted_data_df["datetime"], format="%d %b %Y %H:%M")

# Delete datetimes when the date is "1970-01-01"
mask = extracted_data_df["datetime"].dt.date == pd.to_datetime("1970-01-01").date()
extracted_data_df.loc[mask, "datetime"] = np.nan

# Set a boolean column to indicate if "artist" is known or not
extracted_data_df["is_artist_unknown"] = extracted_data_df["artist"].apply(is_artist_unknown)

# Remove unknown artists from "artist"
extracted_data_df.loc[extracted_data_df["artist"] == "<Unknown>", "artist"] = np.nan

# Sort rows
extracted_data_df.sort_values(by=["user", "datetime"], ascending=[True, False], ignore_index=True, inplace=True)

# Add index column
extracted_data_df = extracted_data_df.reset_index()

# Order columns
order = ["index", "user", "artist", "is_artist_unknown", "album", "track", "datetime"]
extracted_data_df = extracted_data_df[order]


# Write recipe outputs
cleaned_data = dataiku.Dataset("cleaned_data")
cleaned_data.write_with_schema(extracted_data_df)