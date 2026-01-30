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
<style lang="">

</style>