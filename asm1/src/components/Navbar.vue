<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container">
      <a class="navbar-brand fw-bold" href="#" @click.prevent="$emit('nav-to', 'home')">ASM 1</a>
      <div class="navbar-nav ms-auto">
        <a class="nav-link" href="#" @click.prevent="$emit('nav-to', 'home')">Trang chủ</a>
        <a class="nav-link" href="#" @click.prevent="$emit('nav-to', 'login')">Đăng nhập</a>
        <a class="nav-link" href="#" @click.prevent="$emit('nav-to', 'register')">Đăng ký</a>
        <a class="nav-link" href="#" @click.prevent="$emit('nav-to', 'profile')">Trang cá nhân</a>
      </div>
    </div>
  </nav>
</template>

<script setup>
defineEmits(['nav-to'])
</script>