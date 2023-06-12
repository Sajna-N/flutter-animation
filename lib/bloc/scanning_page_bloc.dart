// import 'dart:async';
// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:http/http.dart' show get;
// import 'package:path_provider/path_provider.dart';
// import 'package:scan_card/bloc/scanning_page_event.dart';
// import 'package:scan_card/bloc/scanning_page_state.dart';

// class ScanningPageBloc extends Bloc<ScanningPageEvent, ScanningPageState> {
//   ScanningPageBloc() : super(const ScanningPageState());

//   @override
//   Stream<ScanningPageState> mapEventToState(ScanningPageEvent event) async* {
//     if (event is LoadPhotoEvent) {
//       yield* _mapLoadPhotoEventToState();
//     }
//   }

//   Stream<ScanningPageState> _mapLoadPhotoEventToState() async* {
//     try {
//       var url =
//           "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";
//       var response = await get(Uri.parse(url));

//       var documentDirectory = await getApplicationDocumentsDirectory();
//       var firstPath = "${documentDirectory.path}/images";
//       await Directory(firstPath).create(recursive: true);

//       var filePathAndName = '$firstPath/pic.jpg';
//       File file = File(filePathAndName);
//       await file.writeAsBytes(response.bodyBytes);

// import 'dart:io';

//       yield state.copyWith(imageData: filePathAndName);
//     } catch (error) {
//       yield state.copyWith(error: 'Failed to load image');
//     }
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' show get;
// import 'package:path_provider/path_provider.dart';

// import 'scanning_page_event.dart';
// import 'scanning_page_state.dart';

// class ScanningPageBloc extends Bloc<ScanningPageEvent, ScanningPageState> {
//   ScanningPageBloc() : super(const ScanningPageState()) {
//     on<LoadPhotoEvent>((event, emit) {
//       _downloadAndSavePhoto().then((imageData) {
//         emit(state.copyWith(imageData: imageData));
//       }).catchError((error) {
//         emit(state.copyWith(error: 'Failed to load photo'));
//       });
//     });
//   }

//   Future<String?> _downloadAndSavePhoto() async {
//     var url =
//         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";
//     var response = await get(Uri.parse(url));

//     var documentDirectory = await getApplicationDocumentsDirectory();
//     var firstPath = "${documentDirectory.path}/images";
//     await Directory(firstPath).create(recursive: true);

//     var filePathAndName = '$firstPath/pic.jpg';
//     File file = File(filePathAndName);
//     await file.writeAsBytes(response.bodyBytes);

//     return filePathAndName;
//   }
// }

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




// import 'dart:io';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' show get;
// import 'package:path_provider/path_provider.dart';
// import 'package:scan_card/bloc/scanning_page_event.dart';
// import 'package:scan_card/bloc/scanning_page_state.dart';

// class ScanningPageBloc extends Bloc<ScanningPageEvent, ScanningPageState> {
//   ScanningPageBloc() : super(const ScanningPageState()) {
//     on<DownloadPhotoEvent>((event, emit) {
//       _downloadPhoto().then((imageData) {
//         emit(state.copyWith(imageData: imageData));
//       }).catchError((error) {
//         emit(state.copyWith(imageData: null));
//       });
//     });
//   }

//   Future<String?> _downloadPhoto() async {
//     var url =
//         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";
//     var response = await get(Uri.parse(url));

//     var documentDirectory = await getApplicationDocumentsDirectory();
//     var firstPath = "${documentDirectory.path}/images";
//     await Directory(firstPath).create(recursive: true);

//     var filePathAndName = '$firstPath/pic.jpg';
//     File file = File(filePathAndName);
//     await file.writeAsBytes(response.bodyBytes);

//     return filePathAndName;
//   }
// }














// import 'dart:io';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' show get;
// import 'package:path_provider/path_provider.dart';
// import 'package:scan_card/bloc/scanning_page_event.dart';
// import 'package:scan_card/bloc/scanning_page_state.dart';

// class ScanningPageBloc extends Bloc<ScanningPageEvent, ScanningPageState> {
//   ScanningPageBloc() : super(const ScanningPageState());

//   @override
//   Future<void> close() {
//     // Clean up any resources or subscriptions
//     return super.close();
//   }

//   @override
//   Future<void> onEvent(ScanningPageEvent event) async {
//     super.onEvent(event);

//     if (event is DownloadPhotoEvent) {
//       try {
//         String? imageData = await _downloadPhoto();
//         emit(state.copyWith(imageData: imageData));
//       } catch (error) {
//         // Handle any errors that occur during the photo download
//         emit(state.copyWith(imageData: null));
//       }
//     }
//   }

//   Future<String?> _downloadPhoto() async {
//     var url =
//         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg";
//     var response = await get(Uri.parse(url));

//     var documentDirectory = await getApplicationDocumentsDirectory();
//     var firstPath = "${documentDirectory.path}/images";
//     await Directory(firstPath).create(recursive: true);

//     var filePathAndName = '$firstPath/pic.jpg';
//     File file = File(filePathAndName);
//     await file.writeAsBytes(response.bodyBytes);

//     return filePathAndName;
//   }
// }
