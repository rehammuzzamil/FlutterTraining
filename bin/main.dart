import 'dart:io';

main() {
  Solution obj = new Solution();
  obj.analyzeFile();
  obj.calculateLineWithHighestFrequencyAndPrint();
//  obj.printHighestWordFrequencyAcrossLines();
}

class Solution {
  List<String> fileContents;
  Map<String, int> wordCount = new Map();
  List<Map<String,int>> frequentMapData = new List();
  int maxFrequency = 1;
  List<String> analyzeFile() {
    File file = new File('file.txt');
    fileContents = file.readAsLinesSync();
  }

  void calculateLineWithHighestFrequencyAndPrint() {
    List<String> wordsPerLine = new List();
    Map<String, int> lineWise = new Map();
    
    for(String content in fileContents) {//read line by line
      wordsPerLine = content.split(' ');
      lineWise = new Map();
      wordsPerLine.forEach((String word) {
        lineWise[word] = lineWise.containsKey(word) ? lineWise[word] + 1 : 1;
        if(lineWise[word] > maxFrequency) {
          maxFrequency = lineWise[word];
        }
      });
        frequentMapData.add(lineWise);
      }
    MapEntry<String, int> maxEntry = null;
    var freqElementExists = false;
    int lineNumber = 1;
    // now get highest word count along with line number from frequentMapData
    for(Map frequentwordcount in frequentMapData) {
      freqElementExists = false;
      for(MapEntry word in frequentwordcount.entries) {
        if (maxEntry == null || word.value.compareTo(maxEntry.value) >= 0)
        {
          maxEntry = word ;
          freqElementExists = true;
        }
      }
     
      if(freqElementExists == true) {
        print(maxEntry.key + '(appears in line number ' + lineNumber.toString() + ')');
      }
      lineNumber++;
     
    }
    }


  printHighestWordFrequencyAcrossLines() {
//    print();
  }
  
}
