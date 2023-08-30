import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_type.freezed.dart';
part 'document_type.g.dart';

@freezed
class DocumentType with _$DocumentType {
  factory DocumentType({
    @JsonKey(name: '_id') required String? id,
    required String? name,
  }) = _DocumentType;

  factory DocumentType.fromJson(Map<String, dynamic> json) =>
      _$DocumentTypeFromJson(json);
}
