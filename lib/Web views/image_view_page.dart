import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({super.key,
    required this.imageUrl,
    required this.idType,
    required this.userName,
    required this.profession
  });
  final String imageUrl;
  final String idType;
  final String userName;
  final String profession;

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {

  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.idType),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text("Name:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(width: 10,),
                  Text(widget.userName,
                  style: const TextStyle(
                    fontSize:  20,
                  ),
                  ),

                ],
              ),
              const SizedBox(height: 05,),
              Row(
                children: [
                  const Text("Profession:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(widget.profession,
                    style: const TextStyle(
                      fontSize:  20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                height: height *0.70,
                width: width *0.70,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: Image.network(widget.imageUrl,
                  fit: BoxFit.fill,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
