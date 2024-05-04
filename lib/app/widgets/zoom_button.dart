import 'package:ev/app/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class ZoomButton extends StatelessWidget {
  final double minZoom, maxZoom, padding;
  final Alignment alignment;
  static const _fitboundPadding = EdgeInsets.all(2);
  const ZoomButton(
      {super.key,
      required this.alignment,
      required this.minZoom,
      required this.maxZoom,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    final map = MapCamera.of(context);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Card(
          color: white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    onTap: () {
                      final paddedMapCamera = CameraFit.bounds(
                              bounds: map.visibleBounds,
                              padding: _fitboundPadding)
                          .fit(map);

                      var zoom = paddedMapCamera.zoom + 1;

                      if (zoom > maxZoom) {
                        zoom = maxZoom;
                      }
                      MapController.of(context)
                          .move(paddedMapCamera.center, zoom);
                    },
                    child: const Icon(Icons.add, size: 15)),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    final paddedMapCamera = CameraFit.bounds(
                            bounds: map.visibleBounds,
                            padding: _fitboundPadding)
                        .fit(map);

                    var zoom = paddedMapCamera.zoom - 1;

                    if (zoom < minZoom) {
                      zoom = minZoom;
                    }
                    MapController.of(context)
                        .move(paddedMapCamera.center, zoom);
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
