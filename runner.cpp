#include <torch/script.h> // One-stop header.
#include <iostream>
#include <bits/stdc++.h>
#include <memory>
// using namespace std;
// std::ifstream fin("tokenizer_output.txt");
// std::ofstream fout("output.txt");
int main()
{
    // Deserialize the ScriptModule from a file using torch::jit::load().
    std::shared_ptr<torch::jit::script::Module> module = torch::jit::load("C:\\Users\\workAI\\llama2CPU\\model.pt");
    assert(module != nullptr);
    std::cout << "model working add completed!\n";
    // Create a vector of inputs.
    std::vector<torch::jit::IValue> inputs;
    int seq[512] = {0};
    while (1)
    {
        int i = 0;
        memset(seq, 0, sizeof(seq));
        char c;
        std::string str;
        while (c = getchar() != '\n')
        {
            if (c == ',')
            {
                int dig = std::atoi(str.c_str());
                seq[i++] = dig;
                str.clear();
            }
            if (isdigit(c))
                str += c;
        }
        inputs.push_back(torch::tensor(seq));

        // Execute the model and turn its output into a tensor.
        at::Tensor output = module->forward(inputs).toTensor();
        // auto out = torch::stack(output).type(torch::long);
        // std::cout << out;

        std::cout << output.slice(/*dim=*/1, /*start=*/0, /*end=*/5) << '\n';
    }
    while (1)
        ;
}
