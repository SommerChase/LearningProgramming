#include <iostream>
#include <string>
#include <set>

int main() {

  std::cout << "Welcome to the WoW class picker!\n";
  std::cout << "Do you prefer to attacker, defender, or healer?\n";
  std::set<std::string> playstyle_options = {"attacker", 
                                            "defender", 
                                            "healer"};
  std::string playstyle; 
  std::cin >> playstyle;

something wrong here
  while (playstyle_options.count(playstyle)) {
    std::cout << "Be sure to type exactly attacker, defender, or healer to continue.\n";
    std::cout << "Do you prefer to attacker, defender, or healer?\n";
    std::string playstyle; 
    std::cin >> playstyle;

  }

  //Attacker route
  if (playstyle == "attacker") {
    std::cout << "Nice, we can always use another " << playstyle << " player!\n";
    std::cout << "For attacker players, there are either melee or ranged classes. Which do you prefer?\n";
    std::string attack_or_ranged; 
    std::cin >> attack_or_ranged;

  }

  //Defender route
  else if (playstyle == "defender") {
    std::cout << "Nice, we can always use another " << playstyle << " player!\n";
    std::cout << "For defender players, there are either melee or ranged classes. Which do you prefer?\n";
    std::string attack_or_ranged; 
    std::cin >> attack_or_ranged;
  }

  //Healer route
  else if (playstyle == "healer") {
    std::cout << "Nice, we can always use another " << playstyle << " player!\n";
    std::cout << "For healer players, there are either melee or ranged classes. Which do you prefer?\n";
    std::string attack_or_ranged; 
    std::cin >> attack_or_ranged;
  }


  return 0;
}