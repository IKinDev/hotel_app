import 'package:flutter/material.dart';
import 'package:hotel_app/core/utils/strings.dart';
import 'package:hotel_app/core/styles/styles.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> imageUrls;
  const CarouselWidget({super.key, required this.imageUrls});

  @override
  CarouselWidgetState createState() => CarouselWidgetState();
}

class CarouselWidgetState extends State<CarouselWidget> {
  double culculateColor(int current, int selected) {
    final result = 0.2 - (current - selected).abs() * 0.05;
    return result;
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.imageUrls;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              height: 257, // Установите желаемую высоту корусели
              child: PageView.builder(
                itemCount: imageUrls.length,
                controller: PageController(initialPage: 0, viewportFraction: 1),
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_search,size: 40,),
                          SizedBox(height: 16),
                          Text(AppSettings.errorImageLiadingText, style: TextStyles.titleTextStyle,),
                        ],
                      ));
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageUrls.map((url) {
                      int index = imageUrls.indexOf(url);
                      return Container(
                        width: 7.0,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? const Color.fromRGBO(0, 0, 0, 1)
                              : Color.fromRGBO(
                                  0,
                                  0,
                                  0,
                                  culculateColor(_currentIndex, index),
                                ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
