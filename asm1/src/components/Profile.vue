<template>
  <div class="container mt-5">
    <div class="row" v-if="currentUser">
      <div class="col-md-4 text-center mb-4">
        <div class="card shadow-sm border-0 p-3">
          <img :src="editingData.avatar || currentUser.avatar || '../assets/images/miwa.jpg'"
            class="rounded-circle img-thumbnail mx-auto mb-3" alt="Avatar"
            style="width: 150px; height: 150px; object-fit: cover;">

          <div v-if="isEditing" class="mb-3">
            <input type="file" class="form-control form-control-sm" @change="handleFileChange">
          </div>

          <h4 class="fw-bold">{{ isEditing ? editingData.fullName : currentUser.fullName }}</h4>
          <p class="text-muted">Mã Số: TS01744</p>
          <div class="mt-3">
            <button v-if="!isEditing" @click="startEdit" class="btn btn-primary w-100">
              <i class="bi bi-pencil-square"></i> Chỉnh sửa thông tin
            </button>
            <div v-else class="d-flex gap-2">
              <button @click="saveProfile" class="btn btn-success flex-grow-1">Lưu</button>
              <button @click="cancelEdit" class="btn btn-secondary flex-grow-1">Hủy</button>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-8">
        <div class="card shadow-sm border-0 mb-4">
          <div class="card-header bg-primary text-white fw-bold d-flex justify-content-between align-items-center">
            <span>Thông tin cá nhân</span>
            <span v-if="isEditing" class="badge bg-warning text-dark">Đang chỉnh sửa...</span>
          </div>

          <div class="card-body">
            <div class="row mb-3 align-items-center">
              <div class="col-sm-4 fw-bold text-secondary">Họ và tên:</div>
              <div class="col-sm-8">
                <span v-if="!isEditing" class="text-dark fw-semibold">{{ currentUser.fullName }}</span>
                <input v-else v-model="editingData.fullName" type="text" class="form-control">
              </div>
            </div>
            <hr class="text-light">

            <div class="row mb-3 align-items-center">
              <div class="col-sm-4 fw-bold text-secondary">Email:</div>
              <div class="col-sm-8">
                <span v-if="!isEditing" class="text-dark">{{ currentUser.email }}</span>
                <input v-else v-model="editingData.email" type="email" class="form-control" disabled>
              </div>
            </div>
            <hr class="text-light">

            <div class="row mb-3 align-items-center">
              <div class="col-sm-4 fw-bold text-secondary">Mật khẩu:</div>
              <div class="col-sm-8">
                <span v-if="!isEditing" class="text-dark">********</span>
                <input v-else v-model="editingData.password" type="password" class="form-control">
              </div>
            </div>
          </div>
        </div>

        <div class="card shadow-sm border-0">
          <div class="card-header bg-success text-white fw-bold">
            <i class="bi bi-info-circle-fill me-2"></i> Giới thiệu về Website
          </div>
          <div class="card-body">
            <h5 class="card-title fw-bold text-success">Kết nối đam mê - Chia sẻ tri thức</h5>
            <p class="card-text text-justify lh-lg">
              Chào mừng bạn đến với ASM 2 của Phú !
              <br><br>
              Đây là không gian mở dành cho tất cả mọi người yêu thích công nghệ và bóng đá.
              Tại đây, bạn có thể tự do chia sẻ những bài viết thú vị, những khoảnh khắc đáng nhớ
              hoặc đơn giản là lưu lại những kỷ niệm của riêng mình.
              Hãy cùng nhau xây dựng một cộng đồng văn minh, tích cực và lan tỏa những điều tốt đẹp nhé!
            </p>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>
<script setup>
import { ref, reactive, onMounted } from 'vue';
import { useRouter } from 'vue-router';

// Nhận currentUser từ App.vue
const props = defineProps(['currentUser']);
const emit = defineEmits(['update-profile']);
const router = useRouter();

const isEditing = ref(false);
const editingData = reactive({});

onMounted(() => {
  if (!props.currentUser) {
    alert("Vui lòng đăng nhập để xem hồ sơ!");
    router.push({ name: 'login' });
  }
});

const startEdit = () => {
  Object.assign(editingData, props.currentUser);
  isEditing.value = true;
};

const cancelEdit = () => {
  isEditing.value = false;
};

const handleFileChange = (event) => {
  const file = event.target.files[0];
  if (file && file.type.startsWith('image/')) {
    const reader = new FileReader();
    reader.onload = (e) => {
      editingData.avatar = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const saveProfile = () => {
  emit('update-profile', { ...editingData });
  isEditing.value = false;
};
</script>

<style scoped>
.text-justify {
  text-align: justify;
}

.card {
  border-radius: 15px;
}

.card-header {
  border-radius: 15px 15px 0 0 !important;
}
</style>