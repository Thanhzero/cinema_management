import 'package:json_annotation/json_annotation.dart';

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object json) {
    // if (T == StadiumEntity) {
    //   return StadiumEntity.fromJson(json) as T;
    // } else if (T == TeamEntity) {
    //   return TeamEntity.fromJson(json) as T;
    // } else if (T == PlayerEntity) {
    //   return PlayerEntity.fromJson(json) as T;
    // } else if (T == ProductEntity) {
    //   return ProductEntity.fromJson(json) as T;
    // } else if (T == BannerEntity) {
    //   return BannerEntity.fromJson(json) as T;
    // } else if (T == MatchEntity) {
    //   return MatchEntity.fromJson(json) as T;
    // } else if (T == AttendanceEntity) {
    //   return AttendanceEntity.fromJson(json) as T;
    // } else if (T == PaymentEntity) {
    //   return PaymentEntity.fromJson(json) as T;
    // } else if (T == NotificationEntity) {
    //   return NotificationEntity.fromJson(json) as T;
    // }else if (T == SponsorEntity){
    //   return SponsorEntity.fromJson(json) as T;
    // }else if (T == PlayerEntity){
    //   return PlayerEntity.fromJson(json) as T;
    // }
    // return null;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
