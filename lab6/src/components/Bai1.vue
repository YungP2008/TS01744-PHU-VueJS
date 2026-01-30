<template>
  <div class="container">
    <h2>Bài 1 - Nhập Điểm Của Bạn:</h2>

    <input type="number" v-model.number="diem" placeholder="Nhập điểm TB" />

    <p v-if="diem < 5">Xếp loại: Yếu</p>
    <p v-else-if="diem < 6.5">Xếp loại: Trung bình</p>
    <p v-else-if="diem < 8">Xếp loại: Khá</p>
    <p v-else-if="diem < 9">Xếp loại: Giỏi</p>
    <p v-else>Xếp loại: Xuất sắc</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      diem: null
    }
  }
}
</script>
