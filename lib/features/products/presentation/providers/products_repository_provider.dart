import 'package:riverpod/riverpod.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';

import 'package:teslo_shop/features/products/domain/domain.dart';
import 'package:teslo_shop/features/products/infraestructure/infrastructure.dart';

final productsRepositoryProvicer = Provider<ProductsRepository>((ref) {

  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final productsRepository = ProductsRepositoryImpl(
    ProductsDatasourceImpl(accessToken: accessToken)
  );
  return productsRepository;
});
