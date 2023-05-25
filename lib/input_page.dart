import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  Gender? selectedGender;
  int weight=60;
  int age=20;

  //  Color maleCardColor=inactiveCardColor;
  //  Color femaleCardColor=inactiveCardColor;
  // //1= male, 2=female
  //  void updateColor(Gender selectedGender){
  //    // if(selectedGender==Gender.male){
  //    // //male is pressed
  //    //   if(maleCardColor==inactiveCardColor){
  //    //     maleCardColor=ReuseableCardColor;
  //    //     femaleCardColor=inactiveCardColor;
  //    //   }
  //    //   else{
  //    //     maleCardColor=inactiveCardColor;
  //    //
  //    //   }
  //    // }
  //    selectedGender==Gender.male? maleCardColor=inactiveCardColor:maleCardColor=ReuseableCardColor;
  //    if(selectedGender==Gender.female){
  //      if(femaleCardColor==inactiveCardColor){
  //        femaleCardColor=ReuseableCardColor;
  //        maleCardColor=inactiveCardColor;
  //      }
  //      else{
  //        femaleCardColor=inactiveCardColor;
  //
  //      }
  //    }
  //  }

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
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReuseableCard(
                    colour: selectedGender == Gender.male
                        ? kReuseableCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: "MALE",
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReuseableCard(
                    colour: selectedGender == Gender.female
                        ? kReuseableCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: "FEMALE",
                    ),
                  ),
                ))
              ],
            )),
            Expanded(
                child: ReuseableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: kCardTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kSliderDigitTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kCardTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x15EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98)
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 250,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
              colour: kReuseableCardColor,
            )),
            Expanded(
                child: Row(

              children: [
                Expanded(
                    child: ReuseableCard(
                      cardChild: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Text('WEIGHT',
                          style: kCardTextStyle,),
                          Text(
                            weight.toString(),
                            style:kSliderDigitTextStyle ,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                             ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),

                        ],
                      ),
                  colour: kReuseableCardColor,
                )),
                Expanded(
                    child: ReuseableCard(
                      cardChild: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Text('AGE',
                            style: kCardTextStyle,),
                          Text(
                            age.toString(),
                            style:kSliderDigitTextStyle ,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),

                        ],
                      ),
                      colour: kReuseableCardColor,
                    ))
              ],
            )),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>const ResultPage()));
              },
              child: Container(
                child: Text('Calculate'),
                color: kBottomContainerColor,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.0),
                height: kBottomContainerHeight,
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

        onPressed: onPressed,

        child: Icon(icon) ,
        constraints: BoxConstraints.tightFor(
          height: 58.0,
          width: 58.0,
        ),
        elevation: 6.0,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
    );
  }
}
