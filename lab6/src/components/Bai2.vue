<template>
  <div class="container">
    <h2>Bài 2 - Nhập Tháng Của Bạn:</h2>

    <input type="number" v-model.number="thang" placeholder="Nhập tháng" />

    <p v-if="thang < 1 || thang > 12" style="color:red">
      Vui lòng nhập tháng từ 1 đến 12!
    </p>
    <p v-else-if="thang <= 3">Mùa Xuân</p>
    <p v-else-if="thang <= 6">Mùa Hạ</p>
    <p v-else-if="thang <= 9">Mùa Thu</p>
    <p v-else>Mùa Đông</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      thang: null
    }
  }
}
</script>
