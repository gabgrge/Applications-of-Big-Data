# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu


# Read recipe inputs
extracted_data = dataiku.Dataset("extracted_data")
extracted_data_df = extracted_data.get_dataframe()


# Compute recipe outputs from inputs




# Write recipe outputs
cleaned_data = dataiku.Dataset("cleaned_data")
cleaned_data.write_with_schema(cleaned_data_df)
