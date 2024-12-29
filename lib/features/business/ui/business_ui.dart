import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newz_2/features/business/bloc/business_bloc.dart';
import 'package:newz_2/features/business/ui/business_webview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/bloc/home_bloc.dart';

class BusinessPage extends StatefulWidget {  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  BusinessBloc businessBloc = BusinessBloc();



  @override
  void initState() {
    businessBloc.add(PostBFetchEvent());
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
        title: Text("Business",style: TextStyle(fontFamily: 'NewzFont',fontWeight: FontWeight.bold,color: Colors.grey[300]),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value){
                setState(() {
                  businessBloc.add(SearchPostBEvent(value));
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
        backgroundColor: Color(0xFF001F3F),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: BlocConsumer<BusinessBloc, BusinessState>(
          bloc: businessBloc,
          listenWhen: (previous,current)=> current is BusinessActionState,
          buildWhen: (previous,current) => current is !BusinessActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch(state.runtimeType){
              case PostBFetchLoadingState:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              case PostBFetchSuccessfulState:
                final successState = state as PostBFetchSuccessfulState;
                return Container(
                  child: ListView.builder(itemCount: successState.postB.length,itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(successState.postB[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text(successState.postB[index].description),
                            trailing: successState.postB[index].urlToImage.isNotEmpty
                                ? Image.network(successState.postB[index].urlToImage,  fit: BoxFit.cover)
                                : null,
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessWebView(url: successState.postB[index].url)));
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
              case PostBFetchErrorState:
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
