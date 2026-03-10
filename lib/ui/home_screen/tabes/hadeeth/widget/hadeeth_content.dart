import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/models/hadeeth_data.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/core/utiles/helper.dart';

class HadeethContent extends StatefulWidget {
  HadeethContent({super.key, required this.index});

  final int index;

  @override
  State<HadeethContent> createState() => _HadeethContentState();
}

class _HadeethContentState extends State<HadeethContent> {
  HadeethData? hadeethData;

  @override
  void initState() {
    super.initState();

    loadHadeeth();
  }

  @override
  Widget build(BuildContext context) {
    Helper.init(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:    EdgeInsets.symmetric(vertical: 20,horizontal: 20) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage("assets/images/Hadith Card.png"))
      ),


      child: hadeethData == null
          ? Center(child: CircularProgressIndicator())
          : Column(




              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: Helper.screenHeight*.04),
                  child: Text(

                    hadeethData?.head ?? " ",
                    style: Helper.bold20Black,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Helper.screenWidth*.12),
                      child: Text(
                        hadeethData?.content ?? " ",
                        style: Helper.bold20Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void loadHadeeth() async {
    String data = await rootBundle.loadString(
      "assets/files/hadeeth/h${widget.index }.txt",
    );

    String head = data.substring(0, data.indexOf("\n"));
    String content = data.substring(data.indexOf("\n") + 1);
    hadeethData = HadeethData(content: content, head: head);
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
