if __name__ == '__main__':
    import torch

    print(f'GPU available: {torch.cuda.is_available()} ({torch.cuda.device_count()})')
