import '/data/models/repo_item/owner_detail_model.dart';
import '/data/models/repo_item/owner_model.dart';
import '/presentation/widgets/circle_image.dart';
import '/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/repo_item/repo_item_model.dart';
import '../../../logic/cubit/repo_search/repo_search_cubit.dart';
import '../../utils/k_images.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/fetch_error_text.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/page_refresh.dart';

class RepoDetailScreen extends StatefulWidget {
  const RepoDetailScreen({super.key});

  @override
  State<RepoDetailScreen> createState() => _RepoDetailScreenState();
}

class _RepoDetailScreenState extends State<RepoDetailScreen> {


  late RepoSearchCubit serviceCubit;


  @override
  void initState() {
    _initState();
    super.initState();
  }

  _initState() {
    serviceCubit = context.read<RepoSearchCubit>();

    Future.microtask(()=>serviceCubit.getOwnerDetail());

  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:  CustomText(text: 'Detail Screen')),
      // appBar: CustomGradientAppBar(title: 'Quote Request',isShowBB: widget.isShow,actions:  FilterQuote(),),
      body: PageRefresh(
        onRefresh: () async {


          serviceCubit.getOwnerDetail();
        },
        child:BlocConsumer<RepoSearchCubit, OwnerModel>(
          listener: (context, service) {
            final state = service.repoState;
            if (state is RepoSearchDetailError) {
              if (state.statusCode == 503) {
                serviceCubit.getOwnerDetail();
              }
            }

          },
          builder: (context, service) {
            final state = service.repoState;
            if (state is RepoSearchDetailLoading) {
              return const LoadingWidget();
            } else if (state is RepoSearchDetailError) {
              if (state.statusCode == 503) {
                return LoadedOwnerDetail(items: serviceCubit.detail);
              } else {
                return FetchErrorText(text: state.message);
              }
            } else if (state is RepoSearchDetailLoaded) {
              return LoadedOwnerDetail(items: state.detail);
            }
            if (serviceCubit.detail != null) {
              return LoadedOwnerDetail(items: serviceCubit.detail);
            } else {
              return  FetchErrorText(text: 'Something went wrong');
            }
          },
        ),
      ),
    );
  }
}

class LoadedOwnerDetail extends StatelessWidget {

  const LoadedOwnerDetail({super.key, this.items});

  final OwnerDetail? items;

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: Utils.symmetric(h: 12.0,v: 10.0),
     child: Row(
       children: [
         CircleImage(image: items?.avatarUrl??'',size: 50.0,),
         Utils.horizontalSpace(20.0),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             spacing: 4.0,
             children: [
               Flexible(child: CustomText(text: 'Name: ${items?.name}')),
               if(items?.email.isNotEmpty??false)
                Flexible(child: CustomText(text: 'Email: ${items?.email}')),
               if(items?.company.isNotEmpty??false)
                Flexible(child: CustomText(text: 'Company: ${items?.company}')),
               if(items?.bio.isNotEmpty??false)
                Flexible(child: CustomText(text: 'Bio: ${items?.bio}')),
               CustomText(text: 'Update Time : ${Utils.timeWithData(items?.updatedAt??'')}')
             ],
           ),
         ),
       ],
     ),
   );
  }
}

