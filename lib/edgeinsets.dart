import 'package:flutter/material.dart';

void edgeinsets(){
  runApp(const Edgeinsets());
}

class Edgeinsets extends StatelessWidget {
  const Edgeinsets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
          appBar: AppBar(
          
          title: const Text('Loremas_Task4_Edgeinsets')
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  
                ),
                padding: const EdgeInsets.all(30), 
                child: const Text(
                  'EdgeInstes.all(30)',
                  style: TextStyle (fontSize: 12,
                  fontWeight: FontWeight.w600),
                )
              ),
              const SizedBox(height: 16),

              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10, 
                ), 
                child: const Text(
                  'EdgeInsets.symmetric(horizontal: 40,vertical: 10)',
                  style: TextStyle (fontSize: 12,
                  fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                )
              ),
              const SizedBox(height: 16),
            


            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  
                ),
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 10,
                  right: 5,
                  bottom: 20,
                ), 
                child: const Text(
                  'EdgeInsets.only(left: 30,top: 10,right: 5,bottom: 20)',
                  style: TextStyle (fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
                  textAlign: TextAlign.center,

                )
              ),
              const SizedBox(height: 16),

            Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  
                ),
                padding: const EdgeInsets.fromLTRB(10, 20, 30, 40), 
                child: const Text(
                  'EdgeInsets.fromLTRB(10, 20, 30, 40)',
                  style: TextStyle (fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
                  textAlign: TextAlign.center,

                )
              ),
              const SizedBox(height: 16),


            ]

            
            
          )
        )
    );

    
  }

}
