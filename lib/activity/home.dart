
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController =  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  @override
  Widget build(BuildContext context) {

    Map info = ModalRoute.of(context)?.settings.arguments as Map<String,String>;

    String p = info['temp_value'].toString();
    if(p == "NA")
      {
      }
    else
      {
        p = info['temp_value'].toString().substring(0,4);
      }

    final h = info['hum_val'];
    final a = info['air_value'].toString();
    String d = info['desc_value'].toString();
    String i = info['icon_value'].toString();
    String c = info['city_value'].toString();


    var cityName = ["mumbai" , "delhi" , "kanpur" , "indore" , "lucknow " , "dehradun"];
    final random =  Random();
    var city = cityName[random.nextInt(cityName.length)];

    return  SingleChildScrollView(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue.shade200,
          ),
        ),
       body: SafeArea(
         child: Container(
           decoration: BoxDecoration(//background color
             gradient: LinearGradient(
               begin:Alignment.topLeft ,
               end: Alignment.bottomRight,
               colors:[
                 Colors.blue.shade200,
                 Colors.blue,
               ]
             )
           ),
           child: Column(
            children: [
              Container(//search  container
               padding: const EdgeInsets.symmetric(horizontal: 14),
                margin: const  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child:  Row(
                  children: [
                    GestureDetector(
                      onTap:  (){
                        if(searchController.text.replaceAll("  ", "") =="")
                          {
                          }
                        else {
                          Navigator.pushNamed(context, '/loading', arguments: {
                            searchController.text.toString(),
                          }
                          );
                        }
      
                      },
                      child:const Icon(Icons.search,
                        color: Colors.blueAccent,
                      ),

                    ),
                    const SizedBox(width: 10,),
                      Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city" ,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row( // humidity or details
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      margin:const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      padding:const EdgeInsets.all(20),
                      child:  Row(
                        children: [
                          Image.network("https://openweathermap.org/img/wn/$i@2x.png"),
                          const SizedBox(width: 10,),
                           Column(
                            children: [
                               Text("$d",style:const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
      
                              ),),
                               Text("$c",style:const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                               ),),
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
      
              Row( // temperature
                children: [
                  Expanded(
                    child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      margin:const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      padding: const EdgeInsets.all(40),
      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Icon(WeatherIcons.thermometer,size: 32,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$p",style : const TextStyle(fontSize: 80)),
                             const  SizedBox(width: 10,),
                            const   Text("C",style : TextStyle(fontSize: 40)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row( // more details
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(//1
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      padding: const EdgeInsets.all(26),
                      height: 200,
                      child:  Column(
                        children: [
                         const  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.day_windy,size: 32,),
                            ],
                          ),
                         const  SizedBox(height: 20,),
                          Text("$a",style:const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                         const Text("Km/Hr",style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(//2
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.6),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      padding: const EdgeInsets.all(20),
                      height: 200,
                      child:Column(
                        children: [
                         const  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity,size: 32,),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text("$h",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                          const Text("Percent",style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),               Container(
                  height: 150,
                child:const Padding(
                  padding:  EdgeInsets.all(12),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Made By Shyam" ,style: TextStyle(fontSize: 18,color: Colors.white),),
                      Text("Data Provided By OpenWeatherMap.Org",style: TextStyle(fontSize: 12,color: Colors.white),),
                    ],
                  ),
                ),
              )
            ],
           ),
         ),
       ),
      ),
    );

  }

}


