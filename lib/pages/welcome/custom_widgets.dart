import 'package:flutter/material.dart';

class ImageWelcome extends StatelessWidget {
  final double imgHeight;
  ImageWelcome({this.imgHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/cuvalles_entry.jpg'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBntPressed;
  const CustomButton({Key key, this.btnText, this.onBntPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                btnText,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10),
              //Icon(Icons.arrow_forward)
            ],
          ),
        ),
        onPressed: onBntPressed,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
