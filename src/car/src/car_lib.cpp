#include "car/car_lib.h"

namespace car
{
  void loadMap()
  {
    std::istream input;
    std::string csvLine;
    std::vector<std::vector<std::string>> output;
    // read every line from the stream
    while(std::getline(input, csvLine) )
    {
      std::istringstream csvStream(csvLine);
      std::vector<string> csvColumn;
      std::string csvElement;
      // read every element from the line that is seperated by commas
      // and put it into the vector or strings
      while(std::getline(csvStream, csvElement, ',') )
      {
        csvColumn.push_back(csvElement);
      }
      output.push_back(csvColumn);
    }
  }
}
