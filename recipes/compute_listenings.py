# -*- coding: utf-8 -*-
import dataiku
import pandas as pd, numpy as np
from dataiku import pandasutils as pdu

# Read recipe inputs
cleaned_data = dataiku.Dataset("cleaned_data")
cleaned_data_df = cleaned_data.get_dataframe()


# Compute recipe outputs from inputs
# TODO: Replace this part by your actual code that computes the output, as a Pandas dataframe
# NB: DSS also supports other kinds of APIs for reading and writing data. Please see doc.

listenings_df = cleaned_data_df # For this sample code, simply copy input to output


# Write recipe outputs
listenings = dataiku.Dataset("listenings")
listenings.write_with_schema(listenings_df)
