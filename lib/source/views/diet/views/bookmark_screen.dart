import 'package:carousel_slider/carousel_slider.dart';
import 'package:fait/source/widgets/custom_icon_button.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

final isFavoriteProvider = StateProvider<bool>((ref) {
  return true;
});

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  String currentIndex = '0';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 556.v,
                width: 425.h,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 32.v),
                decoration: AppDecoration.fillBluegray80004.copyWith(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30.h))),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                      height: 24.v,
                      width: 16.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 16.h),
                      onTap: () {
                        onTapImgArrowLeft(context);
                      },
                    ),
                    SizedBox(height: 27.v),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.h),
                        child: Text("Breakfast ideas",
                            style: theme.textTheme.headlineLarge),
                      ),
                    ),
                    SizedBox(height: 50.v),
                    _buildLetsTry(context),
                    SizedBox(height: 50.v),
                    SizedBox(
                      width: 269.h,
                      child: Text(
                          "Start your day off right with these healthy breakfast recipes",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleMediumGray10001Medium),
                    ),
                    SizedBox(height: 27.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                    Widget? child) =>
                                Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.v),
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(isFavoriteProvider.notifier)
                                      .update((state) => !state);
                                },
                                child: Stack(
                                  children: [
                                    CustomIconButton(
                                      height: 36.adaptSize,
                                      width: 36.adaptSize,
                                      padding: EdgeInsets.all(8.h),
                                      decoration: IconButtonStyleHelper
                                          .fillOnErrorContainer,
                                    ),
                                    Positioned(
                                      right: 8.h,
                                      top: -17.v,
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgFavoriteBlueGray90020x20,
                                          height: 18.v,
                                          width: 20.h,
                                          color: ref.watch(isFavoriteProvider)
                                              ? theme.colorScheme.primary
                                              : null,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 27.v)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CustomElevatedButton(
                            height: 48.v,
                            width: 168.h,
                            text: "Let's try $currentIndex",
                            margin: EdgeInsets.only(left: 24.h),
                            buttonStyle: CustomButtonStyles.fillPrimary,
                            onPressed: () {
                              onTapLetsTry(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 71.v),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 32.v),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 32.h),
                    child:
                        Text("Favorites", style: theme.textTheme.headlineLarge),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLetsTry(BuildContext context) {
    List<CustomImageView> carouselItems = [
      CustomImageView(
          imagePath: ImageConstant.img01,
          height: 176.adaptSize,
          width: 176.adaptSize,
          radius: BorderRadius.circular(100.h)),
      CustomImageView(
          imagePath: ImageConstant.img02,
          height: 176.adaptSize,
          width: 176.adaptSize,
          radius: BorderRadius.circular(88.h),
          margin: EdgeInsets.only(left: 64.h)),
      CustomImageView(
          imagePath: ImageConstant.img03,
          height: 176.adaptSize,
          width: 176.adaptSize,
          radius: BorderRadius.circular(88.h),
          margin: EdgeInsets.only(left: 64.h)),
      CustomImageView(
          imagePath: ImageConstant.img04,
          height: 176.adaptSize,
          width: 176.adaptSize,
          radius: BorderRadius.circular(88.h),
          margin: EdgeInsets.only(left: 64.h)),
      CustomImageView(
          imagePath: ImageConstant.img05,
          height: 176.adaptSize,
          width: 176.adaptSize,
          radius: BorderRadius.circular(88.h),
          margin: EdgeInsets.only(left: 64.h)),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Other widgets
        CarouselSlider(
          items: carouselItems,
          options: CarouselOptions(
            height: 170.v,
            enlargeCenterPage: true, // Increase the size of the center item
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              // Optional callback when the page changes
              // You can use it to update any additional UI components
              setState(() {
                currentIndex = index.toString();
              });
            },
          ),
        ),
      ],
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the recipeInfoScreen when the action is triggered.
  onTapLetsTry(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.recipeInfoScreen);
  }
}
