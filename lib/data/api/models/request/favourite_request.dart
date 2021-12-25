import 'package:json_annotation/json_annotation.dart';

part 'favourite_request.g.dart';

@JsonSerializable()
class FavouriteRequest {
  String? itemId;
  String? source;

  FavouriteRequest(this.itemId, this.source);

  @override
  String toString() {
    return 'FavouriteRequest{itemId:$itemId, source: $source}';
  }

  factory FavouriteRequest.fromJson(Map<String, dynamic> json) => _$FavouriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteRequestToJson(this);
}
