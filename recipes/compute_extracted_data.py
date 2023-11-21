# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Read recipe inputs
raw_data = dataiku.Folder("GRPMFszm")
raw_data_info = raw_data.get_info()


# Compute recipe outputs
# TODO: Write here your actual code that computes the outputs
# NB: DSS supports several kinds of APIs for reading and writing data. Please see doc.

extracted_data_df = ... # Compute a Pandas dataframe to write into extracted_data


# Write recipe outputs
extracted_data = dataiku.Dataset("extracted_data")
extracted_data.write_with_schema(extracted_data_df)
