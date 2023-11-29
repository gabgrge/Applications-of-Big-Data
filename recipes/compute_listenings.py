# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Read recipe inputs
cleaned_data = dataiku.Dataset("cleaned_data")
cleaned_data_df = cleaned_data.get_dataframe()


listenings_df = cleaned_data_df


# Write recipe outputs
listenings = dataiku.Dataset("listenings")
listenings.write_with_schema(listenings_df)
