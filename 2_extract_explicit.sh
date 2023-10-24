#!/bin/bash

DATASET_DIR='unbalanced'

python build_wikidata_entity_db.py --step=2 --split_type=train --img_root=$DATASET_DIR
python build_wikidata_entity_db.py --step=2 --split_type=val --img_root=$DATASET_DIR