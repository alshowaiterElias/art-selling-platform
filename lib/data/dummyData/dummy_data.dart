import 'package:art_selling_platform/features/art/models/artest_model.dart';
import 'package:art_selling_platform/features/art/models/banner_model.dart';
import 'package:art_selling_platform/features/art/models/catagory_model.dart';
import 'package:art_selling_platform/features/art/models/product_model.dart';
import 'package:art_selling_platform/routes/routes.dart';
import 'package:art_selling_platform/utils/constants/image_strings.dart';

class TDummyData {
  //list of all catagories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: "1",
        name: "قلم رصاص",
        image: TImageStrings.pencilPaintingsIcon,
        isFeatured: true),
    CategoryModel(
        id: "2",
        name: "زيتي",
        image: TImageStrings.oilPaintingIcon,
        isFeatured: true),
    CategoryModel(
        id: "3",
        name: "فحم",
        image: TImageStrings.coalPaintingsIcon,
        isFeatured: true),
    CategoryModel(
        id: "4",
        name: "مائي",
        image: TImageStrings.waterPaintingsIcon,
        isFeatured: true),
    CategoryModel(
        id: "5",
        name: "لوحات شخصية",
        image: TImageStrings.portraitPaintingsIcon,
        isFeatured: true),
    CategoryModel(
        id: "6",
        name: "كاركياتير",
        image: TImageStrings.caricaturePaintingsIcon,
        isFeatured: true),
  ];

  //list of all banners
  static final List<BannerModel> banners = [
    BannerModel(
        active: false,
        imageUrl: TImageStrings.lightLogo,
        targetScreen: TRoutes.order),
    BannerModel(
        active: true,
        imageUrl: TImageStrings.banner1,
        targetScreen: TRoutes.cart),
    BannerModel(
        active: true,
        imageUrl: TImageStrings.banner2,
        targetScreen: TRoutes.favoriates),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: "001",
      title: "mona lisa",
      isFeatured: true,
      description:
          "The Mona Lisa is a half-length portrait painting by Italian artist Leonardo da Vinci",
      artest: ArtestModel(
          id: "1",
          name: "MSA",
          image: TImageStrings.artest1,
          isFeatured: true,
          phoneNumber: "713729839"),
      salePrice: 7000,
      catagoryId: "2",
      thumbNail: TImageStrings.lastSupper,
      price: 8000,
    ),
    ProductModel(
      id: "002",
      title: "The Starrt Night",
      isFeatured: true,
      description:
          "The Starry Night is an oil-on-canvas painting by the Dutch Post-Impressionist painter Vincent van Gogh",
      artest: ArtestModel(
          id: "1",
          name: "MSA",
          image: TImageStrings.artest1,
          isFeatured: true,
          phoneNumber: "713729839"),
      salePrice: 0,
      catagoryId: "2",
      thumbNail: TImageStrings.starryNight,
      price: 8000,
    ),
    ProductModel(
      id: "003",
      title: "The Last Supper",
      isFeatured: true,
      description:
          "The Last Supper is a mural painting by the Italian High Renaissance artist Leonardo da Vinci,",
      artest: ArtestModel(
          id: "2",
          name: "LIA",
          image: TImageStrings.artest2,
          isFeatured: true,
          phoneNumber: "700700700"),
      salePrice: 7000,
      catagoryId: "3",
      thumbNail: TImageStrings.lastSupper,
      price: 8000,
    ),
    ProductModel(
      id: "004",
      title: "The Kiss",
      isFeatured: true,
      description:
          "The Kiss is an oil-on-canvas painting with added gold leaf, silver and platinum by the Austrian Symbolist painter Gustav Klimt.",
      artest: ArtestModel(
          id: "2",
          name: "LIA",
          image: TImageStrings.artest2,
          isFeatured: true,
          phoneNumber: "700700700"),
      salePrice: 0,
      catagoryId: "4",
      thumbNail: TImageStrings.theKiss,
      price: 10000,
    ),
  ];

  static final List<ArtestModel> artests = [
    ArtestModel(
        id: "1",
        name: "MSA",
        image: TImageStrings.artest1,
        isFeatured: true,
        phoneNumber: "713729839"),
    ArtestModel(
        id: "2",
        name: "LIA",
        image: TImageStrings.artest2,
        isFeatured: true,
        phoneNumber: "700700700"),
  ];
}
