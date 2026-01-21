<!-- <script setup>
import { ref } from 'vue' // Import ref để dùng cho logic title
import HelloWorld from './components/HelloWorld.vue'
import Page21 from './components/Page21.vue';
import Page27 from './components/Page27.vue';
import Page34 from './components/Page34.vue';

// Chuyển logic title sang Script Setup (Vue 3) cho đồng nhất
const title = ref("hide")

const Test = () => {
  console.log(title.value)
  if (title.value === "hide") {
    title.value = "show"
  } else {
    title.value = "hide"
  }
}
</script>

<template>
  <div id="app">
    <div class="toggle-section">
      <button @click="Test" v-html="title"></button>
    </div>

    <hr>

    <Page34 msg="Test"/>
    
    <div>
      <a href="https://vite.dev" target="_blank">
        <img src="/vite.svg" class="logo" alt="Vite logo" />
      </a>
      <a href="https://vuejs.org/" target="_blank">
        <img src="./assets/vue.svg" class="logo vue" alt="Vue logo" />
      </a>
    </div>

    <Page21/>
    <hr>
    <Page27/>
    <hr>
    <HelloWorld msg="1 - HaiAnh"/>
  </div>
</template>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  margin-top: 60px;
}

.toggle-section {
  margin-bottom: 20px;
}

button {
  padding: 10px 20px;
  cursor: pointer;
  text-transform: uppercase;
}

.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style> -->

<!-- Bài 3 -->
<!-- <script setup>
import Bai3 from './components/Bai3.vue';
</script>
<template>
<Bai3/>
</template> -->

<!-- Bài 4 -->
<!--<script setup>
import Bai4 from './components/Bai4.vue';
</script>
<template>  
<Bai4/>
</template>-->

<script setup>
import test from './components/test.vue';
</script>
<template>
<test/>
</template>
