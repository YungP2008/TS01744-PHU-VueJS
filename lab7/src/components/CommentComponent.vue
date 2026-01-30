<template>
  <div class="col-sm-4 m-5">
    <h2>Bình luận bài viết</h2>
    <div class="card mb-3">
      <img src="../assets/images/img1.jpg" class="card-img-top" alt="Bài viết">
      <div class="card-body">
        <h3 class="card-title">8 loại rau củ quả giàu canxi</h3>
        <p class="card-text">Canxi là khoáng chất cần thiết đối với cơ thể người...</p>
      </div>
    </div>
    
    <form @submit.prevent="submitComment">
      <div class="mt-3">
        <textarea class="form-control" v-model="commentText" placeholder="Nhập bình luận của bạn"></textarea>
      </div>
      <button type="submit" class="btn btn-success mt-2">Gửi bình luận</button>
    </form>

    <div v-if="comments.length" class="mt-3">
      <h5>Danh sách các bình luận:</h5>
      <ul>
        <li v-for="(comment, index) in comments" :key="index">
          <p><strong>{{ comment.name }}</strong>: {{ comment.text }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup>
import { ref, defineProps } from 'vue';
const props = defineProps(['username']); // Nhận username từ component cha [cite: 277]
const commentText = ref('');
const comments = ref([]);

function submitComment() {
  if (commentText.value) {
    comments.value.push({
      name: props.username,
      text: commentText.value
    });
    commentText.value = '';
  }
}
</script>