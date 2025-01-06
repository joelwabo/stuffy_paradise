import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:stuffy_paradise/injection.dart';
import 'package:stuffy_paradise/provider/user_session_provider.dart';
import 'package:stuffy_paradise/screens/timer_widget.dart';

import '../models/client.dart';
import '../models/ride.dart';
import '../models/stuffy.dart';
import '../provider/home_screen_provider.dart';

class RideWidget extends StatefulWidget  {
  Ride? ride;
  RideWidget(this.ride, {Key? key}) : super(key: key);

  @override
  _RideWidget createState() => _RideWidget();
}

class _RideWidget extends State<RideWidget>  {
  Ride? ride;
  HomeScreenProvider _provider = getIt();
  UserSessionProvider _userSessionProvider = getIt();

  @override
  void initState() {
    ride = widget.ride;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.data_saver_off),
            SizedBox(
              height: 50,
              width: 200,
              child: CustomDropdown<Client>.search(
                items: _provider.clients,
                initialItem: _provider.getClientFromId(ride?.clientId),
                hintText: 'Select a client',
                noResultFoundBuilder: (_, __) {
                  return InkWell(
                    child: Text(" + Add a new client"),
                    onTap: () {
                      _showAddClientDialog(context);
                    },
                  );
                },
                onChanged: (value) {
                  ride = ride?.copyWith(clientId: value?.id);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: CustomDropdown<Stuffy>.search(
                items: _provider.stuffies,
                initialItem: _provider.getStuffyFromId(ride?.stuffyId),
                hintText: 'Select a stuffy',
                noResultFoundBuilder: (context, __) {
                  return _userSessionProvider.currentUser!.isAdmin
                      ? InkWell(
                    child: Text(" + Add a new stuffy"),
                    onTap: () {
                      _showAddStuffyDialog(context);
                    },
                  )
                      : SizedBox.shrink(); // No option for non-admins
                },
                onChanged: (value) {
                  ride = ride?.copyWith(stuffyId: value?.id);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TimerWidget(
              startTimerCallback: (){
                if(ride?.clientId == null || ride?.stuffyId == null)
                  return;
                if(ride?.id == -1)
                {
                  _provider.createRide(ride!);
                  setState(() {});
                }
              },
              stopTimerCallback: (duration) {
                ride = ride!.copyWith(duration: duration, isComplete: true, cost: _provider.calculateCost(duration));
                _provider.updateRide(ride!);
                setState(() {});
              },
              resetTimerCallback:() {
                ride = ride!.copyWith(duration: 0, isComplete: false, cost: 0);
                _provider.updateRide(ride!);
                setState(() {});
              },
            )
          ],
        ),
        Visibility(
          visible: ride?.isComplete ?? false,
          child:  Row(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text('Last ride : ${ride?.duration} minutes, \$${ride?.cost}'),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: (){
                  ride = ride!.copyWith(isPay: true);
                  _provider.updateRide(ride!);
                  setState(() {});
                },
                child: Text('Pay'),
              )
            ],
          )
        ),
      ],
    );
  }

  void _showAddClientDialog(BuildContext context) {
    HomeScreenProvider _provider = getIt();
    final _formKey = GlobalKey<FormState>();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Client'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'First Name is required'
                        : null,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Last Name is required'
                        : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newClient = Client(
                    id: DateTime.now().millisecondsSinceEpoch,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    email: _emailController.text.isEmpty
                        ? null
                        : _emailController.text,
                    phone: _phoneController.text.isEmpty
                        ? null
                        : _phoneController.text,
                  );
                  _provider.addClient(newClient);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }


  void _showAddStuffyDialog(BuildContext context) {
    HomeScreenProvider _provider = getIt();
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Stuffy'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Stuffy Name'),
                    validator: (value) => value?.isEmpty ?? true ? 'Stuffy Name is required' : null,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) => value?.isEmpty ?? true ? 'Description is required' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newStuffy = Stuffy(
                    id: DateTime.now().millisecondsSinceEpoch,
                    name: _nameController.text,
                  );
                  _provider.createStuffy(newStuffy);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

