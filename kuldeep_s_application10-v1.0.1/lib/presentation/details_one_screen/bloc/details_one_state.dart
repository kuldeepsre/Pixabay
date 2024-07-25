// ignore_for_file: must_be_immutable

part of 'details_one_bloc.dart';

/// Represents the state of DetailsOne in the application.
class DetailsOneState extends Equatable {
  DetailsOneState({this.detailsOneModelObj});

  DetailsOneModel? detailsOneModelObj;

  @override
  List<Object?> get props => [
        detailsOneModelObj,
      ];

  DetailsOneState copyWith({DetailsOneModel? detailsOneModelObj}) {
    return DetailsOneState(
      detailsOneModelObj: detailsOneModelObj ?? this.detailsOneModelObj,
    );
  }
}
