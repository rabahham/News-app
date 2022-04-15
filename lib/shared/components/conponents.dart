import 'package:flutter/material.dart';
import 'package:news_app/screens/webview/web_view_screen.dart';

Widget buildArticaleItem(article, context) => InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewNews(
                  urlsite: article['url'],
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget textdField({
  required TextEditingController controller,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  bool autofocus = false,
  required Icon prefixIconicon,
  double borderRadius = 10,
  int maxlines = 1,
  var onchange,
}) =>
    TextFormField(
        maxLines: maxlines,
        autofocus: autofocus,
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return ("$hintText must not be  empty");
          }

          return null;
        },
        onChanged: onchange,
        onSaved: (value) {
          controller.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          iconColor: Colors.grey,
          prefixIcon: prefixIconicon,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            // borderSide: BorderSide(
            //   color: Colors.grey,
            // ),
          ),
        ));

void NavigateTo(context, widgets) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (context) => widgets));
