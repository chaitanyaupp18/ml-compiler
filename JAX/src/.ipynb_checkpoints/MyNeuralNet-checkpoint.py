import jax
import jax.numpy as jnp
from jax import jit
from flax import nnx

class MyNeuralNet(nnx.Module):
    def __init__(self, input_size:int, hidden_size:int, output_size:int, *, rngs:nnx.Rngs):

        self.layer1 = nnx.Linear(input_size, hidden_size, rngs=rngs)
        self.layer2 = nnx.Linear(hidden_size, output_size, rngs=rngs)

    def __call__(self, x:jax.Array):
        y = self.layer1(x)
        return nnx.relu(self.layer2(y))