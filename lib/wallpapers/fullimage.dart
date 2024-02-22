import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:xwalli/constants.dart';

class FullScreen extends StatelessWidget {
  final int index;
  final String type;
  final String url;

  const FullScreen({
    Key? key,
    required this.index,
    required this.type,
    required this.url,
  }) : super(key: key);

  Future<void> _showWallpaperOptions(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(LucideIcons.tv2),
              title: const Text('Home Screen'),
              onTap: () async {
                await _setWallpaper(context, WallpaperManager.HOME_SCREEN);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(LucideIcons.trees),
              title: const Text('Lock Screen'),
              onTap: () async {
                await _setWallpaper(context, WallpaperManager.LOCK_SCREEN);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(LucideIcons.stretchHorizontal),
              title: const Text('Both Screens'),
              onTap: () async {
                await _setWallpaper(context, WallpaperManager.BOTH_SCREEN);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _setWallpaper(BuildContext context, int location) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    final bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    print(result);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Mint,
        content: Text(
          'Wallpaper set for ${location == WallpaperManager.HOME_SCREEN ? "home" : location == WallpaperManager.LOCK_SCREEN ? "lock" : "both"} screen${location == WallpaperManager.BOTH_SCREEN ? 's' : ''}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.1),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: const Text(
          'Preview Wallpaper',
          style: TextStyle(
            color: Camel,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            placeholder: (context, url) {
              return const CupertinoActivityIndicator(
                color: Colors.white54,
              );
            },
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
            imageUrl: url,
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  _showWallpaperOptions(context);
                }
              },
              child: Center(
                child: ElevatedButton(
                  onPressed: () => _showWallpaperOptions(context),
                  style: ElevatedButton.styleFrom(
                    primary: RealWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Apply',
                          style: TextStyle(color: Black, fontSize: 22),
                        ),
                        SizedBox(width: 5),
                        Icon(LucideIcons.crown, color: Camel),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

