<template>
    <div class="container mt-5">
        <h1 class="text-center mb-5">Kiến thức sức khỏe cộng đồng</h1>
        <div class="row g-4">
            <div class="col-md-4 d-flex align-items-stretch" v-for="(item, index) in items" :key="index">
                <div class="card h-100 shadow-sm p-0">
                    <img :src="item.image" :alt="item.title" class="card-img-top img-fluid"
                        style="height: 200px; object-fit: cover;" />
                    <div class="card-body d-flex flex-column">
                        <h3 class="card-title fs-5">{{ item.title }}</h3>
                        <p class="card-text text-start flex-grow-1">{{ item.content }}</p>
                        <div class="mt-auto text-start">
                            <button class="btn btn-primary">Xem chi tiết</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import img1 from '../assets/images/img1.jpg';
import img2 from '../assets/images/img2.jpg';
import img3 from '../assets/images/img3.jpg';

const items = [
    {
        title: '8 loại rau củ quả giàu canxi',
        content: 'Canxi là khoáng chất cần thiết đối với cơ thể người. Có nhiều cách để bổ sung canxi, trong đó bổ sung qua đường ăn uống là cách tốt nhất. Có 8 loại rau củ giàu canxi...',
        image: img1
    },
    {
        title: 'Các loại gia vị tốt cho sức khỏe',
        content: 'Một số loại gia vị không chỉ giúp món ăn thêm hấp dẫn mà còn mang lại nhiều lợi ích cho sức khỏe như giảm viêm, cải thiện tiêu hóa...',
        image: img2
    },
    {
        title: '9 loại đậu bổ dưỡng nên dùng nhiều',
        content: 'Đậu lăng, đậu đen, đậu xanh... là những loại đậu giàu protein, chất xơ và các vitamin thiết yếu cho cơ thể...',
        image: img3
    }
];
</script>
