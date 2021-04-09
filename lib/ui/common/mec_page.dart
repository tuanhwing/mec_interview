

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_interview/bloc/mec_page_event.dart';
import 'package:flutter_app_interview/utils/mec_dimensions.dart';
import 'package:flutter_app_interview/utils/mec_fontsizes.dart';

class MECPage extends StatelessWidget {
  MECPage({this.body, this.stream, this.onErrorTap});
  final Widget body;
  final Stream<MECPageEvent> stream;
  final VoidCallback onErrorTap;

  Widget _buildTextTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MECFontSizes.SIZE_18
      ),
    );
  }

  ///Loading widget
  Widget _loadingWidget({BuildContext context}) => Container(
    child: Center(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.all(
                    Radius.circular(2*MECDimensions.DIMENSION_8))
            ),
            padding: EdgeInsets.all(2*MECDimensions.DIMENSION_8),
            child: CircularProgressIndicator(),
          ),

        ],
      ),
    ),
  );

  ///Error widget
  Widget _errorWidget(String error, {BuildContext context}) => Container(
    child: Center(
        child: Wrap(
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: 350.0
              ),
              padding: EdgeInsets.symmetric(vertical: MECDimensions.DIMENSION_8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2*MECDimensions.DIMENSION_8),
                color: Theme.of(context).colorScheme.onPrimary,

              ),
              child: Column(
                children: [
                  _buildTextTitle("Thông báo".toUpperCase()),
                  SizedBox(height: 2*MECDimensions.DIMENSION_6,),
                  Text(error ?? ""),
                  SizedBox(height: 2*MECDimensions.DIMENSION_6,),
                  Divider(
                    // color: Colors.black54
                  ),
                  SizedBox(height: MECDimensions.DIMENSION_5,),
                  InkWell(
                    onTap: onErrorTap,
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: _buildTextTitle('ok'.toUpperCase())
                    ),
                  ),
                  SizedBox(height: MECDimensions.DIMENSION_5,),
                ],
              ),
            )
          ],
        )
    ),
  );

  Widget _handle(BuildContext context, MECPageEvent event) {
    if (event != null) {
      if (event is MECPageLoadingEvent) {
        return Container(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          child: _loadingWidget(context: context),
        );
      } else if (event is EOCPageErrorEvent) {
        return Container(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
            child: _errorWidget(event.message, context: context)
        );
      }
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          body,
          StreamBuilder<MECPageEvent>(
            stream: stream,
            builder: (_, AsyncSnapshot<MECPageEvent> snapshot) => _handle(context, snapshot.data),
          )
        ],
      ),
    );
  }
}