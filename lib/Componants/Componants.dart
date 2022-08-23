// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';


AppBar defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>?actions,
})=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(
        Icons.arrow_back_outlined
    ),
  ),
  titleSpacing: 5,
  title: Text(title!),
  actions: actions,
);


Widget myDivider() => Padding(
  padding: const EdgeInsets.all(5.0),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[400],
  ),
);





Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  bool isClickable = true,
  // Function? onSubmit,
   Function? onChange,
  Function? validate,
  bool obscureText=false,
  Function? SuffixPressed,
  required String lable,
  required IconData Prefix,
  IconData? Suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText:obscureText ,
      validator: (s){return validate!(s);},
       onChanged: (s){onChange!(s);},
      decoration: InputDecoration(
        labelText: '${lable},',
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Prefix),
        suffixIcon:Suffix!=null? IconButton(icon:Icon(Suffix),onPressed: (){SuffixPressed!();},):null,

        border: OutlineInputBorder(),
      ),
      // onFieldSubmitted: (s){onSubmit!(s);},
    );


Widget defaultTextButton ({
  bool isUpperCase = true,
  TextStyle? style,
  required Function function,
  required String text ,
})=>TextButton(onPressed: (){function();}, child: Text('${text.toUpperCase()}',style: TextStyle(color: Colors.deepOrange,),),);




void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route)
  {
    return false;
  },
);
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  TextStyle? style,
  String ? label,
  TextStyle? labelStyle,
  required String text,
  bool isUpperCase = true,
  double radius = 3,
  required Function function,

}) =>
    Container(
      height: 40,
      width: width,
      child: MaterialButton(
        // ignore: unnecessary_statements
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text ,
          style: TextStyle(color: Colors.white),

        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,

        ),
        color: background,

      ),
    );




Widget buildArticleItem(context,article)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(children: [
    Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                  '${article['urlToImage']}'),
              fit: BoxFit.cover)),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Text('${article['title']}',style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,)),
              Text('${article['publishedAt']}',style: TextStyle(fontSize: 12,color: Colors.grey[300])),

            ],
          ),
        ),
      ),
    )
  ]),
);


