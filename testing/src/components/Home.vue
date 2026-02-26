<template>
  <div class="container mt-4">
    <div class="card mb-5 shadow-sm border-0 bg-white">
      <div class="card-body">
        <h5 class="fw-bold text-success mb-3">Tạo bài viết mới</h5>
        <input v-model="newPost.title" type="text" class="form-control mb-2" placeholder="Tiêu đề bài viết">
        <textarea v-model="newPost.content" class="form-control mb-2" rows="3"
          placeholder="Bạn đang nghĩ gì?"></textarea>

        <div class="mb-3">
          <input type="file" class="form-control form-control-sm mb-1" @change="handleFileChange" ref="fileInput">
          <small class="text-muted">Chọn ảnh</small>
        </div>

        <button @click="triggerAddPost" class="btn btn-success px-4">Đăng bài</button>
      </div>
    </div>

    <div v-for="(post, index) in posts" :key="post.id" class="card mb-5 shadow border-0 overflow-hidden">

      <div class="card-header bg-white border-0 p-3">
        <div>
          <h6 class="fw-bold mb-0 text-dark">{{ post.author }}</h6>
          <small class="text-muted" style="font-size: 12px;">Vừa xong</small>
        </div>
      </div>

      <div class="position-relative">
        <img :src="post.image || '/materazi.jpg'" class="w-100 article-image" alt="Post Cover Image">
        <button v-if="currentUser" @click="$emit('delete-post', post.id)"
          class="btn btn-danger btn-sm position-absolute top-0 end-0 m-2 shadow">
          <i class="bi bi-trash"></i> Xóa
        </button>
      </div>

      <div class="card-body">
        <h3 class="fw-bold text-dark mb-3">{{ post.title }}</h3>
        <p class="card-text text-dark lh-lg text-justify">{{ post.content }}</p>

        <hr class="my-4">

        <h5 class="fw-bold mb-3">Bình luận ({{ post.comments.length }})</h5>

        <div v-if="post.comments.length === 0" class="text-muted fst-italic mb-3">Chưa có bình luận nào.</div>

        <div v-for="comment in post.comments" :key="comment.id" class="d-flex mb-3">
          <div class="flex-grow-1">
            <div class="bg-light p-3 rounded-3 position-relative">
              <strong class="d-block text-primary mb-1">{{ comment.user }}</strong>
              <span>{{ comment.text }}</span>

              <button v-if="currentUser && currentUser.email === 'phamphu11102008@gmail.com'"
                @click="$emit('delete-comment', { postId: post.id, commentId: comment.id })"
                class="btn btn-sm text-danger position-absolute top-0 end-0 m-1" title="Xóa bình luận này">
                <i class="bi bi-trash"></i>
              </button>

            </div>
          </div>
        </div>

        <div class="mt-4 d-flex gap-2 align-items-start">
          <div class="flex-grow-1">
            <textarea v-model="post.newCommentDraft" @keyup.enter.exact="triggerAddComment(post)"
              class="form-control bg-light border-0 rounded-3" rows="2"
              placeholder="Viết bình luận... (Nhấn Enter để gửi)"></textarea>
            <div class="text-end mt-2">
              <button @click="triggerAddComment(post)" class="btn btn-primary btn-sm px-4 rounded-pill">Gửi</button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue';

const props = defineProps(['posts', 'currentUser']);
const emit = defineEmits(['add-post', 'delete-post', 'add-comment', 'delete-comment']);

const fileInput = ref(null);
const newPost = reactive({
  title: '',
  content: '',
  image: null
});

const handleFileChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    if (!file.type.startsWith('image/')) {
      alert("Vui lòng chỉ chọn file ảnh!");
      event.target.value = '';
      return;
    }
    const reader = new FileReader();
    reader.onload = (e) => {
      newPost.image = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const triggerAddPost = () => {
  if (!newPost.title || !newPost.content) return alert("Vui lòng nhập tiêu đề và nội dung!");

  emit('add-post', {
    id: Date.now(),
    title: newPost.title,
    content: newPost.content,
    image: newPost.image,
    comments: [],
    newCommentDraft: ''
  });

  newPost.title = '';
  newPost.content = '';
  newPost.image = null;
  if (fileInput.value) fileInput.value.value = '';
  alert("Đăng bài thành công!");
};

const triggerAddComment = (post) => {
  if (!post.newCommentDraft || post.newCommentDraft.trim() === '') return;

  emit('add-comment', {
    postId: post.id,
    content: post.newCommentDraft
  });

  post.newCommentDraft = '';
};
</script>

<style scoped>
.article-image {
  width: 100%;
  height: auto;
  object-fit: contain;
  max-height: 600px;
}

.text-justify {
  text-align: justify;
}
</style>