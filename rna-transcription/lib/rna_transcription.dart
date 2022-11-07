class RnaTranscription {
  // Put your code here
  String toRna(String Dna) {
    List<String> dnaList = Dna.split('');
    String rna = '';
    for (var dna in dnaList) {
      switch (dna) {
        case 'A':
          rna += 'U';
          break;
        case 'T':
          rna += 'A';
          break;
        case 'C':
          rna += 'G';
          break;
        case 'G':
          rna += 'C';
          break;
      }
    }
    return rna;
  }
}
