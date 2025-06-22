import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/models/repo_item/owner_model.dart';
import '/presentation/widgets/circle_image.dart';
import '/presentation/widgets/custom_text.dart';
import '../../../logic/cubit/repo_search/repo_search_cubit.dart';
import '../../utils/constraints.dart';
import '../../utils/utils.dart';

class RepoDetailScreen extends StatefulWidget {
  const RepoDetailScreen({super.key});

  @override
  State<RepoDetailScreen> createState() => _RepoDetailScreenState();
}

class _RepoDetailScreenState extends State<RepoDetailScreen> {


  late RepoSearchCubit repoCubit;


  @override
  void initState() {
    _initState();
    super.initState();
  }

  _initState() {
    repoCubit = context.read<RepoSearchCubit>();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:  CustomText(text: repoCubit.state.repoItem?.name??'',fontWeight: FontWeight.w600,fontSize: 16.0,)),
      // appBar: CustomGradientAppBar(title: 'Quote Request',isShowBB: widget.isShow,actions:  FilterQuote(),),
      body: BlocBuilder<RepoSearchCubit, OwnerModel>(
        builder: (context, service) {
          // final state = service.repoState;
          final items = service.repoItem;
         return Padding(
            padding: Utils.symmetric(h: 12.0,v: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                Row(
                  children: [
                    Hero(
                        tag: service.repoItem?.id??0,
                        child: CircleImage(image: items?.owner?.avatarUrl??'',size: 80.0,)),
                    Utils.horizontalSpace(20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 4.0,
                        children: [
                          _keyValueWidget('Name',items?.name),
                          _keyValueWidget('Language',items?.language),
                          Row(
                            spacing: 4.0,
                            children: [
                              Icon(Icons.star,size: 18.0,color: Colors.amber),
                              CustomText(text: Utils.priceSeparator(items?.stargazersCount??0),fontWeight: FontWeight.w500),
                              // CustomText(text: '${result?.stargazersCount}'),
                            ],
                          ),
                          _keyValueWidget('Last Update',Utils.timeWithData(items?.updatedAt??'')),
                        ],
                      ),
                    ),
                  ],
                ),
                Flexible(child: CustomText(text: '${items?.description}',maxLine: 50)),
                Wrap(
                  spacing: 4.0,
                  // alignment: WrapAlignment.start,
                  // runAlignment: WrapAlignment.start,
                  children: List.generate(items?.topics?.length??0, (index){
                    final list = items?.topics?.where((e)=>e.trim().isNotEmpty).toList();
                    final topic = list?[index];

                    return Chip(
                      backgroundColor: primaryColor.withOpacity(0.1),
                      label: CustomText(text: topic??'',color: blackColor,fontWeight: FontWeight.w500,),shape: RoundedRectangleBorder(borderRadius: Utils.borderRadius(r: 30.0)),side: BorderSide.none,);
                  }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
  _keyValueWidget(String key,String? value){
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 1.0,
      children: [
       CustomText(text: '$key: ',fontSize: 14.0,fontWeight: FontWeight.w500),
        Flexible(fit:FlexFit.tight,child: CustomText(text: value??'',fontSize: 14.0,fontWeight: FontWeight.w600)),
      ],
    );
  }
}


