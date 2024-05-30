

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_api/search-block/search_bloc.dart';

import '../api/data_modal.dart';
import '../api/photos_modal.dart';

class SearchPage extends StatefulWidget {
  String mquery;
  String mcolor;


  SearchPage({required this.mquery,this.mcolor=""});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? controller;
  num totalwallpaper=0;
  int totalnopages=0;
  int pageCount=1;
  List<PhotosModal> allwallpaper=[];


@override
  void initState() {
    super.initState();
    controller=ScrollController();
    controller!.addListener((){
      if(controller!.position.pixels==controller!.position.maxScrollExtent){
        print("end of list");
        totalnopages=totalwallpaper~/15;
        if(totalnopages>pageCount){
          pageCount++;
          context.read<SearchBloc>().add(searchQueryEvent(query: widget.mquery,mcolor:widget.mcolor,mpage:pageCount));

        }else{

        }
      }
    });
    context.read<SearchBloc>().add(searchQueryEvent(query: widget.mquery,mcolor:widget.mcolor));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: searchquerywidet(),
        ),
      )
    );
  }

Widget searchquerywidet(){
  return BlocBuilder<SearchBloc,SearchState>(
      builder: (context,state){
        if(state is SearchLoadingState){
          return Center(child: CircularProgressIndicator());
        }else if (state is SearchErrorState){
          return Text('${state.errormsg}');
        }else if(state is SearchLoadedState){
          totalwallpaper=state.totalwallpaper;

          return state.searchData!=null ?
          Column(
            children: [
              Row(
                children: [
                  Text("${widget.mquery}",style: TextStyle(fontSize: 40,color: Colors.grey.shade400,fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  Text("Total wallpaper found ${state.searchData.total_results}",
                    style: TextStyle(color: Colors.grey.shade500),),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  height:double.infinity,
                  child: GridView.builder(scrollDirection: Axis.vertical,
                       controller:controller ,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3/4
                      ),
                      itemCount:state.searchData.photos!.length,
                      itemBuilder: (context,index){
                        var mData=state.searchData.photos![index];
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ClipRRect(

                            borderRadius: BorderRadius.circular(12),
                              child: Image.network(mData.src!.portrait!,fit: BoxFit.fitWidth,)),
                        );
                      }),
                ),
              ),
            ],
          )

              : Center(child: Text('no data found'));
        }
        return Container();
      });
}

}
