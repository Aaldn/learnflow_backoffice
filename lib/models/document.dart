import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/document_type.dart';

part 'document.freezed.dart';
part 'document.g.dart';

@freezed
class Document with _$Document {
  factory Document({
    required int? id,
    required String? uploadUrl,
    required DocumentType? documentType,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}
