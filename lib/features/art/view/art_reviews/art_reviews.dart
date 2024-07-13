import 'package:art_selling_platform/common/appbar/appbar.dart';
import 'package:art_selling_platform/common/ratingBarIndicator.dart';
import 'package:art_selling_platform/features/art/view/art_reviews/Widgets/overallRating.dart';
import 'package:art_selling_platform/features/art/view/art_reviews/Widgets/userReviewCard.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ArtReviewsScreen extends StatelessWidget {
  const ArtReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
          title: Text("التقييم و المراجعات"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "التقييمات و المراجعات تمت عن طريق مستخدمين لهم نفس تجربتك"),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TOverAllRating(),
              TRatingBarIndicator(rating: 3.5),
              Text("11,900", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //User Review
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
