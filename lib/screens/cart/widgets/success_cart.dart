
import 'package:bloc_listen/screens/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class SuccessCartWidget extends StatelessWidget {
  const SuccessCartWidget({
    super.key,
    required this.successState,
    required this.cartBloc,
  });

  final CartLoadedState successState;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.teal,
        elevation: 4.0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: successState.cartItem.isEmpty
              ? const Center(
                  child: Text(
                    'No items in the cart',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final posts = successState.cartItem[index];
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal[100],
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(
                          posts.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[900],
                          ),
                        ),
                        subtitle: Text(posts.body),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[300],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            cartBloc.add(CartRemoveFromCartEvent(
                                productForRemove: posts));
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: successState.cartItem.length,
                ),
        ),
      ),
    );
  }
}
