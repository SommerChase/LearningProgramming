#include <iostream>
#include <stdlib.h>
#include <time.h>
#include <map>
#include <string>

int main() {
  /*
  This game will be similar to rock-paper-scissors, but with added fun.
  */
  srand (time(NULL));

  int computer = rand() % 3 + 1;
  std::string user;
  std::map<std::string, int> rpc_map = {
    {"rock",     1},
    {"paper",    2},
    {"scissors", 3}
  };
    std::map<int, std::string> rpc_map_2 = {
    {1, "rock"},
    {2, "paper"},
    {3, "scissors"}
  };

  std::cout << "====================\n";
  std::cout << "Rock Paper Scissors!\n";
  std::cout << "====================\n";
  std::cout << "rock\n";
  std::cout << "paper\n";
  std::cout << "scissors\n";
  std::cout << "shoot!\n";
  std::cout << "What's your move? Type out word:\n";
  std::cin >> user;
  std::cout << "Computer: " << rpc_map_2[computer] << " User: " << user;

  //edge case of rock (1) being higher than scissors (3)
  if (user == "rock" && computer == 3) {
    std::cout << "\nYou win!\n";
  }
  else if (rpc_map[user] > computer) {
    std::cout << "\nYou win!\n";
  }
  else if (rpc_map[user] < computer) {
    std::cout << "\nYou lose\n";
  }
  else if (rpc_map[user] == computer) {
  std::cout << "\nTie game\n";
  }

}