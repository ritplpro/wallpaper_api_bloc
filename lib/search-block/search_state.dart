part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

 class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}



class SearchLoadedState extends SearchState {
  DataModal searchData;
  int totalwallpaper;
  SearchLoadedState({required this.searchData,required this.totalwallpaper});
}


class SearchErrorState extends SearchState {
  String errormsg;
  SearchErrorState({required this.errormsg});
}

