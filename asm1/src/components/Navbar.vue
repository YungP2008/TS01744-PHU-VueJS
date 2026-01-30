<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container">
      <!-- Thêm fs-4 để tên ASM 1 to rõ hơn -->
      <a class="navbar-brand fw-bold fs-4" href="#" @click.prevent="$emit('nav-to', 'home')">ASM 1</a>
      
      <div class="navbar-nav ms-auto">
        <!-- Thêm text-white (trắng nét) và fw-semibold (chữ đậm vừa) -->
        <a class="nav-link text-white fw-semibold px-3" href="#" @click.prevent="$emit('nav-to', 'home')">Trang chủ</a>
        <a class="nav-link text-white fw-semibold px-3" href="#" @click.prevent="$emit('nav-to', 'login')">Đăng nhập</a>
        <a class="nav-link text-white fw-semibold px-3" href="#" @click.prevent="$emit('nav-to', 'register')">Đăng ký</a>
        <a class="nav-link text-white fw-semibold px-3" href="#" @click.prevent="$emit('nav-to', 'profile')">Trang cá nhân</a>
      </div>
    </div>
  </nav>
</template>

<script setup>
defineEmits(['nav-to'])
</script>

<style scoped>
.nav-link:hover {
  text-decoration: underline;
  opacity: 0.8;
}
</style>