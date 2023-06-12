// class ScanningPageState extends Equatable {
//   final String? imageData;
//   final String? error;

//   const ScanningPageState({this.imageData, this.error});

//   ScanningPageState copyWith({String? imageData, String? error}) {
//     return ScanningPageState(
//       imageData: imageData ?? this.imageData,
//       error: error ?? this.error,
//     );
//   }

//   @override
//   List<Object?> get props => [imageData];
// }

class ScanningPageState {
  final String? imageData;
  final String? error;

  const ScanningPageState({this.imageData, this.error});

  ScanningPageState copyWith({String? imageData, String? error}) {
    return ScanningPageState(
      imageData: imageData ?? this.imageData,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [imageData, error];
}

// class loadingState extends {}