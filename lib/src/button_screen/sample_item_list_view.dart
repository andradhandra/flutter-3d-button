import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Center(
        child: Container(
          height: 50,
          width: 250,
          child: const Text(
            "Mohon Ditekan",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              border: Border.all(color: Colors.white),
              boxShadow: [BoxShadow()]),
        ),
      ),
    );
  }
}
