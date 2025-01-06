import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stuffy_paradise/models/client.dart';
import 'package:stuffy_paradise/models/ride.dart';
import 'package:stuffy_paradise/models/stuffy.dart';

part 'home_screen_model.freezed.dart';
part 'home_screen_model.g.dart';

@freezed
class HomeScreenModel with _$HomeScreenModel{
  const factory HomeScreenModel({
    @Default([]) List<Ride> rides,
    @Default([]) List<Client> clients,
    @Default([]) List<Stuffy> stuffies,
    @Default(false) bool isLoading,
  }) = _HomeScreenModel;

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenModelFromJson(json);
}
