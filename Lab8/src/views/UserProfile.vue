<template>
  <div>
    <h2>User Profile</h2>
    <nav>
      <router-link :to="{ name: 'ProfileInfo' }">Info</router-link> |
      <router-link :to="{ name: 'ProfileSettings' }">Settings</router-link>
    </nav>
    <router-view></router-view>
    <router-link to="/">Back to Home</router-link>
  </div>
</template>

<script>
export default {
  name: 'UserProfileView'
}
</script>