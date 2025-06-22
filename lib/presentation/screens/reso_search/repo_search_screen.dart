import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pioneer_alpha/presentation/widgets/custom_image.dart';

import '/data/models/repo_item/owner_model.dart';
import '/presentation/routes/route_names.dart';
import '/presentation/widgets/circle_image.dart';
import '/presentation/widgets/custom_text.dart';
import '../../../data/models/repo_item/repo_item_model.dart';
import '../../../logic/bloc/internet_status/internet_status_bloc.dart';
import '../../../logic/cubit/repo_search/repo_search_cubit.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/fetch_error_text.dart';
import '../../widgets/lazy_loading.dart';
import '../../widgets/page_refresh.dart';

class RepoSearchScreen extends StatefulWidget {
  const RepoSearchScreen({super.key});

  @override
  State<RepoSearchScreen> createState() => _RepoSearchScreenState();
}

class _RepoSearchScreenState extends State<RepoSearchScreen> {


  late RepoSearchCubit repoCubit;

  @override
  void initState() {
    _initState();
    super.initState();
  }

  _initState() {
    repoCubit = context.read<RepoSearchCubit>();

    Future.microtask(()=>repoCubit.loadOnlineOfflineRepo());

  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (!didPop) {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: CustomText(text: 'All Repositories',fontWeight: FontWeight.w600,fontSize: 16.0),
          automaticallyImplyLeading: false,actions: [

            BlocBuilder<RepoSearchCubit, OwnerModel>(
              builder: (context, state) {
               return Row(
                  children: [
                    if(repoCubit.repositories?.isNotEmpty ?? false)...[
                      IconButton(
                        tooltip: 'Sort by stars',
                        // icon: Icon(Icons.star, color: Colors.amber),
                        icon: _buildSortIcon(SortBy.stars),
                        onPressed: () =>
                            repoCubit.sortRepos(SortBy.stars, toggle: true),
                      ),
                      IconButton(
                        tooltip: 'Sort by updated time',
                        // icon: Icon(Icons.update),
                        icon: _buildSortIcon(SortBy.updated),
                        onPressed: () =>
                            repoCubit.sortRepos(SortBy.updated, toggle: true),
                      ),
                    ],
                  ],
               );
              },
            )


          ],),
        body: PageRefresh(
          onRefresh:  ()  async {
            repoCubit..initState()..getRepoSearchList();
            // repoCubit.loadOnlineOfflineRepo();
          },
          child: MultiBlocListener(
            listeners: [
              BlocListener<InternetStatusBloc, InternetStatusState>(
                listener: (context, state) {
                  if (state is InternetStatusLostState) {
                    // Utils.errorSnackBar(context, state.message,2000);
                    repoCubit.addConnectionType(false);
                  } else if (state is InternetStatusBackState) {
                    repoCubit.addConnectionType(true);
                    // Utils.showSnackBar(context, state.message);
                  }

                },
              ),
              BlocListener<RepoSearchCubit, OwnerModel>(
                listener: (context, service) {
                  final state = service.repoState;
                  if (state is RepoSearchError) {
                    if (state.statusCode == 503) {
                      repoCubit.getRepoSearchList();
                    }
                    if (state.statusCode == 10061) {
                      Utils.errorSnackBar(context, state.message);
                    }
                    if (state.statusCode == 404 && state.message.isEmpty && service.siteAdmin) {
                      repoCubit..initState()..getRepoSearchList();
                    }
                  }
                },
              ),
            ],
            child: BlocBuilder<RepoSearchCubit, OwnerModel>(
              builder: (context, service) {
                final state = service.repoState;
                if (state is RepoSearchLoading) {
                  return const LazyLoading();
                  // return const LoadingWidget();
                } else if (state is RepoSearchError) {
                  if (state.statusCode == 503) {
                    return LoadedRepoItems(items: repoCubit.repositories);
                  } else if (state.statusCode == 403) {
                    return LoadedRepoItems(items: repoCubit.repositories);
                  } else if(state.statusCode == 10061) {
                    return LoadedRepoItems(items: repoCubit.repositories);
                  }else if(state.statusCode == 404 && state.message.isEmpty) {
                    return Center(child: CustomImage(path: KImages.noInternet));
                  }else{
                    return FetchErrorText(text: state.message);
                  }
                } else if (state is RepoSearchLoaded) {
                  return LoadedRepoItems(items: state.repositories);
                }
                if (repoCubit.repositories?.isNotEmpty ?? false) {
                  return LoadedRepoItems(items: repoCubit.repositories);
                } else {
                  return EmptyWidget(image: KImages.emptyRepo, text: 'No Repo found', isSliver: false);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSortIcon(SortBy type) {

    IconData icon;
    switch (type) {
      case SortBy.stars:
        icon = Icons.star;
        break;
      case SortBy.updated:
        icon = Icons.update;
        break;
    }

    return BlocBuilder<RepoSearchCubit, OwnerModel>(
      builder: (context, state) {
        final isActive = state.sortBy == type;
        final arrowIcon = state.isDescending ? Icons.arrow_downward : Icons.arrow_upward;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? Colors.amber : Colors.grey),
            if (isActive) Icon(arrowIcon, size: 16.0),
          ],
        );
      },
    );
  }
}

class LoadedRepoItems extends StatelessWidget {

  const LoadedRepoItems({super.key, this.items});

  final List<RepoItemModel?>? items;

  @override
  Widget build(BuildContext context) {
    // final imgs = items?.map((e) => e?.owner?.avatarUrl).toList();
    // debugPrint('RepoSearchScreen imgs: $imgs');

    if(items?.isNotEmpty??false){
      return ListView.builder(
          itemCount: items?.length,
          padding: Utils.only(bottom: 20.0),
          itemBuilder: (context,index){
            final result  = items?[index];
            return GestureDetector(
              onTap: (){
                context.read<RepoSearchCubit>().addOwner(result);
                Navigator.pushNamed(context, RouteNames.reposDetailScreen);
              },
              child: Card(
                margin: Utils.symmetric(h: 14.0,v: 6.0),
                shape: RoundedRectangleBorder(borderRadius: Utils.borderRadius(r: 2.0)),
                child: Padding(
                  padding: Utils.symmetric(h: 12.0,v: 10.0),
                  child: Row(
                    children: [
                      Hero(
                          tag: result?.id??0,
                          child: CircleImage(image: result?.owner?.avatarUrl??'',size: 50.0,)),
                      Utils.horizontalSpace(20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(child: CustomText(text: result?.name??'',fontSize: 16.0,fontWeight: FontWeight.w600,maxLine: 2)),
                            Row(
                              spacing: 4.0,
                              children: [
                                Icon(Icons.star,size: 18.0,color: Colors.amber),
                                CustomText(text: Utils.priceSeparator(result?.stargazersCount??0),fontWeight: FontWeight.w500),
                              ],
                            ),
                            Row(

                              spacing: 4.0,
                              children: [
                                Icon(Icons.update,size: 18.0,color: Colors.grey),
                                CustomText(text: Utils.timeWithData(result?.updatedAt??''),fontWeight: FontWeight.w500,),                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },);
    }else{
      return EmptyWidget(image: KImages.emptyRepo, text: 'No Repo found', isSliver: false);
    }
  }
}