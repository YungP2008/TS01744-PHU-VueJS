<template>
  <div class="container mt-5">
    <div class="row">
      <!-- Cột bên trái: Ảnh đại diện -->
      <div class="col-md-4 text-center mb-4">
        <div class="card shadow-sm border-0 p-3">
          <img 
            src="../assets/images/jerry.jpg" 
            class="rounded-circle img-thumbnail mx-auto mb-3" 
            alt="Avatar"
            style="width: 150px; height: 150px; object-fit: cover;"
          >
          <h4 class="fw-bold">Phạm Châu Lương Phú</h4>
          <p class="text-muted">Thành viên từ: 01/2024</p>
        </div>
      </div>

      <!-- Cột bên phải: Thông tin & Giới thiệu -->
      <div class="col-md-8">
        <!-- Phần Thông tin cơ bản -->
        <div class="card shadow-sm border-0 mb-4">
          <div class="card-header bg-primary text-white fw-bold">
            Thông tin cá nhân
          </div>
          <div class="card-body">
            <div class="row mb-3">
              <div class="col-sm-4 fw-bold text-secondary">Họ và tên:</div>
              <div class="col-sm-8 text-dark">Phạm Châu Lương Phú</div>
            </div>
            <hr class="text-light">
            <div class="row mb-3">
              <div class="col-sm-4 fw-bold text-secondary">Email:</div>
              <div class="col-sm-8 text-dark">phamphu11102008@gmail.com</div>
            </div>
            <hr class="text-light">
            <div class="row mb-3">
              <div class="col-sm-4 fw-bold text-secondary">Mật khẩu:</div>
              <div class="col-sm-8 text-dark">********</div>
            </div>
          </div>
        </div>

        <!-- Phần Bài viết giới thiệu -->
        <div class="card shadow-sm border-0">
          <div class="card-header bg-success text-white fw-bold">
            Bài giới thiệu bản thân
          </div>
          <div class="card-body">
            <h5 class="card-title fw-bold">Chào mừng bạn đến với blog của mình!</h5>
            <p class="card-text text-justify lh-lg">
              Xin chào, mình tên là <strong>Phạm Châu Lương Phú</strong>. Hiện tại mình đang là sinh viên ngành Phát triển phần mềm. 
              Mình có niềm đam mê mãnh liệt với lập trình Web, đặc biệt là các công nghệ như Vue.js và Bootstrap.
            </p>
            <p class="card-text text-justify lh-lg">
              Trang web này là nơi mình chia sẻ những bài viết về kiến thức lập trình, những trải nghiệm trong cuộc sống và 
              kết nối với những người bạn cùng đam mê. Rất vui được làm quen với mọi người!
            </p>
            <div class="mt-3">
              <span class="badge bg-info text-dark me-2">#Hobby: Coding</span>
              <span class="badge bg-info text-dark me-2">#Hobby: Music</span>
              <span class="badge bg-info text-dark">#Hobby: Travel</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

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