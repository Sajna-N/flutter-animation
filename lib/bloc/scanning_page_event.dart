import 'package:equatable/equatable.dart';

abstract class ScanningPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// class DownloadPhotoEvent extends ScanningPageEvent {}

class LoadPhotoEvent extends ScanningPageEvent {}

class ErrorLoadingPhotoEvent extends ScanningPageEvent {}
