<template>
  <div class="m-5 col-sm-3">
    <h2>Đăng Nhập</h2>
    <form @submit.prevent="handleLogin">
      <div class="mb-3">
        <label>Tên đăng nhập:</label>
        <input type="text" class="form-control" v-model="username" placeholder="Nhập tên đăng nhập" />
      </div>
      <div class="mb-3">
        <label>Mật khẩu:</label>
        <input type="password" class="form-control" v-model="password" placeholder="Nhập mật khẩu" />
      </div>
      <button type="submit" class="btn btn-primary">Đăng nhập</button>
    </form>
  </div>
</template>

<script setup>
import { ref, defineEmits } from 'vue';
const username = ref('');
const password = ref('');
const emit = defineEmits(['loggedIn']);

function handleLogin() {
  if (username.value && password.value) {
    emit('loggedIn', username.value); // Phát sự kiện gửi kèm tên user [cite: 236]
  }
}
</script>