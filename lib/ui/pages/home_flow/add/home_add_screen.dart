

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_page_state.dart';
import 'package:flutter_app_interview/ui/common/mec_button.dart';
import 'package:flutter_app_interview/ui/common/mec_card_info_widget.dart';
import 'package:flutter_app_interview/ui/common/mec_circle_image.dart';
import 'package:flutter_app_interview/ui/common/mec_image_widget.dart';
import 'package:flutter_app_interview/ui/common/mec_single_text.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/bloc/home_add_bloc.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';
import 'package:flutter_app_interview/utils/mec_mock_up.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeAddScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeAddState();

}

class _HomeAddState extends MECPageState<HomeAddBloc, HomeAddScreen> {

  @override
  // TODO: implement content
  Widget get content => SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2*MECDimensions.DIMENSION_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4*MECDimensions.DIMENSION_8),
                    child: MECSingleText(
                      tr('discover').capitalize,
                   style: Theme.of(context).textTheme.headline6,
                    ),
                  ),

                  MECSingleText(
                    tr('whats_new_today').allInCaps,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),

                  SizedBox(height: 3*MECDimensions.DIMENSION_8,),
                  MECImageWidget(
                    url: MECMockUp.BACKGROUND_IMAGE,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2*MECDimensions.DIMENSION_8,
                    ),
                    child: MECCardInfoWidget(
                      imageURL: MECMockUp.AVATAR_IMAGE,
                      title: 'Pawel Czerwinski',
                      subTitle: '@pawel_czerwinski',
                    ),
                  ),

                  SizedBox(height: 3*MECDimensions.DIMENSION_8,),
                  MECSingleText(
                    tr('browse_all').allInCaps,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 3*MECDimensions.DIMENSION_8,),
                  // Expanded(child: _HomeGridView())
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4*MECDimensions.DIMENSION_8),
            child: MECButton(
              title: tr('see_more').allInCaps,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}


class _HomeGridView extends StatelessWidget {

  List<Widget> _getImages() {
    return MECMockUp.IMAGES.map((e) => Padding(
      padding: const EdgeInsets.all(MECDimensions.DIMENSION_2),
      child: MECImageWidget(
        url: e,
      ),
    ),).toList();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: MECMockUp.IMAGES.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(MECDimensions.DIMENSION_2),
          child: MECImageWidget(
            url: MECMockUp.IMAGES[index],
          ),
        ),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

}