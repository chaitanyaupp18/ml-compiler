from src.MyNeuralNet import MyNeuralNet
import jax
from jax import jit
import jax.numpy as jnp
import numpy as np
from flax import nnx

import os

BASE_DIR = os.getcwd() + '/representations'

def main():
    batch_size = 3
    input_size = 5
    hidden_size = 10
    output_size = 2

    example_arg = jnp.array(np.random.randn(batch_size, input_size))

    model = MyNeuralNet(input_size=input_size, hidden_size=hidden_size, output_size=output_size, rngs=nnx.Rngs(0))

    print(f"=== Eager Result ===\n")
    eager_ = model(example_arg)
    print(eager_)
    with open(f"{BASE_DIR}/eager_.txt", "w") as f:
        f.write(str(eager_))

    print(f"=== Jaxpr === \n")
    jaxpr_ = jax.make_jaxpr(model)(example_arg)
    print(jaxpr_)
    with open(f"{BASE_DIR}/jaxpr_.txt", "w") as f:
        f.write(str(jaxpr_))

    jit_compiled = jit(model).lower(example_arg)

    print(f"=== StableHLO ===\n")
    stablehlo_ = jit_compiled.compiler_ir(dialect="stablehlo")
    print(stablehlo_)
    with open(f"{BASE_DIR}/stablehlo_.txt", "w") as f:
        f.write(str(stablehlo_))

    print(f"=== XLA HLO ===\n")
    hlo_ = jit_compiled.compiler_ir(dialect="hlo")
    print(hlo_)
    with open(f"{BASE_DIR}/hlo_.txt", "w") as f:
        try:
            f.write(str(hlo_.as_hlo_text()))

        except:
            print(f"Warning: Couldn't write HLO\n")

    compiled_ = jit_compiled.compile()
    print(compiled_(example_arg))
    with open(f"{BASE_DIR}/compiled_.txt", "w") as f:
        f.write(str(compiled_(example_arg)))
        
    
    
    try:
        print("\n=== 6. Cost analysis if available ===")
        print(compiled_.cost_analysis())
        with open(f"{BASE_DIR}/compiled_costAnalysis.txt", "w") as f:
            f.write(str(compiled_.cost_analysis()))
        
    except Exception as e:
        print("Cost analysis unavailable:", e)
    
    
if __name__ == "__main__":
    main()