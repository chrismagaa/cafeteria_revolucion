


import 'package:cafeteria_revolucion/pages/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class OnboardingPage extends StatelessWidget{

OnboardingController con = Get.put(OnboardingController());


@override
Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black, // Replace with your desired color
  ));

  return
    Scaffold(
      //change color status bar
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: con.pageController,
                onPageChanged: (index) => con.onPageChanged(),
                itemBuilder: (context, index){
                  return  OnBoardContent(
                    title: onBoardData[index].title,
                    description: onBoardData[index].description,
                    imagePath: onBoardData[index].imagePath,
                  );
                },
                itemCount: 3,
              ),
            ),
            GetBuilder<OnboardingController>(builder: (value) =>
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    //change elevation light to dark
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 3,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            width: 100,
                            child: GestureDetector(
                              onTap: () => con.currentIndex == 0 ? Get.offAllNamed('/') : con.previousPage(),
                              child:     con.currentIndex == 0 ? Text('Salir', style: TextStyle(color: Colors.grey[700])) : Text('Anterior',  style: TextStyle(color: Colors.grey[700])),
                            ),
                          ),
                          Spacer(flex: 1),
                          ...List.generate(
                              onBoardData.length, (index)  => Padding(
                            padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                            child: _dotIndicator(con.currentIndex == index),
                          )),
                          Spacer(flex: 1),
                          Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: 100,
                            child: GestureDetector(
                                onTap: () => { con.nextPage()  },
                                child: con.currentIndex == 2 ? Text('Comenzar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold

                                )) : Text('Continuar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),


    );




}


Widget _dotIndicator(bool isActive){
  return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive? 14 : 6,
      width: isActive? 14 : 6,
      decoration: BoxDecoration(
          color: isActive? Colors.black : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(100))
      )
  );
}


}

class Onboard{
  final String title;
  final String description;
  final String imagePath;

  Onboard({required this.title, required this.description, required this.imagePath});
}


final List<Onboard> onBoardData = [
  Onboard(
      title: 'Bienvenido a Gran Cafe Revolución',
      description: 'Tu café favorito, ahora en la palma de tu mano.',
      imagePath: 'assets/img/getting_coffe.png'
  ),
  Onboard(
      title: 'Sin contratiempos',
      description: 'Olvídate de las filas. Pide y recoge en minutos',
      imagePath: 'assets/img/barista_coffe.png'
  ),
  Onboard(
      title: '¡Únete a la revolución!',
      description: '¡Descúbrelo ahora!',
      imagePath: 'assets/img/conversation_coffe.png'
  )
];



class OnBoardContent extends StatelessWidget{

  const OnBoardContent({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath
  }) : super(key: key);

  final String title, description, imagePath;

  @override
  Widget build(BuildContext context ) {
    return Column(
      children: [
        _imageIntroduction(),
        Spacer(),
        _titleIntroduction(),
        _descriptionIntroduction(),
      ],
    );
  }



  Widget _descriptionIntroduction(){
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Column(
        children: [
          Text(
            description,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600]
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _titleIntroduction(){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }


  Widget _imageIntroduction(){
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      height: MediaQuery.of(Get.context!).size.height * 0.4,
      child:
      Image(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,


      ),
    );
  }


}
