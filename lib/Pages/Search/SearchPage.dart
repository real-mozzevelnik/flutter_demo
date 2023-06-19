import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled1/bloc/SearchBloc/search_bloc.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.white30,
                    ),
                    hintText: "Search...",
                    hintStyle: const TextStyle(
                        color: Colors.white30
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            color: Colors.deepPurple
                        )
                    ),
                  ),
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  onChanged: (input) {
                    context.read<SearchBloc>().add(SearchLoadingEvent(
                        text: input));
                  }
              ),
              Expanded(
                  child: SizedBox(
                      height: double.maxFinite,
                      child: Center(
                          child: BlocBuilder<SearchBloc, SearchState>(
                              builder: (context, state) {
                                if (state is SearchEmptyState) {
                                  return const Text(
                                      "Searching results will appear here...",
                                      style: TextStyle(
                                          color: Colors.white30,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20
                                      )
                                  );
                                }
                                else if (state is SearchLoadingState) {
                                  return const CircularProgressIndicator(
                                    color: Colors.deepPurple,
                                  );
                                }
                                else if (state is SearchLoadedState) {
                                  return PageView.builder(
                                      itemCount: state.img_urls.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (BuildContext context,
                                          index) {
                                        return Card(
                                          // shape: ShapeBorder.lerp(0.5, 0.6, 0.6),
                                            margin: const EdgeInsets.all(30.0),
                                            child: Column(
                                              children: <Widget>[
                                                Image.network(
                                                    state.img_urls[index])
                                              ],
                                            )
                                        );
                                      }
                                  );
                                };
                                return SearchBar(
                                  backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) => Colors.redAccent),
                                );
                                return const Material();
                              }
                          )
                      )
                  )
              )
            ],
          )
      ),
    );
  }
}

