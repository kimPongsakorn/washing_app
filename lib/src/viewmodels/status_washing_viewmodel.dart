import 'package:washing_app/src/constants/asset.dart';
import 'package:washing_app/src/models/mashing_model.dart';

class StatusWashingViewModel {
  StatusWashingViewModel();

  List<MashingModel> getWashingItems = <MashingModel>[
    const MashingModel(
      'เครื่องซัก หมายเลข 1',
      size: '14',
      status: false,
      image: Asset.logoImage,
      workingHours: '45',
    ),
    const MashingModel(
      'เครื่องซัก หมายเลข 2',
      size: '14',
      status: true,
      image: Asset.logoImage,
    ),
    const MashingModel(
      'เครื่องซัก หมายเลข 3',
      size: '14',
      status: false,
      image: Asset.logoImage,
      workingHours: '1',
    ),
    const MashingModel(
      'เครื่องซัก หมายเลข 4',
      size: '14',
      status: false,
      image: Asset.logoImage,
      workingHours: '10',
    ),
    const MashingModel(
      'เครื่องซัก หมายเลข 5',
      size: '14',
      status: true,
      image: Asset.logoImage,
    ),
  ];
}
