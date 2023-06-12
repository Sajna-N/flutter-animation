import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_card/animation/scanning_animation.dart';
import 'package:scan_card/bloc/scanning_page_bloc.dart';
import 'package:scan_card/bloc/scanning_page_event.dart';
import 'package:scan_card/bloc/scanning_page_state.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({Key? key}) : super(key: key);

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  late ScanningPageBloc _scanningPageBloc;

  @override
  void initState() {
    super.initState();
    _scanningPageBloc = ScanningPageBloc();
    _scanningPageBloc.add(LoadPhotoEvent());
  }

  @override
  void dispose() {
    _scanningPageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanningPageBloc, ScanningPageState>(
      bloc: _scanningPageBloc,
      builder: (context, state) {
        print(state);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Scanning Card"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (state.imageData != null)
                  ScanningAnimation(
                    duration: const Duration(seconds: 5),
                    bgImage: state.imageData!,
                    color: Colors.yellow,
                  ),
                if (state.imageData == null && state.error == null)
                  const CircularProgressIndicator(),
                if (state.error != null)
                  Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
