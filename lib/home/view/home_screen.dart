import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:jokes_app/home/bloc/home_bloc.dart';
import 'package:jokes_app/home/network/model/response/jokes_res_model.dart';
import 'package:jokes_app/utils/common_util/utils_importer.dart';
import 'package:jokes_app/utils/common_widgets/app_text_widget.dart';
import 'package:jokes_app/utils/common_widgets/custom_theme.dart';
import 'package:jokes_app/utils/default_loading.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    homeScreenBloc.fetchJokesPeriodically();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  if (!homeScreenBloc.theme!) {
                    homeScreenBloc.theme = true;
                    homeScreenBloc.changeTheme(MyThemeKeys.DARK);
                  } else {
                    homeScreenBloc.theme = false;
                    homeScreenBloc.changeTheme(MyThemeKeys.LIGHT);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: (() {
                    if (!homeScreenBloc.theme!) {
                      return Icon(
                        Icons.wb_sunny_outlined,
                        color: Theme.of(context).primaryColorDark,
                      );
                    }
                    return Icon(Icons.sunny);
                  }()),
                ),
              ),
            ],
            backgroundColor: Theme.of(context).primaryColorLight,
            title: AppTextWidget(
              text: UtilsImporter().stringUtils.home,
              size: 18,
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.bold,
            )),
        body: StreamBuilder<bool>(
          stream: homeScreenBloc.loadingController,
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.data!) {
              return StreamBuilder<List<JokesResModel>>(
                stream: homeScreenBloc.jokeConListtroller,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    List<JokesResModel>? jokelist = snapshot.data;
                    return ListView.builder(
                      itemCount: jokelist!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColorDark,
                                  width: 1),
                            ),
                            elevation: 10.0,
                            shadowColor: Colors.blueGrey,
                            child: ListTile(
                              leading: Icon(
                                Icons.emoji_emotions_outlined,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              title: Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: AppTextWidget(
                                    size: 16, text: jokelist[index].joke),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return AppTextWidget(text: 'No Data Found!');
                },
              );
            } else {
              return DefaultLoading();
            }
          },
        ));
  }
}
