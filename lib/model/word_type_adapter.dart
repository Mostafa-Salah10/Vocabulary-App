import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocabulary_app/model/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    return WordModel(
      indexAtDatabase: reader.readInt(),
      word: reader.readString(),
      isArabic: reader.readBool(),
      colorCode: reader.readInt(),
      arabicExamples: reader.readStringList(),
      englishExamples: reader.readStringList(),
      similarArabicWords: reader.readStringList(),
      similarEnglishWords: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.writeBool(obj.isArabic);
    writer.writeInt(obj.colorCode);
    writer.writeInt(obj.indexAtDatabase);
    writer.writeString(obj.word);
    writer.writeStringList(obj.englishExamples);
    writer.writeStringList(obj.arabicExamples);
    writer.writeStringList(obj.similarArabicWords);
    writer.writeStringList(obj.similarEnglishWords);
  }
}
