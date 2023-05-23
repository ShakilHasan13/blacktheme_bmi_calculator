import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight=70.0;
const bottomContainerColor=Color(0xFFEB1555);
const ReuseableCardColor=Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children:  [
                 Expanded(
                    child: ReuseableCard(colour: ReuseableCardColor,
                    cardChild: IconContent(cardIcon: FontAwesomeIcons.mars, cardText: "MALE",),)),
                Expanded(
                    child: ReuseableCard(colour:  ReuseableCardColor,
                    cardChild:IconContent(cardIcon: FontAwesomeIcons.venus, cardText: "FEMALE",) ,))
              ],
            )),
             Expanded(
                child: ReuseableCard(colour: ReuseableCardColor,)),
            Expanded(
                child: Row(
              children:  [
                Expanded(
                    child:ReuseableCard(colour: ReuseableCardColor,)),
                Expanded(
                    child: ReuseableCard(colour: ReuseableCardColor,))
              ],
            )),
            Container(
              color:bottomContainerColor ,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              height:bottomContainerHeight ,
            )
          ],
          
        ));
  }
}




