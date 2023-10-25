import argparse
import json
import pickle
from pathlib import Path


# Export to KAT .pkl file, to be used in KAT model
def convert_to_KAT_pkl(path_to_ds):
    splits = ['train', 'test']

    for spl in splits:
        qa_file_path = path_to_ds + '/' + spl + '.json'
        if not Path(qa_file_path).exists():
            continue

        with open(qa_file_path) as f:
            qa_data = json.load(f)

        question = {}
        answers = {}

        for q in qa_data['questions']:
            key = f"{q['image_name']}#{q['image_id']}"
            question[key] = q['question']
            answers[key] = q['answers']

        with open(path_to_ds + '/' + spl + '.pkl', 'wb') as f:
            pickle.dump((question, answers), f)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--path_to_ds', type=str, required=True, help='Path to dataset')
    args = parser.parse_args()

    convert_to_KAT_pkl(args.path_to_ds)
