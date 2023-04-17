class Bill {
  final String? id;
  final String name;
  final int SoLuong;
  final double DonGia;
  final double ThanhTien;

  Bill({
    this.id,
    required this.name,
    required this.SoLuong,
    required this.DonGia,
    required this.ThanhTien,
  });
  Bill copyWith({
    String? id,
    String? name,
    int? SoLuong,
    double? DonGia,
    double? ThanhTien,
  }) {
    return Bill(
      id: id ?? this.id,
      name: name ?? this.name,
      SoLuong: SoLuong ?? this.SoLuong,
      DonGia: DonGia ?? this.DonGia,
      ThanhTien: ThanhTien ?? this.ThanhTien,
    );
  }
}
