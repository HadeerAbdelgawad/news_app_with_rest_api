import 'package:flutter/material.dart';

import '../../../search_result/view.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [

              Expanded(
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultScreen(query: value,),));
                  },
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400,),
                    suffixIcon: Icon(Icons.close,color: Colors.grey.shade400,),
                    fillColor: Color(0xffF3F3F3),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xff577CD9)),
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xff577CD9))
                    ),

                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color:Colors.transparent)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    hintText: 'Search For News',
                  ),
                ),
              ),

              SizedBox(width: 10,),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(context);
                },
                child: Text('Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
