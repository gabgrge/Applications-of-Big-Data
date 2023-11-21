# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu
from utils import is_artist_unknown

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: MARKDOWN
# # Read recipe inputs

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
extracted_data = dataiku.Dataset("extracted_data")
extracted_data_df = extracted_data.get_dataframe()

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: MARKDOWN
# # Compute recipe outputs from inputs

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: MARKDOWN
# ## Normalize "datetime"

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
extracted_data_df["datetime"] = pd.to_datetime(extracted_data_df["datetime"], format="%d %b %Y %H:%M")

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
extracted_data_df["date"] = extracted_data_df["datetime"].dt.date
extracted_data_df["time"] = extracted_data_df["datetime"].dt.time
extracted_data_df["year"] = extracted_data_df["datetime"].dt.year
extracted_data_df["month"] = extracted_data_df["datetime"].dt.month
extracted_data_df["day"] = extracted_data_df["datetime"].dt.day

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: MARKDOWN
# ## Clean "datetime"

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Delete datetimes when the date is "1970-01-01"
mask = extracted_data_df["date"] == pd.to_datetime("1970-01-01").date()
cols_to_reset = ["datetime", "date", "time", "year", "month", "day"]
extracted_data_df.loc[mask, cols_to_reset] = np.nan

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: MARKDOWN
# ## Clean "artist"

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
# Set a boolean column to indicate if "artist" is known or not
extracted_data_df["is_artist_unknown"] = extracted_data_df["artist"].apply(is_artist_unknown)
# Remove unknown artists from "artist"
extracted_data_df.loc[extracted_data_df["artist"] == "<Unknown>", "artist"] = np.nan

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: MARKDOWN
# # Write recipe outputs

# -------------------------------------------------------------------------------- NOTEBOOK-CELL: CODE
cleaned_data = dataiku.Dataset("cleaned_data")
cleaned_data.write_with_schema(extracted_data_df)