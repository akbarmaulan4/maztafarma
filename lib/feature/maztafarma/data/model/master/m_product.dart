import 'package:maztafarma/feature/maztafarma/domain/entity/master/e_product.dart';
part 'm_product.g.dart';

class MProduct extends EProduct{
  MProduct({
    int? id_product,
    String? nama_product,
    String? id_divisi_sales,
    String? id_spesialis,
    String? desc,
    String? image,
    String? exp_date
  }):super(
      id_product: id_product,
      nama_product: nama_product,
      id_divisi_sales: id_divisi_sales,
      id_spesialis: id_spesialis,
      desc: desc,
      image: image,
      exp_date: exp_date);

  factory MProduct.fromJson(Map<String, dynamic> json) => _$fromJson(json);

  Map<String, dynamic> toJson() => _$toJson(this);
}