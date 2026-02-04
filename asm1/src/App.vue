<template>
  <div id="app">
    <Navbar :currentUser="currentUser" @logout="handleLogout" />

    <div class="container mt-3">
      <router-view :users="users" :currentUser="currentUser" :posts="posts" @login-success="handleLogin"
        @register-success="handleRegister" @add-post="handleAddPost" @delete-post="handleDeletePost"
        @add-comment="handleAddComment" @update-profile="handleUpdateProfile"></router-view>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue';
import { useRouter } from 'vue-router';
import Navbar from './components/Navbar.vue';

const router = useRouter();


const users = ref([
  {
    fullName: 'Phạm Phú',
    email: 'phamphu11102008@gmail.com',
    password: '123',
    avatar: '/miwa.jpg'
  }
]);

const currentUser = ref(null);

const posts = ref([
  {
    id: 1,
    title: 'Khoảnh khắc bất tử: Materazzi và Rui Costa (2005)',
    content: 'Ngày 12 tháng 4 năm 2005, trận tứ kết Champions League giữa Inter Milan và AC Milan đã trở thành một trong những đêm đáng nhớ nhất lịch sử bóng đá. Khi trận đấu bị gián đoạn bởi cơn mưa pháo sáng từ khán đài, Marco Materazzi (Inter) đã thản nhiên tựa tay lên vai Rui Costa (Milan). Giữa khung cảnh hỗn loạn và rực lửa của sân San Siro, hai đối thủ truyền kiếp đứng cạnh nhau, tạo nên một bức ảnh mang tính biểu tượng về tinh thần thể thao và sự tôn trọng.',
    image: '/materazi.jpg',
    comments: [],
    newCommentDraft: ''
  }
]);


const handleLogin = (credentials) => {
  const foundUser = users.value.find(u => u.email === credentials.email && u.password === credentials.password);
  if (foundUser) {
    currentUser.value = foundUser;
    alert("Đăng nhập thành công!");
    router.push({ name: 'home' });
  } else {
    alert("Sai email hoặc mật khẩu!");
  }
};

const handleRegister = (newUser) => {
  const exists = users.value.some(u => u.email === newUser.email);
  if (exists) {
    alert("Email này đã được sử dụng!");
    return;
  }
  users.value.push(newUser);
  alert("Đăng ký thành công! Vui lòng đăng nhập.");
  router.push({ name: 'login' });
};

const handleLogout = () => {
  currentUser.value = null;
  alert("Đăng xuất thành công!");
  router.push({ name: 'login' });
};

const handleAddPost = (newPostData) => {
  posts.value.unshift(newPostData);
};

const handleDeletePost = (postId) => {
  if (confirm("Xóa bài viết này?")) {
    posts.value = posts.value.filter(post => post.id !== postId);
  }
};

const handleAddComment = ({ postId, content }) => {
  const post = posts.value.find(p => p.id === postId);
  if (post && currentUser.value) {
    post.comments.push({
      id: Date.now(),
      user: currentUser.value.fullName,
      avatar: currentUser.value.avatar,
      text: content
    });
  }
};

const handleUpdateProfile = (updatedData) => {
  Object.assign(currentUser.value, updatedData);
  const index = users.value.findIndex(u => u.email === currentUser.value.email);
  if (index !== -1) {
    users.value[index] = { ...currentUser.value };
  }
  alert("Cập nhật thông tin thành công!");
};
</script>