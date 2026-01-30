<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <!-- Căn chỉnh độ rộng card cho đẹp -->
      <div class="col-12 col-sm-10 col-md-8 col-lg-5">
        <div class="card shadow-lg border-0">
          <div class="card-body p-5">
            <h2 class="text-center fw-bold mb-4 text-success">ĐĂNG KÝ</h2>
            
            <form>
              <div class="mb-3">
                <label class="form-label fw-bold">Họ và tên</label>
                <input type="text" class="form-control form-control-lg" placeholder="Nhập họ và tên">
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">Email</label>
                <input type="email" class="form-control form-control-lg" placeholder="@gmail.com">
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">Mật khẩu</label>
                <input type="password" class="form-control form-control-lg" placeholder="Nhập mật khẩu">
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">Xác nhận mật khẩu</label>
                <input type="password" class="form-control form-control-lg" placeholder="Nhập lại mật khẩu">
              </div>

              <div class="d-grid gap-2 mt-4">
                <button class="btn btn-success btn-lg" type="button">Tạo tài khoản</button>
              </div>

              <div class="text-center mt-3">
                <span>Đã có tài khoản? </span>
                <a href="#" class="text-decoration-none text-success fw-bold" @click.prevent="$emit('nav-to', 'login')">Đăng nhập</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
defineEmits(['nav-to'])
</script>