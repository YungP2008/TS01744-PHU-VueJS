<template>
  <div>
    <h2>Blog Posts</h2>
    <ul>
      <li v-for="post in posts" :key="post.id">
        <router-link :to="{ name: 'BlogPost', params: { id: post.id } }">
          {{ post.title }}
        </router-link>
      </li>
    </ul>
    <router-link to="/">Back to Home</router-link>
  </div>
</template>

<script>
export default {
  name: 'BlogListView',
  data() {
    return {
      posts: [
        { id: 1, title: 'hello' },
        { id: 2, title: 'hi' },
        { id: 3, title: 'xin chào' }
      ]
    }
  }
}
</script>