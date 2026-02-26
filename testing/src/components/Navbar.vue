<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container">
      <router-link class="navbar-brand fw-bold fs-4" :to="{ name: 'home' }">ASM 2 của Phú</router-link>
      <div class="collapse navbar-collapse" id="navbarNav">
        <div class="navbar-nav ms-auto align-items-center">
          <router-link class="nav-link text-white fw-semibold px-3" :to="{ name: 'home' }">Trang chủ</router-link>

          <template v-if="!currentUser">
            <router-link class="nav-link text-white fw-semibold px-3" :to="{ name: 'login' }">Đăng nhập</router-link>
            <router-link class="nav-link text-white fw-semibold px-3" :to="{ name: 'register' }">Đăng ký</router-link>
          </template>

          <template v-else>
            <router-link class="nav-link text-white fw-semibold px-3" :to="{ name: 'profile' }">
              Chào, {{ currentUser.fullName || 'Bạn' }}
            </router-link>
            <button class="btn btn-danger btn-sm ms-2" @click="$emit('logout')">Đăng xuất</button>
          </template>
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
defineProps(['currentUser']);
defineEmits(['logout']);
</script>