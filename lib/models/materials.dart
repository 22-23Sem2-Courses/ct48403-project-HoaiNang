class Materials {
  final String? id;
  final String name;
  final int SoLuongNhap;
  final int SoLuongConLai;
  final String DonViTinh;
  final String image;

  Materials(
      {this.id,
      required this.name,
      required this.SoLuongNhap,
      required this.SoLuongConLai,
      required this.DonViTinh,
      required this.image
      });
  Materials copyWith({
    String? id,
    String? name,
    int? SoLuongNhap,
    int? SoLuongConLai,
    String? DonViTinh,
    String? image,
  }) {
    return Materials(
        id: id ?? this.id,
        name: name ?? this.name,
        SoLuongNhap: SoLuongNhap ?? this.SoLuongNhap,
        SoLuongConLai: SoLuongConLai ?? this.SoLuongConLai,
        DonViTinh: DonViTinh ?? this.DonViTinh,
        image: image ?? this.image);
        
  }
}
