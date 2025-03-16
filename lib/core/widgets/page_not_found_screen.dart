import 'package:bardix/core/app_constants/app_repo_assets.dart';
import 'package:bardix/core/router/app_routs.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/core/widgets/common_header.dart';
import 'package:bardix/core/widgets/common_image_widget.dart';
import 'package:bardix/core/widgets/gradient_container.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(S.of(context).pageNotFound)),
    body: GradientContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.convertPxToDp()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Screen Title: "Customer Info"
            CommonHeader(hasBackBtn: false, title: S.of(context).customerInfo),
            SizedBox(height: 40.convertPxToDp()),
            CommonSVGImageProvider(
              imagePath: AppRepoAssets().errorImage,
              width: 20.convertPxToDp(),
              height: 20.convertPxToDp(),
            ),
            SizedBox(height: 20.convertPxToDp()),
            Text(
              S.of(context).oopsPageNotFound,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20.convertPxToDp()),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.customerInfo, extra: context.read<OrderBloc>()),
              child: Text(S.of(context).goToHome),
            ),
          ],
        ),
      ),
    ),
  );
}
