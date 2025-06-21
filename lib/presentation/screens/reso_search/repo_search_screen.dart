import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/internet_status/internet_status_bloc.dart';
import '/data/models/repo_item/owner_model.dart';
import '/presentation/routes/route_names.dart';
import '/presentation/widgets/circle_image.dart';
import '/presentation/widgets/custom_text.dart';
import '../../../data/models/repo_item/repo_item_model.dart';
import '../../../logic/cubit/repo_search/repo_search_cubit.dart';
import '../../utils/utils.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/fetch_error_text.dart';
import '../../widgets/loading_widget.dart';
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

    Future.microtask(()=>repoCubit.getRepoSearchList());

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: 'All Flutter'),
          automaticallyImplyLeading: false,actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () => repoCubit.sortRepos(SortBy.stars),
            ),
          IconButton(
              icon: const Icon(Icons.access_time),
              onPressed: () => repoCubit.sortRepos(SortBy.updated),
            ),
        ],),
      // appBar: CustomGradientAppBar(title: 'Quote Request',isShowBB: widget.isShow,actions:  FilterQuote(),),
      body: PageRefresh(
        onRefresh: () async {
          repoCubit.getRepoSearchList();
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<InternetStatusBloc, InternetStatusState>(
              listener: (context, state) {
                 if (state is InternetStatusLostState) {
                   Utils.errorSnackBar(context, state.message,2000);
                  } else if (state is InternetStatusBackState) {
                    Utils.showSnackBar(context, state.message);
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
                }
              },
            ),
          ],
          child: BlocBuilder<RepoSearchCubit, OwnerModel>(
            builder: (context, service) {
              final state = service.repoState;
              if (state is RepoSearchLoading) {
                return const LoadingWidget();
              } else if (state is RepoSearchError) {
                if (state.statusCode == 503) {
                  return LoadedRepoItems(items: repoCubit.repositories);
                } else if (state.statusCode == 403) {
                  return LoadedRepoItems(items: repoCubit.repositories);
                } else {
                  return FetchErrorText(text: state.message);
                }
              } else if (state is RepoSearchLoaded) {
                return LoadedRepoItems(items: state.repositories);
              }
              if (repoCubit.repositories?.isNotEmpty ?? false) {
                return LoadedRepoItems(items: repoCubit.repositories);
              } else {
                return EmptyWidget(
                    image: '', text: 'No Result found', isSliver: false);
              }
            },
          ),
        ),
      ),
    );
  }
}

class LoadedRepoItems extends StatelessWidget {

  const LoadedRepoItems({super.key, this.items});

  final List<RepoItemModel?>? items;

  @override
  Widget build(BuildContext context) {
    if(items?.isNotEmpty??false){
      return ListView.builder(
          itemCount: items?.length,
          itemBuilder: (context,index){
            final result  = items?[index];
            return GestureDetector(
              onTap: (){
                if(result?.owner?.login.isNotEmpty??false){
                context.read<RepoSearchCubit>().addType(result?.owner?.login??'');
                Navigator.pushNamed(context, RouteNames.reposDetailScreen);
                }

              },
              child: Card(
                margin: Utils.symmetric(h: 10.0,v: 12.0),
                shape: RoundedRectangleBorder(borderRadius: Utils.borderRadius(r: 2.0)),
                child: Padding(
                  padding: Utils.symmetric(h: 12.0,v: 10.0),
                  child: Row(
                    children: [
                      CircleImage(image: result?.owner?.avatarUrl??'',size: 50.0,),
                      Utils.horizontalSpace(20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(child: CustomText(text: result?.name??'',fontSize: 16.0,fontWeight: FontWeight.w600,)),
                            Row(
                              children: [
                                Icon(Icons.star,size: 18.0,color: Colors.yellow,),
                                CustomText(text: '${result?.stargazersCount}'),
                              ],
                            ),
                            CustomText(text: '${result?.owner?.name}'),
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
      return EmptyWidget(image: '', text: 'No Result found',isSliver: false);
    }
  }
}

