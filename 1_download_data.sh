#!/bin/bash

# Install gdown
pip install --upgrade --no-cache-dir gdown

# Download dataset - unbalanced
ZIP_ID='1XyCADScVZPvgAwuecXmC3jObFocUdr-4'
ZIP_NAME='unbalanced.zip'
gdown $ZIP_ID -O $ZIP_NAME
unzip -q $ZIP_NAME
rm $ZIP_NAME

# Download dataset - balanced 10
ZIP_ID='1PqmLPxI5wwMirh7VZXii3Ct6FSjqDvPq'
ZIP_NAME='balanced_10.zip'
gdown $ZIP_ID -O $ZIP_NAME
unzip -q $ZIP_NAME
rm $ZIP_NAME

# Download ontology
FILE_ID='1ilVg232w96ZDc8NaD_pCMUJcxOQTt11A'
gdown $FILE_ID

# Download FAISS index database
ZIP_ID='1XwJBdE5YzZYUDiCOKUBGq2nBp63BlGgO'
ZIP_NAME='embeddings.zip'
gdown $ZIP_ID -O $ZIP_NAME
unzip -q $ZIP_NAME
rm $ZIP_NAME
