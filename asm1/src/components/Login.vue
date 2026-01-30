<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <!-- Căn chỉnh độ rộng card tương tự Register -->
      <div class="col-12 col-sm-10 col-md-8 col-lg-5">
        <div class="card shadow-lg border-0">
          <div class="card-body p-5">
            <h2 class="text-center fw-bold mb-4 text-success">ĐĂNG NHẬP</h2>
            
            <form>
              <div class="mb-3">
                <label class="form-label fw-bold">Email</label>
                <input type="email" class="form-control form-control-lg" placeholder="@gmail.com">
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold">Mật khẩu</label>
                <input type="password" class="form-control form-control-lg" placeholder="Nhập mật khẩu">
              </div>

              <!-- Thêm ghi nhớ đăng nhập (tùy chọn) -->
              <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="rememberMe">
                <label class="form-check-label" for="rememberMe">Ghi nhớ đăng nhập</label>
              </div>

              <div class="d-grid gap-2 mt-4">
                <button class="btn btn-success btn-lg" type="button">Đăng nhập</button>
              </div>

              <div class="text-center mt-3">
                <span>Chưa có tài khoản? </span>
                <a href="#" class="text-decoration-none text-success fw-bold" @click.prevent="$emit('nav-to', 'register')">Đăng ký ngay</a>
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