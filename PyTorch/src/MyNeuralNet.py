import torch
import torch.nn as nn
import torch.nn.functional as F

class MyNeuralNet(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super(MyNeuralNet, self).__init__()

        self.layer1 = nn.Linear(in_features=input_size, out_features=hidden_size)
        self.layer2 = nn.Linear(in_features=hidden_size, out_features=output_size)

    def forward(self, x):
        y = self.layer1(x)
        return F.relu(self.layer2(y))