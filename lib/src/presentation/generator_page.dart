import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_data_generator/src/data/use_cases/get_random_person_use_case.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clipboard/clipboard.dart';
import 'package:change_case/change_case.dart';
import 'package:date_format/date_format.dart';

class GeneratorPage extends ConsumerWidget {
  final String title;
  const GeneratorPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var person = ref.watch(personFutureProvider);
    return Scaffold(
      body: person.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error: $err'),
          data: (p) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.cyan.shade100],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Center(
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        personRow('First name: ', p.firstName, context),
                        personRow('Middle initial: ', p.middleInitial, context),
                        personRow('Last name: ', p.lastName, context),
                        personRow('Gender: ', p.gender.name.toTitleCase(), context),
                        personRow('Age: ', p.age.toString(), context),
                        personRow(
                            'Birthdate: ', formatDate(p.birthdate, [mm, '/', dd, '/', yyyy]), context),
                        personRow('Email address: ', p.email, context),
                        personRow('Phone number: ', p.phone, context),
                        personRow('Street address: ', p.addressLine1, context),
                        personRow('City: ', p.city, context),
                        personRow('State: ', p.state, context),
                        personRow('Zip Code: ', p.postalCode.toString(), context),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () => {ref.refresh(personFutureProvider)},
                                  child: const Text("Refresh")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
                ),
            ]);
          }),
    );
  }

  Widget personRow(String label, String value, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
          )
        ),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Expanded(child: Text(value)),
          Expanded(
              child: TextButton(
                  onPressed: () => {
                        FlutterClipboard.copy(value).then((_) => {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('$label $value copied to clipboard')))
                            })
                      },
                  child: const FaIcon(FontAwesomeIcons.copy)))
        ],
      ),
    );
  }
}
