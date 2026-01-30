<template>
  <div class="container mt-5">
    <div class="row border p-4 shadow-sm">
      <div class="col-md-7 border-end">
        <h1 class="display-5 fw-bold mb-4">Form Đăng Ký</h1>
        <form @submit.prevent="submitForm">
          <div class="mb-3">
            <label class="form-label">Họ tên:</label>
            <input type="text" class="form-control" v-model="form.name" placeholder="Họ và tên" />
          </div>
          
          <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="email" class="form-control" v-model="form.email" placeholder="email@gmail.com" />
          </div>

          <div class="mb-3">
            <label class="form-label">Mật khẩu:</label>
            <input type="password" class="form-control" v-model="form.password" />
          </div>

          <div class="mb-3">
            <label class="form-label">Ngày sinh:</label>
            <input type="date" class="form-control" v-model="form.dob" />
          </div>

          <div class="mb-3">
            <label class="form-label d-block">Giới tính:</label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" value="Nam" v-model="form.gender" id="nam">
              <label class="form-check-label" for="nam">Nam</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" value="Nữ" v-model="form.gender" id="nu">
              <label class="form-check-label" for="nu">Nữ</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" value="Khác" v-model="form.gender" id="khac">
              <label class="form-check-label" for="khac">Khác</label>
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label d-block">Ngôn ngữ:</label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Tiếng Việt" v-model="form.languages" id="vi">
              <label class="form-check-label" for="vi">Tiếng Việt</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Tiếng Anh" v-model="form.languages" id="en">
              <label class="form-check-label" for="en">Tiếng Anh</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Tiếng Nhật" v-model="form.languages" id="ja">
              <label class="form-check-label" for="ja">Tiếng Nhật</label>
            </div>
          </div>

          <button type="submit" class="btn btn-primary px-4 mt-2">Đăng ký</button>
        </form>
      </div>

      <div class="col-md-5 ps-5">
        <div v-if="isSubmitted">
          <h1 class="display-5 fw-bold mb-4">Thông tin đã đăng ký:</h1>
          <div class="fs-5 lh-lg">
            <p><strong>Họ tên:</strong> {{ form.name }}</p>
            <p><strong>Email:</strong> {{ form.email }}</p>
            <p><strong>Ngày sinh:</strong> {{ form.dob }}</p>
            <p><strong>Giới tính:</strong> {{ form.gender }}</p>
            <p><strong>Ngôn ngữ:</strong> {{ form.languages.join(', ') }}</p>
          </div>
        </div>
        <div v-else class="text-muted mt-5">
          <p>Vui lòng điền form và nhấn "Đăng ký" để xem thông tin.</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

// Biến trạng thái để kiểm soát việc hiển thị 
const isSubmitted = ref(false);

const form = ref({
  name: '',
  email: '',
  password: '',
  dob: '',
  gender: '',
  languages: []
});

// Hàm xử lý khi nhấn nút Đăng ký [cite: 155, 157]
const submitForm = () => {
  if (form.value.name && form.value.email) {
    isSubmitted.value = true;
  } else {
    alert("Vui lòng nhập đầy đủ Họ tên và Email!");
  }
};
</script>
