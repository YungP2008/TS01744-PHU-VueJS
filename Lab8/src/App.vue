<!-- <template>
  <h1>30 - Phạm Châu Lương Phú</h1>
  <p>
    <strong>Current route path:</strong> {{ $route.fullPath }}
  </p>
  <nav>
    <RouterLink to="/">Go to Home</RouterLink>
    <RouterLink to="/about">Go to About</RouterLink>
  </nav>
  <main>
    <RouterView />
  </main>
</template> -->

<template>
  <div id="app">
    <h1>MyBlog Application</h1>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>