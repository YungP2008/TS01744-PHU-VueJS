<template>
  <div>
    <h2>Login</h2>
    <button @click="login">Login (Mock)</button>
  </div>
</template>

<script>
export default {
  name: 'LoginView',
  methods: {
    login() {
      localStorage.setItem('isAuthenticated', 'true')
      this.$router.push({ name: 'Dashboard' })
    }
  }
}
</script>