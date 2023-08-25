import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'skeleton.dart';

class Avatar extends StatelessWidget {
  final String? url;
  final String? name;
  final double size;
  final double radius;
  final BoxShape? shape;

  const Avatar({
    Key? key,
    this.url,
    this.name,
    this.size = 40,
    this.radius = 20,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var initials = getInitials(name);

    double fontSize = size / 2;

    var style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: fontSize,
          color: Theme.of(context).colorScheme.secondary,
        );

    var color = Colors.grey.shade200;

    return Container(
      height: size,
      width: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: (url == null || !url!.contains('http'))
          ? Center(child: Text(initials, style: style))
          : CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: url!,
              placeholder: (context, url) {
                return Skeleton(height: size, width: size);
              },
              imageBuilder: (context, imageProvider) {
                return Image(image: imageProvider, fit: BoxFit.cover);
              },
              errorWidget: (context, url, error) {
                return Center(child: Text(initials, style: style));
              },
            ),
    );
  }

  String getInitials(String? name) {
    if (name?.trim().isEmpty ?? true) return 'K';
    var list = name!.split('\\s');
    if (list.isEmpty) {
      return 'K';
    } else if (list.length == 1) {
      return list[0][0].toUpperCase();
    } else {
      return '${list[0][0]}${list[1][0]}'.toUpperCase();
    }
  }
}
