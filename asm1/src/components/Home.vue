<template>
  <div class="container mt-4">
    <!-- 1. FORM ĐĂNG BÀI MỚI -->
    <div class="card mb-5 shadow-sm border-0 bg-light">
      <div class="card-body">
        <h5 class="fw-bold text-success">Tạo bài viết mới</h5>
        <input type="text" class="form-control mb-2" placeholder="Tiêu đề bài viết">
        <textarea class="form-control mb-2" rows="2" placeholder="Nội dung..."></textarea>
        <input type="file" class="form-control form-control-sm mb-2">
        <button class="btn btn-success btn-sm px-4">Đăng bài</button>
      </div>
    </div>

    <!-- BÀI VIẾT SỐ 1 -->
    <div class="card mb-4 shadow-sm border-0">
      <div class="card-body">
        <div class="d-flex justify-content-between mb-2">
          <h5 class="fw-bold">Tiêu đề bài viết số 1</h5>
          <div class="btn-group">
            <button class="btn btn-sm btn-outline-warning">Sửa</button>
            <button class="btn btn-sm btn-outline-danger ms-1">Xóa</button>
          </div>
        </div>

        <div class="d-flex align-items-start mb-3">
          <img src="../assets/images/jerry.jpg" 
               class="rounded border shadow-sm me-3" 
               style="width: 100px; height: 100px; object-fit: cover;" 
               alt="Thumbnail">
          <p class="card-text text-secondary mb-0">
            Đây là nội dung của bài viết thứ nhất.
          </p>
        </div>

        <hr>
        <p class="small fw-bold mb-2">Bình luận:</p>
        <!-- Danh sách bình luận hiện có -->
        <div class="ms-3 mb-2 p-2 bg-light rounded border-3 border-primary">
          <small class="fw-bold">Lương Phú</small>
          <p class="mb-0 small">Bình luận của bài 1 nè!</p>
        </div>

        <!-- PHẦN NHẬP BÌNH LUẬN CHO NGƯỜI DÙNG (BÀI 1) -->
        <div class="mt-3 d-flex gap-2">
          <input type="text" class="form-control form-control-sm rounded-pill bg-light border-0 ps-3" placeholder="Viết bình luận của bạn...">
          <button class="btn btn-primary btn-sm rounded-pill px-3">Gửi</button>
        </div>
      </div>
    </div>

    <!-- BÀI VIẾT SỐ 2 -->
    <div class="card mb-4 shadow-sm border-0">
      <div class="card-body">
        <div class="d-flex justify-content-between mb-2">
          <h5 class="fw-bold text-primary">Tiêu đề bài viết số 2</h5>
          <div>
            <button class="btn btn-sm btn-outline-warning">Sửa</button>
            <button class="btn btn-sm btn-outline-danger ms-1">Xóa</button>
          </div>
        </div>

        <div class="d-flex align-items-start mb-3">
          <img src="../assets/images/speed.jpg" 
               class="rounded border shadow-sm me-3" 
               style="width: 100px; height: 100px; object-fit: cover;" 
               alt="Thumbnail">
          <p class="card-text text-secondary">
            Nội dung bài 2 đây.
          </p>
        </div>

        <hr>
        <p class="small fw-bold mb-2">Bình luận:</p>
        <div class="ms-3 mb-2 p-2 bg-light rounded border-3 border-success">
          <small class="fw-bold text-success">Mai Quốc Tam</small>
          <p class="mb-0 small">hehe</p>
        </div>

        <!-- PHẦN NHẬP BÌNH LUẬN CHO NGƯỜI DÙNG (BÀI 2) -->
        <div class="mt-3 d-flex gap-2">
          <input type="text" class="form-control form-control-sm rounded-pill bg-light border-0 ps-3" placeholder="Viết bình luận của bạn...">
          <button class="btn btn-primary btn-sm rounded-pill px-3">Gửi</button>
        </div>
      </div>
    </div>

    <!-- BÀI VIẾT SỐ 3 -->
    <div class="card mb-4 shadow-sm border-0">
      <div class="card-body">
        <div class="d-flex justify-content-between mb-2">
          <h5 class="fw-bold">Tiêu đề bài viết số 3</h5>
          <div>
            <button class="btn btn-sm btn-outline-warning">Sửa</button>
            <button class="btn btn-sm btn-outline-danger ms-1">Xóa</button>
          </div>
        </div>

        <div class="d-flex align-items-start mb-3">
          <img src="../assets/images/miwa.jpg" 
               class="rounded border shadow-sm me-3" 
               style="width: 100px; height: 100px; object-fit: cover;" 
               alt="Thumbnail">
          <p class="card-text text-secondary">
            Bài viết thứ 3 đây.
          </p>
        </div>

        <hr>
        <p class="small fw-bold mb-2">Bình luận:</p>
        <div class="ms-3 mb-2 p-2 bg-light rounded border-3 border-danger">
          <small class="fw-bold text-danger">Hoàng Nguyên</small>
          <p class="mb-0 small">ahihi</p>
        </div>

        <!-- PHẦN NHẬP BÌNH LUẬN CHO NGƯỜI DÙNG (BÀI 3) -->
        <div class="mt-3 d-flex gap-2">
          <input type="text" class="form-control form-control-sm rounded-pill bg-light border-0 ps-3" placeholder="Viết bình luận của bạn...">
          <button class="btn btn-primary btn-sm rounded-pill px-3">Gửi</button>
        </div>
      </div>
    </div>

  </div>
</template>

<style scoped>
/* Chỉnh một chút để ô input khi click vào không bị viền đen xấu */
.form-control:focus {
  box-shadow: none;
  background-color: #f8f9fa !important;
  border: 1px solid #0d6efd !important;
}
</style>