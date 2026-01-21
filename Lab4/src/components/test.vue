<template>
  <div class="container text-center mt-5">
    <h2 class="mb-4">Kiểm tra độ tuổi</h2>

    <div class="d-flex align-items-center justify-content-center mb-2">
      <label class="me-2">Nhập năm sinh:</label>
      <input 
        type="number" 
        v-model.number="birthYear" 
        class="form-control w-25" 
        placeholder="Ví dụ: 2008"
      >
    </div>

    <div v-if="birthYear" class="result-section">
      <p>Năm sinh của bạn: <span class="highlight">{{ birthYear }}</span></p>
      <p>Tuổi của bạn: <span class="highlight">{{ age }}</span></p>
      <p>Phân loại: <span class="highlight">{{ classification }}</span></p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AgeChecker',
  data() {
    return {
      birthYear: 2008
    };
  },
  computed: {
    age() {
      const currentYear = new Date().getFullYear();
      return currentYear - this.birthYear;
    },
    classification() {
      const a = this.age;
      let result = "";

      if (a < 0) {
        result = "Năm sinh không hợp lệ";
      } else if (a <= 12) {
        result = "Trẻ em";
      } else if (a <= 18) {
        result = "Thiếu niên";
      } else if (a <= 35) {
        result = "Thanh niên";
      } else if (a <= 60) {
        result = "Trung niên";
      } else {
        result = "Lớn tuổi";
      }

      return result;
    }
  }
}
</script>

<style scoped>
.highlight {
  color: #dc3545;
  font-weight: bold;
}
.result-section p {
  margin-bottom: 10px;
  font-size: 1.1rem;
}
@media (max-width: 576px) {
  .form-control.w-25 {
    width: 50% !important;
  }
}
</style>