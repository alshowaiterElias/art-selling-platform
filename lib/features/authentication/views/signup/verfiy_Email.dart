import 'package:art_selling_platform/features/authentication/views/signup/widgets/success_Screen.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';
import 'package:art_selling_platform/utils/constants/sizes.dart';
import 'package:art_selling_platform/utils/helpers/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerfiyEmailScreen extends StatelessWidget {
  const VerfiyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    // final VerfiyEmailController controller = Get.put(VerfiyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                // AuthenticationRepo.instance.logout();
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //IMAGE
              Lottie.asset(TImageStrings.emailSent,
                  width: THelperFunctions.screenWidth(context) * 0.6),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Title SubTitle
              Text(
                "تأكيد البريد الالكتروني",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                email ?? "",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                  "أرسلنا اليك بريد الكتروني لتاكيد حسابك الرجاء زيارتك بريد الكترونيك و تاكيد الحساب ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // controller.checkEmailVerificationStatus();
                      Get.to(() => Successscreen(
                          image: TImageStrings.emailConfirmed,
                          title: "تم تاكيد حسابك",
                          subtitle: "يمكنك الان الاستمتاع بخدمات هذا البرنامج",
                          onPressed: () {}));
                    },
                    child: const Text("المواصلة")),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      // controller.sendEmailVerification();
                    },
                    child: const Text("إعادة ارسال البريد الالكتروني")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
