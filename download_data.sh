#!/bin/bash

# Install gdown
pip install --upgrade --no-cache-dir gdown

# Download dataset
ZIP_ID='1MYcKvtQY5QCC1Cc3VSTDlyJgOFBBtdiN'
ZIP_NAME='ds.zip'
gdown $ZIP_ID
unzip -q $ZIP_NAME
rm $ZIP_NAME

# Download ontology
FILE_ID='1ilVg232w96ZDc8NaD_pCMUJcxOQTt11A'
gdown $FILE_ID

# Download FAISS index database
ZIP_ID='1XwJBdE5YzZYUDiCOKUBGq2nBp63BlGgO'
ZIP_NAME='embeddings.zip'
gdown $ZIP_ID
unzip -q $ZIP_NAME
rm $ZIP_NAME
