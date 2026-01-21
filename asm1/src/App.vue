<script setup>
import { ref } from 'vue'
import Navbar from './components/Navbar.vue'
import Home from './components/Home.vue'
import Login from './components/Login.vue'
import Register from './components/Register.vue' // Import mới
import Profile from './components/Profile.vue'

const currentView = ref('home')

const changePage = (pageName) => {
  currentView.value = pageName
}
</script>

<template>
  <div>
    <Navbar @nav-to="changePage" />
    
    <main class="container-fluid py-4">
      <Home v-if="currentView === 'home'" />
      <Login v-if="currentView === 'login'" @nav-to="changePage" />
      <Register v-if="currentView === 'register'" @nav-to="changePage" />
      <Profile v-if="currentView === 'profile'" />
    </main>
  </div>
</template>