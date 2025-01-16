import 'package:flutter/material.dart';
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
class HomeScreenProvider extends ChangeNotifier {
  final SqlDatabaseService _dbService = getIt();
  final UserSessionProvider _userSessionProvider = getIt();

  List<Ride> rides = [];
  List<Client> clients = [];
  List<Stuffy> stuffies = [];
  bool isLoading = false;

  HomeScreenProvider(){
    init();
  }

  init() async {
    isLoading = true;
    notifyListeners();

    clients = await _dbService.getClients();
    rides = await _dbService.getRides(isPay: false, userId: _userSessionProvider.currentUser!.id);
    stuffies = await _dbService.getStuffies();

    isLoading = false;
    notifyListeners();
  }

  void addClient(Client client) async {
    clients.add(client);
    notifyListeners();
    await _dbService.createClient(client);
  }

  void createStuffy(Stuffy stuffy) async {
    stuffies.add(stuffy);
    notifyListeners();
    await _dbService.createStuffy(stuffy);
  }

  void addRide() async {
    rides.add(const Ride());
    notifyListeners();
  }

  void updateRide(Ride ride) async {
    final index = rides.indexWhere((r) => r.id == ride.id);
    if (index != -1) {
      rides[index] = ride;
      if(ride.isPay) {
        rides.removeAt(index);
      }
      notifyListeners();
    }
    await _dbService.updateRide(ride);
    //rides = await _dbService.getRides(isPay: false, userId: _userSessionProvider.currentUser!.id);
  }

  Client? getClientFromId(int? id) {
    if(id == null)
      return null;
    return clients.firstWhere((client) => client.id == id);
  }

  Stuffy? getStuffyFromId(int? id) {
    if(id == null)
      return null;
    return stuffies.firstWhere((stuffy) => stuffy.id == id);
  }

  Future<int> createRide(Ride ride) async {
    return await _dbService.createRide(ride, _userSessionProvider.currentUser!.id);
  }

  double calculateCost(int duration) {
    const double baseCost = 9;
    const int baseDuration = 10 * 60; // 10min
    if (duration <= baseDuration) {
      return baseCost;
    }

    const double perSecondCost = 0.0098;

    // Calculate additional minutes after the first 10
    final additionalMinutes = duration - baseDuration;
    final additionalCost = additionalMinutes * perSecondCost;

    final totalCost = baseCost + additionalCost;
    return double.parse(totalCost.toStringAsFixed(2));
  }
}
