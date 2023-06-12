import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' show get;
import 'package:path_provider/path_provider.dart';

import 'scanning_page_event.dart';
import 'scanning_page_state.dart';

class ScanningPageBloc extends Bloc<ScanningPageEvent, ScanningPageState> {
  ScanningPageBloc() : super(const ScanningPageState()) {
    on<LoadPhotoEvent>((event, emit) async {
      // initialState();
      await _downloadAndSavePhoto().then((imageData) {
        if (imageData != null) {
          emit(state.copyWith(imageData: imageData));
        } else {
          emit(state.copyWith());
        }
      }).catchError((error) {
        print(error);
        emit(state.copyWith(error: error));
      });
    });
  }

  Future<String?> _downloadAndSavePhoto() async {
    var url =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";
    var response = await get(Uri.parse(url));

    var documentDirectory = await getApplicationDocumentsDirectory();
    var firstPath = "${documentDirectory.path}/images";
    await Directory(firstPath).create(recursive: true);

    var filePathAndName = '$firstPath/pic.jpg';
    File file = File(filePathAndName);
    await file.writeAsBytes(response.bodyBytes);

    return filePathAndName;
  }
}
