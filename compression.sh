# python main.py
# python jit2pt.py
# mkdir build
# cd build
# cmake -DCMAKE_PREFIX_PATH=E:\python3.10\site-package\torch\bin\lib;E:\libtorch -DCMAKE_BUILD_TYPE=Release -G "cpu_runner" ..

# cd ..
# python run_tokenizer.py
# ./cpu_runner > tokenizer_output.txt < output.txt
# python decoder.py

python main.py