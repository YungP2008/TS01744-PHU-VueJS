<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-sm-6">
        <h3>Form Đăng Ký</h3>
        <form @submit.prevent>
          <div class="mb-3">
            <label>Họ tên:</label>
            <input type="text" class="form-control" v-model="form.name" placeholder="Họ và tên">
          </div>
          <div class="mb-3">
            <label>Email:</label>
            <input type="email" class="form-control" v-model="form.email" placeholder="email@gmail.com">
          </div>
          <div class="mb-3">
            <label>Mật khẩu:</label>
            <input type="password" class="form-control" v-model="form.password">
          </div>
          <div class="mb-3">
            <label>Ngày sinh:</label>
            <input type="date" class="form-control" v-model="form.dob">
          </div>
          <div class="mb-3">
            <label>Giới tính:</label><br>
            <input type="radio" value="Nam" v-model="form.gender"> Nam
            <input type="radio" value="Nữ" v-model="form.gender"> Nữ
            <input type="radio" value="Khác" v-model="form.gender"> Khác
          </div>
          <div class="mb-3">
            <label>Ngôn ngữ:</label><br>
            <input type="checkbox" value="Tiếng Việt" v-model="form.languages"> Tiếng Việt
            <input type="checkbox" value="Tiếng Anh" v-model="form.languages"> Tiếng Anh
            <input type="checkbox" value="Tiếng Nhật" v-model="form.languages"> Tiếng Nhật
          </div>
        </form>
      </div>

      <div class="col-sm-6">
        <h3>Thông tin đã đăng ký:</h3>
        <p><strong>Họ tên:</strong> {{ form.name }}</p>
        <p><strong>Email:</strong> {{ form.email }}</p>
        <p><strong>Ngày sinh:</strong> {{ form.dob }}</p>
        <p><strong>Giới tính:</strong> {{ form.gender }}</p>
        <p><strong>Ngôn ngữ:</strong> {{ form.languages.join(', ') }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
const form = ref({
  name: '',
  email: '',
  password: '',
  dob: '',
  gender: '',
  languages: []
});
</script>