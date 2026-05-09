#include <iostream>
#include <fstream>
#include <string>
#include <locale>
#include <codecvt>

int main() {
  std::ifstream file("/tmp/cava_fifo");
  if (!file.is_open()) {
    std::cerr << "Error: fail to open file" << std::endl;
    return 1;
  }

  std::string visual[] = {"▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"};
    
  std::string line;
  while (std::getline(file, line)) {
    for (char c : line) {
      if (c >= '0' && c <= '7') {
        std::cout << visual[c - '0'];
      }
    }
    std::cout << std::endl;
  }
    
  file.close();
  return 0;
}
