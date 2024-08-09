import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'package:provider/provider.dart';

import '../Web Api/pet_review_provider.dart';
import 'colors.dart';
import 'date_time.dart';

class ListPetCard {
  static Widget petCard(
    context,
    double width,
    String petImageUrl,
    String petName,
    String petCategory,
    String description,
    String petGender,
    String petColor,
    String petStatus,
    bool review,
    String documentId,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(33, 134, 181, 220),
            borderRadius: BorderRadiusDirectional.circular(10)),

        // child: Card(
        //  // elevation: 10,
        //   shape: BeveledRectangleBorder(
        //       side: const BorderSide(color: Colors.orange, width: 0.6),
        //       borderRadius: BorderRadiusDirectional.circular(10)),
        //   color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(petImageUrl.toString()),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ShowText.detailsText(
                    "Pet Name: ",
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  Expanded(
                    child: ShowText.detailsText(petName),
                  ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  ShowText.detailsText(
                    "Category: ",
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  Expanded(
                    child: ShowText.detailsText(petCategory),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  ShowText.detailsText(
                    "Description: ",
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  Expanded(child: ShowText.detailsText(description)),
                ],
              ),
              const SizedBox(
                height: 02,
              ),
              Row(
                children: [
                  ShowText.detailsText(
                    "Gender: ",
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  Expanded(child: ShowText.detailsText(petGender)),
                ],
              ),
              const SizedBox(
                height: 02,
              ),
              // Row(
              //   children: [
              //     ShowText.detailsText(
              //       "Color: ",
              //       fontSize: 10,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     Expanded(child: ShowText.detailsText(petColor)),
              //   ],
              // ),
              // const SizedBox(
              //   height: 02,
              // ),
              // Row(
              //   children: [
              //     ShowText.detailsText(
              //       "Status: ",
              //       fontSize: 10,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     Expanded(child: ShowText.detailsText(petStatus)),
              //   ],
              // ),
              const SizedBox(
                height: 02,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ),
      ),
    );

    //  Padding(
    //   padding: const EdgeInsets.only(
    //     left: 20.0,
    //     right: 20.0,
    //   ),
    //   // child: Card(
    //   //   color: AppColor.orange,
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
    //     child: Container(
    //         decoration: BoxDecoration(
    //             color: Color.fromARGB(33, 134, 181, 220),
    //             borderRadius: BorderRadiusDirectional.circular(10)),

    //         // child: Card(
    //         //  // elevation: 10,
    //         //   shape: BeveledRectangleBorder(
    //         //       side: const BorderSide(color: Colors.orange, width: 0.6),
    //         //       borderRadius: BorderRadiusDirectional.circular(10)),
    //         //   color: AppColor.whiteColor,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 SizedBox(
    //                   height: 80,
    //                   width: 80,
    //                   child: Image.network(
    //                     petImageUrl,
    //                     height: 80,
    //                     width: 80,
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 15,
    //                 ),
    //                 Expanded(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Row(
    //                         children: [
    //                           ShowText.detailsText(
    //                             "Pet Name: ",
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           Expanded(
    //                             child: ShowText.detailsText(petName),
    //                           ),
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Row(
    //                         children: [
    //                           ShowText.detailsText(
    //                             "Category: ",
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           ShowText.detailsText(petCategory)
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Row(
    //                         children: [
    //                           ShowText.detailsText(
    //                             "Description: ",
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           Expanded(
    //                               child: ShowText.detailsText(description)),
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Row(
    //                         children: [
    //                           ShowText.detailsText(
    //                             "Gender: ",
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           ShowText.detailsText(petGender)
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Row(
    //                         children: [
    //                           ShowText.detailsText(
    //                             "Color: ",
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           Expanded(child: ShowText.detailsText(petColor)),
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Row(
    //                         children: [
    //                           ShowText.detailsText(
    //                             "Status: ",
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           ShowText.detailsText(petStatus)
    //                         ],
    //                       ),
    //                       const SizedBox(
    //                         height: 5,
    //                       ),
    //                       Row(
    //                         children: [
    //                           ShowText.detailsText(
    //                             "Review: ",
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                           ShowText.detailsText(review.toString())
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             // Center(
    //             //   child: ElevatedButton(
    //             //       style: ElevatedButton.styleFrom(
    //             //         backgroundColor: Colors.black,
    //             //         minimumSize: const Size.fromHeight(50), // NEW
    //             //       ),
    //             //       onPressed: () {
    //             //         review
    //             //             ? Provider.of<PetReviewProvider>(context,
    //             //                     listen: false)
    //             //                 .petReviewCancel(documentId.toString())
    //             //             : Provider.of<PetReviewProvider>(context,
    //             //                     listen: false)
    //             //                 .petReview(documentId.toString());
    //             //       },
    //             //       child: review
    //             //           ? const Text("Cancel",
    //             //               style: TextStyle(
    //             //                 color: Colors.white,
    //             //                 fontSize: 23,
    //             //                 // fontWeight: FontWeight.bold
    //             //               ))
    //             //           : const Text(
    //             //               "Ok",
    //             //               style: TextStyle(
    //             //                 color: Colors.white,
    //             //                 fontSize: 23,
    //             //                 // fontWeight: FontWeight.bold
    //             //               ),
    //             //             )),
    //             // )
    //           ],
    //         )),
    //   ),
    //   // )
    // );
  }

  static Widget registeredPetCard(
    double width,
    String petImageUrl,
    String petName,
    String petCategory,
    String petBreed,
    String petGender,
    String petDob,
  ) {
    return Card(
      color: AppColor.green,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
            height: 90,
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(petImageUrl),
                      radius: 50,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ShowText.detailsText(
                              "Name: ",
                              fontWeight: FontWeight.bold,
                            ),
                            ShowText.detailsText(petName),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ShowText.detailsText(
                              "Category: ",
                              fontWeight: FontWeight.bold,
                            ),
                            ShowText.detailsText(petCategory),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ShowText.detailsText(
                              "Breed: ",
                              fontWeight: FontWeight.bold,
                            ),
                            ShowText.detailsText(petBreed),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ShowText.detailsText(
                              "Gender: ",
                              fontWeight: FontWeight.bold,
                            ),
                            ShowText.detailsText(petGender),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ShowText.detailsText(
                              "D.O.B: ",
                              fontWeight: FontWeight.bold,
                            ),
                            ShowText.detailsText(
                                DateTimeClass.stringToddMMyyyy(petDob) ?? ''),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }

  static Widget userPetCard(
    context,
    double width,
    String petImageUrl,
    String petName,
    String petCategory,
    String description,
    String petGender,
    String petColor,
    String petStatus,
    bool review,
    String documentId,
  ) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Card(
          color: review ? AppColor.orange : AppColor.orange.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            child: SizedBox(
                height: 250,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.network(
                            petImageUrl,
                            // height: 100,
                            // width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  ShowText.detailsText(
                                    "Pet Name: ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Expanded(
                                    child: ShowText.detailsText(petName),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ShowText.detailsText(
                                    "Category: ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ShowText.detailsText(petCategory)
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ShowText.detailsText(
                                    "Description: ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Expanded(
                                      child: ShowText.detailsText(description)),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ShowText.detailsText(
                                    "Gender: ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ShowText.detailsText(petGender)
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ShowText.detailsText(
                                    "Color: ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Expanded(
                                      child: ShowText.detailsText(petColor)),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ShowText.detailsText(
                                    "Status: ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ShowText.detailsText(petStatus)
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ShowText.detailsText(
                                    "Review: ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ShowText.detailsText(review.toString())
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size.fromHeight(10), // NEW
                          ),
                          onPressed: () {
                            review
                                ? Provider.of<PetReviewProvider>(context,
                                        listen: false)
                                    .petReviewCancel(documentId.toString())
                                : Provider.of<PetReviewProvider>(context,
                                        listen: false)
                                    .petReview(documentId.toString());
                          },
                          child: review
                              ? const Text("Cancel",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    // fontWeight: FontWeight.bold
                                  ))
                              : const Text(
                                  "Ok",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    // fontWeight: FontWeight.bold
                                  ),
                                )),
                    )
                  ],
                )),
          ),
        ));
  }
}
