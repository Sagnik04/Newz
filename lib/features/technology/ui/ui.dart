import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newz_2/features/technology/bloc/tech_bloc.dart';
import 'package:newz_2/features/technology/ui/tech_webview.dart';
import 'package:url_launcher/url_launcher.dart';

class TechPage extends StatefulWidget {  @override
  State<TechPage> createState() => _TechPageState();
}

class _TechPageState extends State<TechPage> {
  TechBloc techBloc = TechBloc();
  @override
  void initState() {
    techBloc.add(PostTFetchEvent());
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
        title: Text("Technology",style: TextStyle(fontFamily: 'NewzFont',fontWeight: FontWeight.bold,color: Colors.grey[300]),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value){
                setState(() {
                  techBloc.add(SearchPostTEvent(value));
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
        child: BlocConsumer<TechBloc, TechState>(
          bloc: techBloc,
          listenWhen: (previous,current)=> current is TechActionState,
          buildWhen: (previous,current) => current is !TechActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch(state.runtimeType){
              case PostTFetchLoadingState:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              case PostTFetchSuccessfulState:
                final successState = state as PostTFetchSuccessfulState;
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
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>TechWebView(url: successState.post[index].url)));
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
              case PostTFetchErrorState:
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
    );
  }}
