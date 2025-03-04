import 'package:bank_sha/models/tip_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final TipModel tip;
  const HomeTipsItem({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(tip.url!); // Konversi ke Uri

        if (await canLaunchUrl(uri)) {
          // Gunakan canLaunchUrl
          await launchUrl(uri); // Gunakan launchUrl
        }
      },
      child: Container(
        height: 176,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                tip.thumbnail!,
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                tip.title.toString(),
                style: blackTextStyle.copyWith(fontWeight: medium),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
