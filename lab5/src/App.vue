<script setup>
//import HelloWorld from './components/HelloWorld.vue'
import bai1Lab5 from './components/bai1-lab5.vue';
import bai2Lab5 from './components/Bai2-lab5.vue';
import bai3Lab5 from './components/Bai3-lab5.vue';
// import Slide5 from './components/Slide5.vue';


// import { ref } from 'vue';
// import CreatePost from './components/CreatePost.vue';
// import PostList from './components/PostList.vue';

// const posts = ref([
//   {
//     title: "Bật Mí 8 Nguyên Tắc Phối Màu Quần Áo Sành Điệu",
//     author: "Nguyễn Văn Tèo",
//     content: "Bạn có thể phối áo màu xanh lá, quần màu kem và giày màu tím theo cách phối màu kiểu tam giác. Hoặc có thể phối các set đồ cùng ton lạnh hoặc nóng..."
//   }
// ]);

// function addPost(post) {
//   posts.value.push(post);
// }
</script>

<template>
  <!-- <HelloWorld />
  <Slide5 /> -->
  <bai1Lab5 />
  <bai2Lab5 />
  <bai3Lab5 />

  <div id="app">
    <h1>Ứng dụng Blog nhỏ với Vue.js</h1>
    <CreatePost @add-post="addPost" />
    <PostList :posts="posts" />
  </div>
</template>

<style setup>
#app {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}
</style>