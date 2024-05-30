


import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_api/api/data_modal.dart';
import '../repositry/wallpaper_repositry.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  WallpaperRepositry wallpaperRepositry;

  SearchBloc({required this.wallpaperRepositry,}) : super(SearchInitialState()) {


    on<searchQueryEvent>((event, emit) async {
      emit(SearchLoadingState());
      try{
        var seacrhData=await wallpaperRepositry.searchQueryWidget(mquery: event.query,mcolor:event.mcolor,mpage: event.mpage!);
        var dataModal=DataModal.fromjson(seacrhData);
        emit(SearchLoadedState(searchData: dataModal,totalwallpaper: dataModal.total_results!));
      }catch(e){
        emit(SearchErrorState(errormsg:e.toString()));
      }

    });
  }
}
