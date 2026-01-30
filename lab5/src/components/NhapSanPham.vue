<template>
    <div>
        <h2>Nhập sản phẩm</h2>
        <form @submit.prevent="addProduct">
            <div>
                <input v-model="form.name" type="text" placeholder="Tên sản phẩm" />
            </div>
            <div>
                <input v-model.number="form.price" type="number" placeholder="Giá" />
            </div>
            <div>
                <textarea v-model="form.description" rows="3" placeholder="Mô tả"></textarea>
            </div>
            <button type="submit">Thêm sản phẩm</button>
        </form>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const emit = defineEmits(['add-product']);

const form = ref({
    name: '',
    price: '',
    description: '',
});

const addProduct = () => {
    if (form.value.name && form.value.price) {
        emit('add-product', { ...form.value });

        form.value = { name: '', price: '', description: '' };
    }
};
</script>