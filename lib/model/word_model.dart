class WordModel {
  final String word;
  final bool isArabic;
  final int colorCode;
  final List<String> similarArabicWords;
  final List<String> similarEnglishWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  ///Such as id of each word
  final int indexAtDatabase;

  const WordModel({
    required this.indexAtDatabase,
    required this.word,
    required this.isArabic,
    required this.colorCode,
    this.similarArabicWords = const [],
    this.similarEnglishWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel addSimilarWord({
    required String similarWord,
    required bool isArabicSimilarWord,
  }) {
    List<String> newSimilarWords = _initializeSimilarWords(
      isArabicSimilarWord: isArabicSimilarWord,
    );

    newSimilarWords.add(similarWord);

    return _getSuitableSimilarWordModel(
      isArabicSimilarWord: isArabicSimilarWord,
      newSimilarWords: newSimilarWords,
    );
  }

  WordModel addExample({
    required String example,
    required bool isArabicExample,
  }) {
    List<String> newExamples = _initializeExamples(
      isArabicSimilarWord: isArabicExample,
    );

    newExamples.add(example);

    return _getSuitableExampleWordModel(
      isArabicExample: isArabicExample,
      newExamples: newExamples,
    );
  }

  WordModel deleteSimilarWord({
    required bool isArabicSimilarWord,
    required int wordIndex,
  }) {
    List<String> newSimilarWords = _initializeSimilarWords(
      isArabicSimilarWord: isArabicSimilarWord,
    );
    newSimilarWords.removeAt(wordIndex);

    return _getSuitableSimilarWordModel(
      isArabicSimilarWord: isArabicSimilarWord,
      newSimilarWords: newSimilarWords,
    );
  }

  WordModel deleteExample({
    required bool isArabicExample,
    required int exampleIndex,
  }) {
    List<String> newExamples = _initializeExamples(
      isArabicSimilarWord: isArabicExample,
    );
    newExamples.removeAt(exampleIndex);

    return _getSuitableExampleWordModel(
      isArabicExample: isArabicExample,
      newExamples: newExamples,
    );
  }

  WordModel decrementtIndexWhenDeleteWordModel() {
    return WordModel(
      indexAtDatabase: indexAtDatabase - 1,
      word: word,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
      similarArabicWords: similarArabicWords,
      similarEnglishWords: similarEnglishWords,
    );
  }

  List<String> _initializeSimilarWords({required bool isArabicSimilarWord}) {
    if (isArabicSimilarWord) {
      return List.from(similarArabicWords);
    } else {
      return List.from(similarEnglishWords);
    }
  }

  WordModel _getSuitableSimilarWordModel({
    required bool isArabicSimilarWord,
    required List<String> newSimilarWords,
  }) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      word: word,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
      similarArabicWords:
          isArabicSimilarWord ? newSimilarWords : similarArabicWords,
      similarEnglishWords:
          !isArabicSimilarWord ? newSimilarWords : similarEnglishWords,
    );
  }

  List<String> _initializeExamples({required bool isArabicSimilarWord}) {
    if (isArabicSimilarWord) {
      return List.from(arabicExamples);
    } else {
      return List.from(englishExamples);
    }
  }

  WordModel _getSuitableExampleWordModel({
    required bool isArabicExample,
    required List<String> newExamples,
  }) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      word: word,
      isArabic: isArabic,
      colorCode: colorCode,
      similarArabicWords: similarArabicWords,
      similarEnglishWords: similarEnglishWords,
      arabicExamples: isArabicExample ? newExamples : arabicExamples,
      englishExamples: !isArabicExample ? newExamples : englishExamples,
    );
  }
}
