import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stuffy_paradise/injection.dart';
import 'package:stuffy_paradise/provider/user_session_provider.dart';

import '../database/sql_database_service.dart';
import '../models/client.dart';
import '../models/home_screen_model.dart';
import '../models/ride.dart';
import '../models/stuffy.dart';

@lazySingleton
class HomeScreenProvider extends StateNotifier<HomeScreenModel> {
  final SqlDatabaseService _dbService = getIt();
  final UserSessionProvider _userSessionProvider = getIt();

  get clients => state.clients;
  get stuffies => state.stuffies;

  HomeScreenProvider() : super((HomeScreenModel())){
    init();
  }

  init() async {
    state = state.copyWith(isLoading: true);
    final clients = await _dbService.getClients();
    final rides = await _dbService.getRides(isPay: false, userId: _userSessionProvider.currentUser!.id);
    final stuffies = await _dbService.getStuffies();

    state = state.copyWith(
      clients: clients,
      rides: rides,
      stuffies: stuffies,
    );
    state = state.copyWith(isLoading: false);
  }

  void addClient(Client client) async {
    state = state.copyWith(clients: [...state.clients, client]);
    await _dbService.createClient(client);
  }

  void createStuffy(Stuffy stuffy) async {
    state = state.copyWith(stuffies: [...state.stuffies, stuffy]);
    await _dbService.createStuffy(stuffy);
  }

  void addRide() async {
    state = state.copyWith(rides: [...state.rides, const Ride()]);
  }

  void updateRide(Ride ride) async {
    _dbService.updateRide(ride);
    if (ride.isPay) {
      state = state.copyWith(
        rides: state.rides.where((r) => r.id != ride.id).toList(),
      );
    }
  }

  Client? getClientFromId(int? id) {
    if(id == null)
      return null;
    return state.clients.firstWhere((client) => client.id == id);
  }

  Stuffy? getStuffyFromId(int? id) {
    if(id == null)
      return null;
    return state.stuffies.firstWhere((stuffy) => stuffy.id == id);
  }

  void createRide(Ride ride) async {
    state = state.copyWith(isLoading: true);
    ride = ride.copyWith(
      startTime: DateTime.now(),
    );
    _dbService.createRide(ride, 1);

    final rides = await _dbService.getRides(isPay: false, userId: _userSessionProvider.currentUser!.id);
    state = state.copyWith(rides: rides, isLoading: false);
  }

  int calculateCost(int duration) {
    // Base cost for the first 10 minutes
    if (duration <= 10) {
      return 9;
    }

    // Cost for durations over 10 minutes
    const double baseCost = 9.0;
    const double perMinuteCost = 0.50;
    const double maxCost = 38.50;

    // Calculate additional minutes after the first 10
    final additionalMinutes = duration - 10;
    final additionalCost = additionalMinutes * perMinuteCost;

    // Total cost capped at $38.50
    final totalCost = baseCost + additionalCost;
    return (totalCost > maxCost ? maxCost : totalCost).toInt();
  }
}
