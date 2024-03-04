import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/model/news_channel_headlines.dart';
import 'package:newsapp/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 enum FliterList{
  bbcNews,aryNews,independent,reuters,cnn,alJazeera
 }

class _HomeScreenState extends State<HomeScreen> {
  NewViewModel newsViewModel=NewViewModel();
  final format=DateFormat("MMMM dd,yyyy");
  FliterList? selectedMenu;
  String name="bbc-news";
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.sizeOf(context).width*1;
    final height=MediaQuery.sizeOf(context).height * 1;
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
       onPressed: (){

       },
        icon:Image.asset('images/category_icon.png',
        height:30 ,
        width: 30,
        )),
        centerTitle: true,
        title:  Text('NEWS',
        style: GoogleFonts.poppins(fontSize: 24,
        fontWeight: FontWeight.w700,
        ),),
        actions: [
         PopupMenuButton<FliterList>(
          initialValue: selectedMenu,
          icon:const Icon(Icons.more_vert,color: Colors.black,),
          onSelected:(FliterList item) {
            if(FliterList.bbcNews.name ==item.name){
              name=="bbc-news";
            }
             if(FliterList.aryNews.name ==item.name){
              name="ary-news";
            }
              if(FliterList.independent.name ==item.name){
              name="independent-news";
            }
             if(FliterList.alJazeera.name ==item.name){
              name="alJazeera-news";
            }
              if(FliterList.cnn.name ==item.name){
              name="cnn-news";
            }
             if(FliterList.reuters.name ==item.name){
              name="reuters-news";
            }
            setState(() {
              selectedMenu=item;
            });
          },
          itemBuilder: (context)=><PopupMenuEntry<FliterList>>[
          const  PopupMenuItem<FliterList>(
             value:FliterList.bbcNews ,
              child: Text("BBC News")),
               const  PopupMenuItem<FliterList>(
             value:FliterList.aryNews ,
              child: Text("Ary News")),
               const  PopupMenuItem<FliterList>(
             value:FliterList.independent ,
              child: Text("Independent News")),
               const  PopupMenuItem<FliterList>(
             value:FliterList.alJazeera ,
              child: Text("AlJazeera News")),
               const  PopupMenuItem<FliterList>(
             value:FliterList.cnn ,
              child: Text("CNN News")),
               const  PopupMenuItem<FliterList>(
             value:FliterList.reuters ,
              child: Text("reuters News"))
          ])
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: height*.55,
            width: width,
           // color: Colors.green,
            child: FutureBuilder<NewsHeadLines>(
              future: newsViewModel.fetchNewsHeadlineApi(),
               builder:(context, snapshot){
                 if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: SpinKitCircle(
                      size: 50,
                      color: Colors.blue,
                    ),
                  );

                 }else{

                  return  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime=DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                      return Padding(
                        padding:EdgeInsets.all(9),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: height * 16,
                          width: width * 0.9,

                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>Container(
                                child: spinkit2,
                              ),
                              errorWidget: (context, url, error) =>const Icon(Icons.error_outline,color: Colors.red,) ,
                            ),
                          )
                        ),
                        Positioned(
                          bottom: 0,
                          child: Card(
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Container(
                             padding:const EdgeInsets.all(15),
                              height:height*0.22 ,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Container(
                                  width: width*0.7,
                                  child: Text(snapshot.data!.articles![index].title.toString(),
                                  style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w700),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                  
                                ),
                              const  Spacer(),
                                Container(
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(snapshot.data!.articles![index].source!.name.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w600),
                                      
                                      ),
                                      SizedBox(width: width *0.3,),
                                      Text(format.format(dateTime),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ) ,
                                )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                    },);
                 }
               },),
          )
        ],
      ),
    );
  }

 }
  const spinkit2=SpinKitFadingCircle(
    color: Colors.amber,
    size: 50,
  );