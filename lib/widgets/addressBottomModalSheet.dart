import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:talabat_clone/data_layer/address_model/address_entity.dart';
import 'package:talabat_clone/style/colors.dart';
import 'package:talabat_clone/style/fonts.dart';
import 'package:talabat_clone/style/sizes.dart';
import 'package:talabat_clone/style/spaces.dart';

class AddressBottomModalSheet extends StatelessWidget {
  const AddressBottomModalSheet({super.key, required this.addressEntity});

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.place, size: mediumSize),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.only(bottom: xSmallSize),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: light_grey_color, // Border color
                    width: 0.75, // Border thickness
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    // same as expanded
                    child: Padding(
                      padding: EdgeInsets.only(left: xSmall),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addressEntity.location,
                            style: fontNormalTextBlackHeavier,
                          ),
                          AutoSizeText(
                            addressEntity.full_address,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: fontNormalTextGrey,
                          ),
                          SizedBox(
                            height: xSmallSize,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (addressEntity.isPrimary) ...[
                    Icon(
                      Icons.check_circle,
                      size: mediumSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: xSmallSize,
                    ),
                  ],
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
