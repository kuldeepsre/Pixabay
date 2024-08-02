import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pagination/pagination_bloc.dart';


class PaginationPage extends StatefulWidget {
  @override
  _PaginationPageState createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    context.read<PaginationBloc>().add(FetchData(1));
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      final bloc = context.read<PaginationBloc>();
      final state = bloc.state;
      if (state is PaginationLoaded && state.currentPage < state.totalPages) {
        bloc.add(FetchNextPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagination Example')),
      body: BlocBuilder<PaginationBloc, PaginationState>(
        builder: (context, state) {
          if (state is PaginationLoading && (state is PaginationInitial || (state is PaginationLoaded &&( state as PaginationLoaded).data.isEmpty))) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PaginationError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Column(
            children: [
              Expanded(
                child: BlocSelector<PaginationBloc, PaginationState, List<Map<String, dynamic>>>(
                  selector: (state) {
                    if (state is PaginationLoaded) {
                      return state.data;
                    }
                    return [];
                  },
                  builder: (context, data) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: data.length + (state is PaginationLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= data.length) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final item = data[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(item['avatar']),
                          ),
                          title: Text('${item['first_name']} ${item['last_name']}'),
                          subtitle: Text(item['email']),
                        );
                      },
                    );
                  },
                ),
              ),
              if (state is PaginationLoaded)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (state.currentPage > 1)
                        TextButton(
                          onPressed: () => context.read<PaginationBloc>().add(FetchPreviousPage()),
                          child: Text('Previous'),
                        ),
                      if (state.currentPage < state.totalPages)
                        TextButton(
                          onPressed: () => context.read<PaginationBloc>().add(FetchNextPage()),
                          child: Text('Next'),
                        ),
                    ],
                  ),
                ),
              if (state is PaginationError)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Failed to load data', style: TextStyle(color: Colors.red)),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}