<template>
    <div>
        <h2>Danh sách thiết bị</h2>
        <ul>
            <li v-for="(product, index) in products" :key="index">
                <h4>{{ product.name }} - {{ product.price }} VNĐ</h4>

                <button @click="toggleDetails(index)">
                    {{ showDetails[index] ? "Ẩn chi tiết" : "Xem chi tiết" }}
                </button>

                <p v-if="showDetails[index]">
                    {{ product.description }}
                </p>
            </li>
        </ul>
    </div>
</template>

<script setup>
import { ref, watch } from 'vue';

const props = defineProps({
    products: {
        type: Array,
        required: true
    }
});

const emit = defineEmits(['delete-product']);

const showDetails = ref([]);
watch(
    () => props.products,
    (newProducts) => {
        showDetails.value = newProducts.map(() => false);
    },
    { immediate: true }
);
</script>c