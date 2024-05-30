
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_api/app-constatnts/app_constants.dart';
import 'package:wallpaper_api/screens/search-page.dart';
import 'package:wallpaper_api/wallpaper-bloc/wallpaper_bloc.dart';
import 'package:wallpaper_api/wallpaper-bloc/wallpaper_event.dart';
import '../wallpaper-bloc/wallpaper_state.dart';
class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var searchController=TextEditingController();

  @override
  void initState() {
    context.read<WallpaperBloc>().add(getApiDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height * 1;
    var width=MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("4K Wallpaper"),
        actions: [
          //IconButton(onPressed: (){}, icon:Icon(Icons.search_sharp,color: Colors.grey.shade100,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
        ],

      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller:searchController,
                keyboardType: TextInputType.text,
                decoration:InputDecoration(
                  hintText: "Find wallpaper",
                  hintStyle: TextStyle(color:Colors.grey.shade400),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed:(){
                      searchController.clear();
                      if(searchController.text.isNotEmpty){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchPage(mquery: searchController.text.toString(),)));



                      }


                    },icon: Icon(Icons.search,color: Colors.grey.shade400,)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent
                    )
                  ),
                  border:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  )
                ),


              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Best of the month ",style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height:10,),
              bestofmonthcategary(),
              SizedBox(height:10,),
              Row(
                children: [
                  Text("The Color Tone",style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height:10,),
              getColortoneWidget(),
              SizedBox(height:10,),
              Row(
                children: [
                  Text("Catogeries ",style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              SizedBox(height:10,),
              catogarywidget(),


            ],
          ),
        ),
      ),
    );
  }


    Widget getColortoneWidget(){
      return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 65,
          child: GridView.builder(
              shrinkWrap: true,
              scrollDirection:Axis.horizontal,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,

          ),
              itemCount: AppConstants.mcategory.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>SearchPage(mquery: searchController.text.toString().isEmpty ?"nature" :searchController.text.toString(),
                      mcolor: AppConstants.mcategory[index]["code"])));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        color: AppConstants.mcategory[index]["color"]
                    
                      ),
                    
                    ),
                  ),
                );
              }),
        ),
      );
    }
// category  function 
    Widget catogarywidget(){
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height:500,
          child: GridView.builder(
            shrinkWrap: true,
              scrollDirection:Axis.vertical,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 7/4

          ),
          itemCount: AppConstants.mcategory.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SearchPage(mquery: AppConstants.mcategory[index]["title"])));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(
                        image:AssetImage(AppConstants.mcategory[index]["image"]),fit: BoxFit.fill )
                  ),
                  child: Center(child: Text(AppConstants.mcategory[index]["title"],
                    style: TextStyle(color: Colors.white,fontSize: 20,
                    fontWeight: FontWeight.bold),)),
                  ),
              ),
            );
          }),
        ),
      );
    }

    //best of month widget function

  Widget bestofmonthcategary(){
    return BlocBuilder<WallpaperBloc,WallpaperState>(
        builder: (context,state){
      if(state is WallpaperLoadingState){
        return Center(child: CircularProgressIndicator());
      }else if (state is WallpaperErrorState){
        return Text('${state.errormsg}');
      }else if(state is WallpaperLoadedState){
        return state.resData.photos!=null ?
            Container(
              height:200,
              child: ListView.builder(scrollDirection: Axis.horizontal,
                  itemCount:state.resData.photos!.length,
                  itemBuilder: (context,index){
                var mData=state.resData.photos![index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                      child: Image.network(mData.src!.original!)),
                );
                  }),
            )

            : Center(child: Text('no data found'));
      }
      return Container();
    });
  }



}
