<template>
  <div class="container mt-5">
    <div class="card shadow-lg p-5" style="max-width: 500px; margin: 0 auto;">
      <h2 class="text-center text-primary fw-bold mb-4">ĐĂNG KÝ</h2>

      <form @submit.prevent="handleRegister">
        <div class="mb-3">
          <label class="fw-bold">Họ và Tên</label>
          <input v-model="registerData.fullName" type="text" class="form-control" placeholder="Nhập họ tên...">
        </div>

        <div class="mb-3">
          <label class="fw-bold">Email</label>
          <input v-model="registerData.email" type="email" class="form-control" placeholder="Nhập email...">
        </div>

        <div class="mb-3">
          <label class="fw-bold">Mật khẩu</label>
          <input v-model="registerData.password" type="password" class="form-control" placeholder="Nhập mật khẩu...">
        </div>

        <div class="mb-3">
          <label class="fw-bold">Xác nhận mật khẩu</label>
          <input v-model="registerData.confirmPassword" type="password" class="form-control"
            placeholder="Nhập lại mật khẩu...">
        </div>

        <button class="btn btn-primary w-100 mt-3">Đăng Ký</button>
      </form>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue';

const emit = defineEmits(['register-success']);

const registerData = reactive({
  fullName: '', email: '', password: '', confirmPassword: ''
});

const handleRegister = () => {
  if (!registerData.fullName || !registerData.email || !registerData.password) {
    alert("Vui lòng điền đầy đủ thông tin!");
    return;
  }

  if (registerData.password !== registerData.confirmPassword) {
    alert("Mật khẩu xác nhận không khớp!");
    return;
  }

  emit('register-success', {
    fullName: registerData.fullName,
    email: registerData.email,
    password: registerData.password,
    avatar: null
  });
};
</script>