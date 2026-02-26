<template>
  <div class="container">
    <h2>Bài 1 - Nhập Điểm Của Bạn:</h2>

    <input type="number" v-model.number="diem" placeholder="Nhập điểm TB" />
    <br /><br />
    <span v-if="diem < 5">Xếp loại: Yếu</span>
    <span v-else-if="diem < 6.5">Xếp loại: Trung bình</span>
    <span v-else-if="diem < 8">Xếp loại: Khá</span>
    <span v-else-if="diem < 9">Xếp loại: Giỏi</span>
    <span v-else>Xếp loại: Xuất sắc</span>

    <span>
      - Kết quả:
      <span v-if="diem >= 5" style="color: green; font-weight: bold;">Đậu</span>
      <span v-else style="color: red; font-weight: bold;">Rớt</span>
    </span>
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