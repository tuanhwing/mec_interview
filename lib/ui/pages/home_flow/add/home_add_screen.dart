
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/core/mec_page_state.dart';
import 'package:flutter_app_interview/ui/common/mec_button.dart';
import 'package:flutter_app_interview/ui/common/mec_card_info_widget.dart';
import 'package:flutter_app_interview/ui/common/mec_single_text.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/bloc/home_add_bloc.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/bloc/home_add_event.dart';
import 'package:flutter_app_interview/ui/pages/home_flow/add/bloc/home_add_state.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/core/extension/mec_string_extension.dart';
import 'package:flutter_app_interview/utils/mec_mock_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeAddScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeAddState();

}

class _HomeAddState extends MECPageState<HomeAddBloc, HomeAddScreen> {

  @override
  Widget get content => SafeArea(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2*MECDimensions.DIMENSION_8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _HomeTopmostContentWidget(),
            _HomeGridView(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4*MECDimensions.DIMENSION_8),
              child: MECButton(
                title: tr('see_more').allInCaps,
                onPressed: () => bloc.add(HomeAddSeeMoreEvent()),
              ),
            ),

          ],
        ),
      ),
    ),
  );
}


class _HomeGridView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAddBloc, HomeAddState>(
      buildWhen: (previous, current) => previous.urlImages != current.urlImages,
      builder: (_, state) {
        return Padding(
          padding: EdgeInsets.only(top: 3*MECDimensions.DIMENSION_8,),
          child: StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            itemCount: state.urlImages.length,
            itemBuilder: (BuildContext context, int index) => _HomeImageWidget(state.urlImages[index]),
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            },
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        );
      },
    );
  }
}


class _HomeTopmostContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        _HomeImageWidget(MECMockUp.BACKGROUND_IMAGE),

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
      ],
    );
  }
}


class _HomeImageWidget extends StatelessWidget {
  _HomeImageWidget(this.url);
  final String url;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
              Radius.circular(2*MECDimensions.DIMENSION_8))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(2*MECDimensions.DIMENSION_8)),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}