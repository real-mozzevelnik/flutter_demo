import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Services/SearchService.dart';
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
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(50.0)
                                            ),
                                            margin: const EdgeInsets.all(
                                                30.0),
                                            child: Container(
                                                padding: const EdgeInsets
                                                    .all(
                                                    15.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    ClipRRect(
                                                        borderRadius: BorderRadius
                                                            .circular(50.0),
                                                        child: SizedBox
                                                            .fromSize(
                                                            size: const Size
                                                                .fromRadius(
                                                                180.0),
                                                            child: Image
                                                                .network(
                                                              state
                                                                  .img_urls[index],
                                                              fit: BoxFit
                                                                  .fill,
                                                              filterQuality: FilterQuality
                                                                  .high,
                                                            )
                                                        )
                                                    ),
                                                    const Spacer(),
                                                    Animate(
                                                      effects: [
                                                        FadeEffect(
                                                            delay: 600.ms
                                                        ),
                                                      ],
                                                      child: IconButton(
                                                          onPressed: () {
                                                            SearchService.saveImage(state.img_urls[index]);
                                                          },
                                                          icon: const Icon(
                                                              Icons.download
                                                          )
                                                      ),
                                                    )
                                                  ],
                                                )
                                            )
                                        );
                                      }
                                  );
                                };
                                return Container();
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
