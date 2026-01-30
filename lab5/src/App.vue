<script setup>
import { ref } from 'vue';
import NhapSanPham from './components/NhapSanPham.vue';
import DanhSachSanPham from './components/DanhSachSanPham.vue';

const hardwareList = [
  {
    name: "CPU AMD Ryzen 9 7950X",
    description: "Vi xử lý 16 nhân 32 luồng, xung nhịp lên tới 5.7GHz, tối ưu cho xử lý đa nhiệm và đồ họa nặng.",
    price: 14500000,
  },
  {
    name: "Card đồ họa NVIDIA RTX 4090",
    description: "GPU mạnh mẽ nhất hiện nay với 24GB VRAM GDDR6X, hỗ trợ Ray Tracing và DLSS 3 cực đỉnh cho gaming 4K.",
    price: 52000000,
  },
  {
    name: "RAM Corsair Dominator Platinum 64GB DDR5",
    description: "Bộ nhớ RAM hiệu năng cao, bus 6000MHz với thiết kế tản nhiệt nhôm sang trọng và đèn LED RGB độc quyền.",
    price: 7800000,
  },
  {
    name: "SSD Samsung 990 Pro 2TB NVMe Gen4",
    description: "Ổ cứng SSD tốc độ đọc/ghi lên tới 7450/6900 MB/s, độ bền cao, phù hợp cho Render video và làm AI.",
    price: 4500000,
  },
  {
    name: "Mainboard ASUS ROG Maximus Z790 Hero",
    description: "Bo mạch chủ cao cấp dành cho CPU Intel thế hệ 13/14, hỗ trợ PCIe 5.0 và hệ thống cấp điện 20+1 phase.",
    price: 18500000,
  },
  {
    name: "Nguồn Corsair AX1600i 1600W 80 Plus Titanium",
    description: "Bộ nguồn kỹ thuật số mạnh mẽ nhất thế giới với hiệu suất đạt chuẩn Titanium, linh kiện 100% Nhật Bản.",
    price: 12900000,
  },
  {
    name: "Tản nhiệt nước NZXT Kraken Elite 360 RGB",
    description: "Hệ thống tản nhiệt AIO có màn hình LCD tùy biến, hiệu suất làm mát vượt trội cho các dòng CPU tỏa nhiệt lớn.",
    price: 6900000,
  },
  {
    name: "Case Lian Li O11 Dynamic EVO",
    description: "Vỏ máy tính thiết kế kính cường lực hai mặt, khả năng tùy biến luồng gió cực tốt và hỗ trợ nhiều vị trí lắp quạt.",
    price: 4200000,
  },
  {
    name: "Màn hình LG UltraGear 27GR95QE-B OLED",
    description: "Màn hình chơi game 27 inch OLED, tần số quét 240Hz, thời gian phản hồi 0.03ms cho trải nghiệm mượt mà tuyệt đối.",
    price: 21000000,
  },
  {
    name: "Bàn phím cơ Custom Keychron Q1 Pro",
    description: "Bàn phím cơ không dây layout 75%, vỏ nhôm nguyên khối, hỗ trợ thay switch nóng (Hot-swappable).",
    price: 4800000,
  }
];

const products = ref(hardwareList);

const handleAddProduct = (newProduct) => {
  products.value.push(newProduct);
};

const handleDeleteProduct = (index) => {
  products.value.splice(index, 1);
};
</script>

<template>
  <div>
    <NhapSanPham @addProduct="handleAddProduct" />
    <DanhSachSanPham :products="products" @deleteProduct="handleDeleteProduct" />
  </div>
</template>
