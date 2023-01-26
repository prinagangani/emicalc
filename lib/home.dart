
import 'package:flutter/material.dart';

    class Home extends StatefulWidget {
      const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}
class HomeState extends State<Home> {
  double loanAmount = 0;
  double loanInterest = 0;
  double loanYears = 0;

  double totalInterest = 0;
  double perMonthEMI = 0;
  double perMonthInterest = 0;

  int interestPerMonth = 0;
  int emiPerMonth = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2C3333),
          leading: const Icon(Icons.all_inclusive),
          title: const Text("EMI calc",
              style: TextStyle(color: Color(0xFFE7F6F2), letterSpacing: 2)),
        ),
        body: Stack(
          children: [
            // main container background
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 5, spreadRadius: 5),
                ],
                color: Color(0xFF395B64),
              ),
            ),

            // per month emi text / container
            SizedBox(
              height: 150,
              width: double.infinity,
              //color: Colors.white,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // per month emi
                      SizedBox(
                        height: 100,
                        width: 200,
                        //color: Colors.white,
                        child: Column(
                          children: [
                            const Text("Your EMI is",style: TextStyle(color: Color(0xFFE7F6F2),letterSpacing: 2,fontSize: 10,),),
                            const SizedBox(height: 4,),
                            Text("\$ $emiPerMonth",style: const TextStyle(color: Color(0xFFE7F6F2),letterSpacing: 2,fontSize: 40,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 4,),
                            const Text("Per month",style: TextStyle(color: Color(0xFFE7F6F2),letterSpacing: 2,fontSize: 10,),),
                          ],
                        ),
                      ),

                      // per month interest
                      SizedBox(
                        height: 100,
                        width: 200,
                        //color: Colors.white,
                        child: Column(
                          children: [
                            const Text("Your Interest",style: TextStyle(color: Color(0xFFE7F6F2),letterSpacing: 2,fontSize: 10,),),
                            const SizedBox(height: 4,),
                            Text("\$ $interestPerMonth",style: const TextStyle(color: Color(0xFFE7F6F2),letterSpacing: 2,fontSize: 40,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 4,),
                            const Text("Per month",style: TextStyle(color: Color(0xFFE7F6F2),letterSpacing: 2,fontSize: 10,),),
                          ],
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            ),


            // container of slider
            Center(
              child: Padding(
                padding:
                const EdgeInsets.only(left: 40, right: 40, bottom: 25, top: 100),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 5),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFA5C9CA),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        // loan amount slider
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text("Loan Amount",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180, top: 20),
                              child: Text("\$ $loanAmount",
                                  style: const TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                          ],
                        ),
                        Slider(
                          max: 1000000,
                          divisions: 10,
                          activeColor: const Color(0xFF2C3333),
                          inactiveColor: const Color(0xFF395B50),
                          value: loanAmount,
                          onChanged: (value) {
                            setState(() {
                              loanAmount = value;
                            });
                          },
                        ),

                        // interest slider
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text("Loan Interest",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 225, top: 20),
                              child: Text("$loanInterest%",
                                  style: const TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                          ],
                        ),
                        Slider(
                          max: 15,
                          divisions: 15,
                          activeColor: const Color(0xFF2C3333),
                          inactiveColor: const Color(0xFF395B50),
                          value: loanInterest,
                          onChanged: (value) {
                            setState(() {
                              loanInterest = value;
                            });
                          },
                        ),

                        // emi by year
                        // loan amount slider
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text("Total Years",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 200, top: 20),
                              child: Text("$loanYears Years",
                                  style: const TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                          ],
                        ),
                        Slider(
                          max: 10,
                          divisions: 10,
                          activeColor: const Color(0xFF2C3333),
                          inactiveColor: const Color(0xFF395B50),
                          value: loanYears,
                          onChanged: (value) {
                            setState(() {
                              loanYears = value;
                            });
                          },
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        // row for clear and calculate

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // clear container
                            InkWell(
                              onTap: () {
                                setState(() {
                                  loanAmount = 0;
                                  loanInterest = 0;
                                  loanYears = 0;
                                });
                              },
                              child: Container(
                                height: 55,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xFF2C3333),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                      BoxShadow(
                                          color: Color(0xFF395B64),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    color: const Color(0xFF2C3333),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFF2C3333),
                                      Color(0xFF395B64),
                                    ])),
                                child: const Center(
                                  child: Text("Clear",
                                      style: TextStyle(
                                        color: Color(0xFFE7F6F2),
                                        fontSize: 25,
                                        letterSpacing: 2,
                                      )),
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 50,
                            ),

                            // count container for all calculation
                            InkWell(
                              onTap: () {
                                setState(() {
                                  totalInterest = (loanAmount*loanInterest)/100;
                                  perMonthEMI = (loanAmount+totalInterest)/(loanYears*12);
                                  perMonthInterest = totalInterest / (loanYears*12);

                                  interestPerMonth = perMonthInterest.toInt();
                                  emiPerMonth = perMonthEMI.toInt();

                                });
                              },
                              child: Container(
                                height: 55,
                                width: 150,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xFF2C3333),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                      BoxShadow(
                                          color: Color(0xFF395B64),
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFF2C3333),
                                      Color(0xFF395B64),
                                    ])),
                                child: const Center(
                                  child: Text("Count",
                                      style: TextStyle(
                                        color: Color(0xFFE7F6F2),
                                        fontSize: 25,
                                        letterSpacing: 2,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}