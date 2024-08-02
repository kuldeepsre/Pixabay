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
        bloc.add(FetchData(state.currentPage + 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagination Example')),
      body: BlocBuilder<PaginationBloc, PaginationState>(
        builder: (context, state) {
          if (state is PaginationLoading && (state is PaginationInitial || state is PaginationLoaded && (state as PaginationLoaded).data.isEmpty)) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PaginationError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          final data = state is PaginationLoaded ? state.data : <Map<String, dynamic>>[];

          return ListView.builder(
            controller: _scrollController,
            itemCount: data.length + (state is PaginationLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= data.length) {
                return const Center(child: CircularProgressIndicator());
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
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
