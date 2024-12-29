import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newz_2/features/business/ui/business_ui.dart';
import 'package:newz_2/features/home/bloc/home_bloc.dart';
import 'package:newz_2/features/home/ui/home_webview.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
  int myIndex= 0;
  final screens = [BusinessPage()];

  @override
  void initState() {
    homeBloc.add(PostFetchEvent());
    super.initState();
  }

  Future<void> _refresh() async{
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Newz",style: TextStyle(fontFamily: 'NewzFont',fontWeight: FontWeight.bold,color: Colors.grey[300]),),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value){
                  setState(() {
                     homeBloc.add(SearchPostEvent(value));
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                    filled: true,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )
                ),
              ),
            ),
          ),
          backgroundColor:  Color(0xFF001F3F),
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: BlocConsumer<HomeBloc, HomeState>(
            bloc: homeBloc,
            listenWhen: (previous,current)=> current is HomeActionState,
            buildWhen: (previous,current) => current is !HomeActionState,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              switch(state.runtimeType){
                case PostFetchLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                case PostFetchSuccessfulState:
                  final successState = state as PostFetchSuccessfulState;
                  return Container(
                    child: ListView.builder(itemCount: successState.post.length,itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(successState.post[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text(successState.post[index].description),
                              trailing: successState.post[index].urlToImage.isNotEmpty
                                  ? Image.network(successState.post[index].urlToImage,  fit: BoxFit.cover)
                                  : null,
                              onTap: () async {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewPage(url: successState.post[index].url,)));
                              },
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                case PostFetchErrorState:
                  return Center(
                    child: Column(
                      children: [
                        Text("Something Went Wrong!"),
                        Text("Try Again"),
                      ],
                    ),

                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      /*bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            myIndex  = index;
          });
        },
        currentIndex: myIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.business,),label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer,),label: 'Sports'),
          BottomNavigationBarItem(icon: Icon(Icons.movie_outlined,),label: 'Entertainment'),
          BottomNavigationBarItem(icon: Icon(Icons.phone_android,),label: 'Technology'),

        ],
      ),*/
    );
  }
}
