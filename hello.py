import os
from finetune import train

os.environ['WORLD_SIZE'] = '2'
os.environ['CUDA_VISIBLE_DEVICES'] = '0,1'

base_model = 'yahma/llama-7b-hf'
data_path = 'ft-training_set/math_10k.json' 
output_dir = './trained_models/llama-lora' 
batch_size = 16 
micro_batch_size = 4 
num_epochs = 3 
learning_rate = 3e-4 
cutoff_len = 256 
val_set_size = 120 
adapter_name = 'lora'

train(base_model=base_model,
        data_path=data_path,
        output_dir=output_dir,
        batch_size=batch_size,
        micro_batch_size=micro_batch_size,
        num_epochs=num_epochs,
        learning_rate=learning_rate,
        cutoff_len=cutoff_len,
        val_set_size=val_set_size,
        adapter_name=adapter_name
        )