# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu
import os


# Read recipe inputs
raw_data = dataiku.Folder("GRPMFszm")
raw_data_path = raw_data.get_path()
files = raw_data.list_paths_in_partition()


# Compute recipe outputs
# Define the resulting DataFrame
extracted_data_df = pd.DataFrame()

# Cycle through folder paths
for file in files:
    print(f"Extraction of '{file}'")
    
    # Get file path
    path = os.path.join(raw_data_path, file[1:])
    
    try:
        # Read user listening history
        df = pd.read_csv(path, header=None, names=["artist", "album", "track", "datetime"])
        
        # Get user name
        username = file[1:].split(".")[0]
        df["usr"] = username
        
        # Concatenate listening histories
        extracted_data_df = pd.concat([extracted_data_df, df])

    except Exception as e:
        print(e)


# Write recipe outputs
extracted_data = dataiku.Dataset("extracted_data")
extracted_data.write_with_schema(extracted_data_df)
