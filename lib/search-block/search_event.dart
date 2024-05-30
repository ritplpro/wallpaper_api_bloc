part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class searchQueryEvent extends SearchEvent{
  String query;
  String mcolor;
  int mpage;

  searchQueryEvent({required this.query,required this.mcolor,this.mpage=1});
}

