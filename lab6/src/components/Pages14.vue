<template>
    <div class="container mt-5 col-sm-5">
        <h2 class="mb-4">Top sách bán chạy</h2>
        <ul class="list-group">
            <li class="list-group-item" v-for="(product, index) in products">
                <h4>{{ product.name }} - {{ product.price }} VNĐ</h4>
                <button @click="toggleDetails(index)" class="btn btn-info">
                    {{ showDetails[index] ? "Ẩn chi tiết" : "Xem chi tiết" }}
                </button>
                <p v-show="showDetails[index]" class="mt-2">{{ product.description }}</p>
            </li>
        </ul>
    </div>
</template>
<script>
import { ref } from 'vue';
export default {
    setup() {
        const products = ref([
            {
                name: "Vợ Nhặt",
                description: "Tác phẩm 'Vợ Nhặt' của tác giả Kim Lân (1921-2007)...",
                price: 55000,
            },
            {
                name: "Chí Phèo",
                description: "Tác phẩm 'Chí Phèo' của tác giả Nam Cao (1915-1951)...",
                price: 60000,
            },
            {
                name: "Số Đỏ",
                description: "Tác phẩm 'Số Đỏ' của tác giả Vũ Trọng Phụng (1915-1945)...",
                price: 45000,
            },
            {
                name: "Tắt Đèn",
                description: "Tác phẩm 'Tắt Đèn' của tác giả Ngô Tất Tố (1893-1954)...",
                price: 50000,
            },
            {
                name: "Lão Hạc",
                description: "Tác phẩm 'Lão Hạc' của tác giả Nam Cao (1915-1951)...",
                price: 55000,
            },
            {
                name: "Dế Mèn Phiêu Lưu Ký",
                description: "Tác phẩm 'Dế Mèn Phiêu Lưu Ký' của tác giả Tô Hoài (1920-2014)...",
                price: 70000,
            },
            {
                name: "Cô Gái Đến Từ Hôm Qua",
                description: "Tác phẩm 'Cô Gái Đến Từ Hôm Qua' của tác giả Nguyễn Nhật Ánh (1955)...",
                price: 65000,
            },
            {
                name: "Mắt Biếc",
                description: "Tác phẩm 'Mắt Biếc' của tác giả Nguyễn Nhật Ánh (1955)...",
                price: 75000,
            },
            {
                name: "Người Lớn",
                description: "Tác phẩm 'Người Lớn' của tác giả Nguyễn Ngọc Tư (1976)...",
                price: 80000,
            },
            {
                name: "Bến Không Chồng",
                description: "Tác phẩm 'Bến Không Chồng' của tác giả Nguyễn Ngọc Tư (1976)...",
                price: 85000,
            }
        ]);
        // Trạng thái hiển thị chi tiết cho từng cuốn sách
        const showDetails = ref(products.value.map(() => false));
        // Phương thức để ẩn/hiển thị chi tiết sách
        const toggleDetails = (index) => {
            showDetails.value[index] = !showDetails.value[index];
        };
        return { products, showDetails, toggleDetails };
    },
};
</script>