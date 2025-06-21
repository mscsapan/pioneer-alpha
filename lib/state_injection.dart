import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'state_injection_packages.dart';
import 'logic/cubit/repo_search/repo_search_cubit.dart';
import 'logic/repository/repo_item_repository.dart';

class StateInject {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> initState() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProvider = <RepositoryProvider>[
    RepositoryProvider<Client>(create: (context) => Client()),
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<LocalDataSource>(
      create:
          (context) => LocalDataSourceImpl(sharedPreferences: context.read()),
    ),

    RepositoryProvider<RepoItemRepository>(
      create:
          (context) =>
              RepoItemRepositoryImpl(remoteDataSources: context.read()),
    ),
  ];

  static final blocProviders = <BlocProvider>[
    BlocProvider<InternetStatusBloc>(create: (context) => InternetStatusBloc()),

    BlocProvider<RepoSearchCubit>(
      create:
          (BuildContext context) => RepoSearchCubit(repository: context.read()),
    ),
  ];
}
