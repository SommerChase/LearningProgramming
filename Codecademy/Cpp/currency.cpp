#include <iostream>

int main() {
  double pesos;
  double reais;
  double soles;
  double dollars;

  std::cout << "Enter number of Colombian Pesos: \n";
  std::cin >> pesos;
  std::cout << "You entered " << pesos << " Pesos \n";

  std::cout << "Enter number of Reais: \n";
  std::cin >> reais;
  std::cout << "You entered " << reais << " Reais \n";

  std::cout << "Enter number of Soles: \n";
  std::cin >> soles;
  std::cout << "You entered " << soles << " Soles \n";
  
  dollars = pesos * .87 + reais * .79 + soles * .23;
  std::cout << "You have " << dollars << " USD!";

  return 0;
}