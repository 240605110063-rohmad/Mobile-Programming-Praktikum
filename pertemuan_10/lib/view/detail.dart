import 'package:flutter/material.dart';
import 'package:pertemuan_10/model/detailgame.dart';
import 'package:pertemuan_10/viewmodel/fetchgame.dart';
import 'package:readmore/readmore.dart';

class Detail extends StatefulWidget {
  final int gameTerpilih;
  const Detail({super.key, required this.gameTerpilih});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<DetailGame> _detailFuture;

  @override
  void initState() {
    super.initState();
    _detailFuture = fetchData();
  }

  Future<DetailGame> fetchData() async {
    final jsonData = await fetchDataFromAPI(widget.gameTerpilih);
    return DetailGame.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: FutureBuilder<DetailGame>(
        future: _detailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak tersedia'));
          } else {
            final game = snapshot.data!;
            final req = game.minimumSystemRequirements;

            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        child: Image.network(
                          game.thumbnail,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 300,
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Minimum System Requirements',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 8),
                            _requirementRow('OS', req?.os ?? 'N/A'),
                            _requirementRow('Processor', req?.processor ?? 'N/A'),
                            _requirementRow('Memory', req?.memory ?? 'N/A'),
                            _requirementRow('Graphics', req?.graphics ?? 'N/A'),
                            _requirementRow('Storage', req?.storage ?? 'N/A'),

                            if (game.screenshots.isNotEmpty) ...[
                              Container(
                                height: 180,
                                margin: const EdgeInsets.symmetric(vertical: 15),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: game.screenshots.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: _itemList(game.screenshots[index].image),
                                    );
                                  },
                                ),
                              ),
                            ],

                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ReadMoreText(
                                game.description,
                                trimLines: 3,
                                colorClickableText: Colors.amberAccent.shade700,
                                trimMode: TrimMode.Line,
                                style: TextStyle(
                                  color: Colors.black54.withOpacity(0.8),
                                  height: 1.5,
                                ),
                                trimCollapsedText: 'more',
                                trimExpandedText: 'less',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

SizedBox _itemList(String url) {
  return SizedBox(
    width: 250,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Row _requirementRow(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ),
    ],
  );
}