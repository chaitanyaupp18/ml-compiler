from src.MyNeuralNet import MyNeuralNet
import torch
import torch_mlir
from torch.fx import symbolic_trace
from torch_mlir import fx
import os

BASE_DIR=os.getcwd() + 'representations'

def main():
    batch_size = 3
    input_size = 5
    hidden_size = 10
    output_size = 2

    example_arg = torch.randn(batch_size, input_size)

    model = MyNeuralNet(input_size=input_size, hidden_size=hidden_size, output_size=output_size)

    # Dumping the graph depiction of the model
    graph_model = symbolic_trace(model)

    print(f"=== Graph Model ===\n")
    print(graph_model)
    print("\n")
    with open(BASE_DIR+"/graph_model.txt", "w") as f:
        f.write(str(graph_model))

    dialects = ["torch", "linalg-on-tensors"]
    
    mlir_dialects = {}
    
    for D in dialects:
        mlir_dialects[D] = fx.export_and_import(model, example_arg, output_type=D)

    for D in dialects:
        with open(f"{BASE_DIR}/mlir_{D}.mlir", "w") as f:
            f.write(str(mlir_dialects[D]))
    

if __name__ == "__main__":
    main()