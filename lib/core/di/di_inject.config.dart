// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_sources/remote/auth/auth_remote_data_source_impl.dart'
    as _i989;
import '../../api/data_sources/remote/brand/brand_remote_data_source_impl.dart'
    as _i479;
import '../../api/data_sources/remote/cart/cart_remote_data_source_impl.dart'
    as _i1062;
import '../../api/data_sources/remote/category/category_remote_data_source_impl.dart'
    as _i572;
import '../../api/data_sources/remote/product/product_remote_data_source_impl.dart'
    as _i122;
import '../../data/data_sources/remote/auth/auth_remote_data_source.dart'
    as _i202;
import '../../data/data_sources/remote/brand/brand_remote_data_source.dart'
    as _i167;
import '../../data/data_sources/remote/cart/cart_remote_data_source.dart'
    as _i358;
import '../../data/data_sources/remote/category/category_remote_data_source.dart'
    as _i89;
import '../../data/data_sources/remote/product/product_remote_data_source.dart'
    as _i1038;
import '../../data/repository/auth/auth_repository_impl.dart' as _i392;
import '../../data/repository/brand/brand_repository_impl.dart' as _i829;
import '../../data/repository/cart/cart_repository_impl.dart' as _i756;
import '../../data/repository/category/category_repository_impl.dart' as _i954;
import '../../data/repository/product/product_repository_impl.dart' as _i722;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/brands/brand_repository.dart' as _i506;
import '../../domain/repository/cart/cart_repository.dart' as _i1048;
import '../../domain/repository/category/category_repository.dart' as _i495;
import '../../domain/repository/product/product_repository.dart' as _i798;
import '../../domain/use_cases/add_product_cart_use_case.dart' as _i645;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_categories_use_case.dart' as _i201;
import '../../domain/use_cases/get_all_products_use_case.dart' as _i939;
import '../../domain/use_cases/get_product_cart_use_case.dart' as _i778;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../feature/auth/presentation/view_model/login_view_model.dart'
    as _i834;
import '../../feature/auth/presentation/view_model/register_view_model.dart'
    as _i130;
import '../../feature/pages/cart_tab/view_model/cart_view_model.dart' as _i662;
import '../../feature/pages/home_screen/view_model/home_screen_view_model.dart'
    as _i856;
import '../../feature/pages/home_screen_tab/view_model/home_view_model.dart'
    as _i610;
import '../../feature/pages/product_tab/view_model/product_view_model.dart'
    as _i866;
import '../dio/get_it_module.dart' as _i349;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i856.HomeScreenViewModel>(() => _i856.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions);
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger,
    );
    gh.singleton<_i394.ApiServices>(() => getItModule.provideApiServices);
    gh.factory<_i167.BrandRemoteDataSource>(
      () => _i479.BrandRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i358.CartRemoteDataSource>(
      () => _i1062.CartRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i1038.ProductRemoteDataSource>(
      () => _i122.ProductRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i202.AuthRemoteDataSource>(
      () => _i989.AuthRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i506.BrandsRepository>(
      () => _i829.BrandRepositoryImpl(gh<_i167.BrandRemoteDataSource>()),
    );
    gh.factory<_i89.CategoryRemoteDataSource>(
      () => _i572.CategoryRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i1048.CartRepository>(
      () => _i756.CartRepositoryImpl(gh<_i358.CartRemoteDataSource>()),
    );
    gh.factory<_i773.GetAllBrandsUseCase>(
      () => _i773.GetAllBrandsUseCase(gh<_i506.BrandsRepository>()),
    );
    gh.factory<_i645.AddProductCartUseCase>(
      () => _i645.AddProductCartUseCase(gh<_i1048.CartRepository>()),
    );
    gh.factory<_i778.GetProductCartUseCase>(
      () => _i778.GetProductCartUseCase(gh<_i1048.CartRepository>()),
    );
    gh.factory<_i662.CartViewModel>(
      () => _i662.CartViewModel(
        addProductCartUseCase: gh<_i645.AddProductCartUseCase>(),
        getProductCartUseCase: gh<_i778.GetProductCartUseCase>(),
      ),
    );
    gh.factory<_i495.CategoryRepository>(
      () => _i954.CategoryRepositoryImpl(gh<_i89.CategoryRemoteDataSource>()),
    );
    gh.factory<_i798.ProductRepository>(
      () => _i722.ProductRepositoryImpl(gh<_i1038.ProductRemoteDataSource>()),
    );
    gh.factory<_i201.GetAllCategoriesUseCase>(
      () => _i201.GetAllCategoriesUseCase(gh<_i495.CategoryRepository>()),
    );
    gh.factory<_i939.GetAllProductsUseCase>(
      () => _i939.GetAllProductsUseCase(gh<_i798.ProductRepository>()),
    );
    gh.factory<_i912.AuthRepository>(
      () => _i392.AuthRepositoryImpl(gh<_i202.AuthRemoteDataSource>()),
    );
    gh.factory<_i866.ProductViewModel>(
      () => _i866.ProductViewModel(
        getAllProductsUseCase: gh<_i939.GetAllProductsUseCase>(),
        addProductCartUseCase: gh<_i645.AddProductCartUseCase>(),
      ),
    );
    gh.factory<_i610.HomeViewModel>(
      () => _i610.HomeViewModel(
        getAllCategoriesUseCase: gh<_i201.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i773.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(gh<_i912.AuthRepository>()),
    );
    gh.factory<_i130.RegisterViewModel>(
      () => _i130.RegisterViewModel(gh<_i479.RegisterUseCase>()),
    );
    gh.factory<_i834.LoginViewModel>(
      () => _i834.LoginViewModel(gh<_i471.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i349.GetItModule {}
