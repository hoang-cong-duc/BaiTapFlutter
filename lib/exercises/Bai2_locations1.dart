import 'package:flutter/material.dart';

// --- KHỞI TẠO ỨNG DỤNG ---


class Locations1 extends StatelessWidget {
  const Locations1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchResultsScreen(),
    );
  }
}

// --- 1. MODEL DỮ LIỆU ---
class Hotel {
  final String name;
  final String ratingText;
  final double ratingValue;
  final int reviews;
  final String location;
  final double distance;
  final String details;
  final double price;
  final bool includesBreakfast;
  final bool needsPrepayment;
  final String imageAsset;

  const Hotel({
    required this.name,
    required this.ratingText,
    required this.ratingValue,
    required this.reviews,
    required this.location,
    required this.distance,
    required this.details,
    required this.price,
    this.includesBreakfast = false,
    this.needsPrepayment = false,
    required this.imageAsset,
  });
}

// --- 2. WIDGET MÀN HÌNH CHÍNH ---
class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key}); 

  // Dữ liệu khách sạn mẫu (SỬ DỤNG LẠI 'images/anh1.jpg' VÀ TẠO NHIỀU CHỖ NGHỈ)
  final List<Hotel> hotels = const [
    Hotel(
      name: 'aNhill Boutique',
      ratingValue: 9.5,
      ratingText: 'Xuất sắc',
      reviews: 95,
      location: 'Huế',
      distance: 0.6,
      details: '1 suite riêng tư: 1 giường',
      price: 109,
      includesBreakfast: true,
      imageAsset: 'assets/images/1.jpg',
    ),
    Hotel(
      name: 'An Nam Hue Boutique',
      ratingValue: 9.2,
      ratingText: 'Tuyệt hảo',
      reviews: 34,
      location: 'Cư Chinh',
      distance: 0.9,
      details: '1 phòng khách sạn: 1 giường',
      price: 20,
      includesBreakfast: true,
      imageAsset: 'assets/images/2.jpg',
    ),
    Hotel(
      name: 'Huế Jade Hill Villa',
      ratingValue: 8.0,
      ratingText: 'Rất tốt',
      reviews: 1,
      location: 'Cư Chinh',
      distance: 1.3,
      details: '1 biệt thự nguyên căn – 1.000 m²: 4 giường • 3 phòng ngủ • 1 phòng tắm',
      price: 285,
      includesBreakfast: false,
      needsPrepayment: true,
      imageAsset: 'assets/images/3.jpg',
    ),
    Hotel(
      name: 'Êm Villa',
      ratingValue: 9.0,
      ratingText: 'Tuyệt hảo',
      reviews: 15,
      location: 'Cư Chinh',
      distance: 1.5,
      details: 'Được quản lý bởi một host cá nhân',
      price: 65,
      includesBreakfast: true,
      imageAsset: 'assets/images/4.jpg',
    ),
    // THÊM CHỖ NGHỈ ĐỂ KIỂM TRA CHỨC NĂNG CUỘN
    Hotel(
      name: 'Luxury Garden House',
      ratingValue: 9.8,
      ratingText: 'Xuất sắc',
      reviews: 50,
      location: 'Huế',
      distance: 2.1,
      details: 'Phòng deluxe view hồ bơi',
      price: 150,
      includesBreakfast: true,
      imageAsset: 'assets/images/3.jpg',
    ),
    Hotel(
      name: 'Riverside Retreat',
      ratingValue: 8.5,
      ratingText: 'Rất tốt',
      reviews: 12,
      location: 'Thành phố',
      distance: 0.5,
      details: 'Căn hộ Studio có ban công',
      price: 90,
      includesBreakfast: false,
      imageAsset: 'assets/images/2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar không cuộn
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130.0), 
        child: Column(
          children: [
            // --- Top Bar/Search Bar ---
            AppBar(
              automaticallyImplyLeading: false, 
              backgroundColor: const Color(0xFF1E88E5), 
              foregroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_back, color: Colors.black),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Xung quanh vị trí hiện tại',
                            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Text(
                          '23 thg 10 – 24 thg 10',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // --- Filter/Sort ---
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  FilterButton(icon: Icons.south, label: 'Sắp xếp'),
                  FilterButton(icon: Icons.filter_list, label: 'Lọc'),
                  FilterButton(icon: Icons.map, label: 'Bản đồ'),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // BODY CÓ THỂ CUỘN
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Kết quả tìm kiếm Count ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(
                '${hotels.length} chỗ nghỉ', 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            
            // --- Danh sách Khách sạn (Tạo danh sách thẻ từ dữ liệu) ---
            Column(
              children: hotels.map((hotel) {
                return HotelCard(hotel: hotel);
              }).toList(),
            ),

            const SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }
}

// --- 3. WIDGET CON: FilterButton ---
class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const FilterButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue.shade700),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.blue.shade700,
          ),
        ),
      ],
    );
  }
}

// --- 4. WIDGET CON: HotelCard ---
class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Phần Ảnh và Tag ---
          Container(
            width: 120,
            height: 180,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack( 
              children: [
                // Ảnh từ assets
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    hotel.imageAsset, 
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.broken_image, color: Colors.grey));
                    },
                  ),
                ),
                // Tag "Bao bữa sáng"
                if (hotel.includesBreakfast)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Bao bữa sáng',
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // --- Phần Thông tin Chi tiết ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên Khách sạn và Icon Yêu thích
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          hotel.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.favorite_border, size: 20, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Rating
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: hotel.ratingValue >= 9.0 ? Colors.blue.shade700 : Colors.green.shade700,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          hotel.ratingValue.toString(),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${hotel.ratingText} - ${hotel.reviews} đánh giá',
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        '${hotel.location} • Cách bạn ${hotel.distance}km',
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Details
                  Text(
                    hotel.details,
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 8),

                  // Prepayment info (Chỉ hiển thị nếu cần)
                  if (hotel.needsPrepayment)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.location_on_rounded, size: 14, color: Colors.red),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  'Chỉ còn 1 căn với giá này trên Booking.com',
                                  style: TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.check_circle_outline, size: 14, color: Colors.green), 
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  'Không cần thanh toán trước',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  
                  // Giá và Thuế
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'US\$${hotel.price.toInt()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Đã bao gồm thuế và phí',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}