

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

List availableColors = const [
  Color(0xffCE8722),
  Color(0xffDC4447),
  Color(0xff181E27),
  Color(0xff44565C),
  Color(0xffE4E4E4),
  Color(0xff6D4F44),
  Color(0xffDFA8A9),
];

int selectedIndex = 0;
int selectedRating = 0;

List<String> options = <String>[
  'Crop Tops',
  'Jeans',
  'Short skirts',
  'Bikinis'
];
String dropdownValue = 'Crop Tops';

class _FilterDrawerState extends State<FilterDrawer> {
  RangeValues _currentRangeValues = const RangeValues(10, 100);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: DrawerHeader(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      margin: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Filter",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(
                              "assets/images/search_filter.svg",
                              colorFilter: const ColorFilter.mode(
                                  Color(0xff33302E), BlendMode.srcIn),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Price",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        thumbColor: Colors.white54,
                        // thumbShape: CustomSliderThumbShape(),
                        // overlayShape:
                        //     const RoundSliderOverlayShape(overlayRadius: 18.0),
                        valueIndicatorColor: Colors.black),
                    child: Stack(children: [
                      RangeSlider(
                          values: _currentRangeValues,
                          activeColor: const Color(0xff33302E),
                          inactiveColor:
                              const Color.fromARGB(255, 167, 167, 187),
                          min: 10,
                          max: 100,
                          // labels: RangeLabels(
                          //     "\$${_currentRangeValues.start.toStringAsFixed(2)}",
                          //     "\$${_currentRangeValues.end.toStringAsFixed(2)}"),
                          // divisions: 10,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          }),
                      Positioned(
                        top: 34,
                        left: 12,
                        right: 12,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${_currentRangeValues.start.toStringAsFixed(0)}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              '\$${_currentRangeValues.end.toStringAsFixed(0)}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Color",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      availableColors.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.transparent),
                            color: availableColors[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Star Rating",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRating = index;
                          });
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                              color: selectedRating == index
                                  ? Colors.black
                                  : Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                "assets/images/star.svg",
                                colorFilter: ColorFilter.mode(
                                    selectedRating == index
                                        ? Colors.white
                                        : Colors.black,
                                    BlendMode.srcIn),
                              ),
                              Text(
                                "${index + 1}",
                                style: TextStyle(
                                    color: selectedRating == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffE0E0E0),
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        underline: const SizedBox(),
                        isExpanded: true,
                        style: const TextStyle(color: Colors.black),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.black),
                        selectedItemBuilder: (BuildContext context) {
                          return options.map((String value) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Text(dropdownValue,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400)),
                            );
                          }).toList();
                        },
                        items: options
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          );
                        }).toList(),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Discount",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //? For next release
                  // SizedBox(
                    // height: 300,
                  //   child: Expanded(
                  //     child: GridView.builder(
                  //       itemCount: 2,
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.vertical,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //         gridDelegate:
                  //             const SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2, // Number of columns
                  //           // crossAxisSpacing: 10.0, // Spacing between columns
                  //           // mainAxisSpacing: 10.0, // Spacing between rows
                  //           // childAspectRatio: 1.0, // Aspect ratio of the items
                  //         ),
                  //         itemBuilder: (context, index) {
                  //           return Chip(
                  //               shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(50)),
                  //               label: SizedBox(
                  //                 width: 70,
                  //                 height: 20,
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     const Text(
                  //                       "50% off",
                  //                       style:
                  //                           TextStyle(fontWeight: FontWeight.w500),
                  //                     ),
                  //                     SvgPicture.asset(
                  //                       "assets/images/Close_round.svg",
                  //                     )
                  //                   ],
                  //                 ),
                  //               ));
                  //         }),
                  //   ),
                  // )
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          label: SizedBox(
                            width: 70,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "50% off",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SvgPicture.asset(
                                  "assets/images/Close_round.svg",
                                )
                              ],
                            ),
                          )),
                      Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          label: SizedBox(
                            width: 70,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "50% off",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SvgPicture.asset(
                                  "assets/images/Close_round.svg",
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          label: SizedBox(
                            width: 70,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "50% off",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SvgPicture.asset(
                                  "assets/images/Close_round.svg",
                                )
                              ],
                            ),
                          )),
                      Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          label: SizedBox(
                            width: 70,
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "50% off",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SvgPicture.asset(
                                  "assets/images/Close_round.svg",
                                )
                              ],
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Reset",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 113,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff33302E)),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      );
  }
}