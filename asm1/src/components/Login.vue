<template>
  <div class="container mt-5">
    <div class="card shadow-lg p-5" style="max-width: 500px; margin: 0 auto;">
      <h2 class="text-center text-success fw-bold mb-4">ĐĂNG NHẬP</h2>

      <form @submit.prevent="handleLogin">
        <div class="mb-3">
          <label class="fw-bold">Email</label>
          <input v-model="email" type="email" class="form-control" placeholder="Nhập email...">
        </div>

        <div class="mb-3">
          <label class="fw-bold">Mật khẩu</label>
          <input v-model="password" type="password" class="form-control" placeholder="Nhập mật khẩu...">
        </div>

        <button class="btn btn-success w-100 mt-3">Đăng nhập</button>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const emit = defineEmits(['login-success']);

const email = ref('');
const password = ref('');

const handleLogin = () => {
  if (!email.value || !password.value) {
    alert("Vui lòng nhập đầy đủ thông tin!");
    return;
  }

  emit('login-success', {
    email: email.value,
    password: password.value
  });
};
</script>