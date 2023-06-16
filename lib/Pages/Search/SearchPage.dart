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
              SearchBar(
                controller: TextEditingController(),
                hintText: "Search...",
                leading: const Icon(
                    Icons.search
                ),
                onChanged: (input) {
                  context.read<SearchBloc>().add(SearchLoadingEvent(
                      text: input));
                },
                hintStyle: MaterialStateProperty.resolveWith((states) =>
                const TextStyle(
                    color: Colors.white30
                )),
                textStyle: MaterialStateProperty.resolveWith((states) =>
                const TextStyle(
                    color: Colors.white
                )),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchEmptyState) {
                      return Container(
                          height: 500.0,
                          child: const Center(
                            child: Text(
                              "Searching results will appear here...",
                              style: TextStyle(
                                  color: Colors.white30,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20
                              ),
                            ),
                          )
                      );
                    }
                    else if (state is SearchLoadingState) {
                      return const CircularProgressIndicator(
                        color: Colors.deepPurple,
                      );
                    }
                    return const Material();
                  }
              )
            ],
          )
      ),
    );
  }
}