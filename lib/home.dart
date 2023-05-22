import 'package:demo_test_project/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  void initState() {
    super.initState();
    fetchMusic();
  }

  void fetchMusic() {
    final fetchMusic = Provider.of<MusicProvider>(context, listen: false);
    fetchMusic.fetchMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<MusicProvider>(
          builder: (context, api, child) {
            if (api.isLoading) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: api.model.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                          api.model.data![index].thumbnailUrl.toString()),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(api.model.data![index].id.toString()),
                        Text(api.model.data![index].albumId.toString()),
                        Text(api.model.data![index].title.toString()),
                      ],
                    ),
                    subtitle:
                        Text(api.model.data![index].thumbnailUrl.toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
