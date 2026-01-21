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

        <!-- PHẦN NỘI DUNG VÀ ẢNH NHỎ (Dùng d-flex để ảnh nằm cạnh chữ) -->
        <div class="d-flex align-items-start mb-3">
          <!-- Ảnh nhỏ giống trong comment -->
          <img src="../assets/images/speed.jpg" 
               class="rounded border shadow-sm me-3" 
               style="width: 100px; height: 100px; object-fit: cover;" 
               alt="Thumbnail">
          
          <p class="card-text text-secondary mb-0">
            Đây là nội dung của bài viết thứ nhất. Bây giờ ảnh đã được thu nhỏ lại 
            và nằm gọn gàng bên cạnh nội dung như bạn muốn.
          </p>
        </div>

        <hr>
        <p class="small fw-bold mb-2">Bình luận:</p>
        <div class="ms-3 mb-2 p-2 bg-light rounded border-start border-3 border-primary">
          <small class="fw-bold">Mai Quốc Tam</small>
          <p class="mb-0 small">Bình luận của bài 1 nè!</p>
        </div>
      </div>
    </div>

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
            Nội dung bài 2 hoàn toàn khác. Bạn có thể thay đổi chữ này mà không ảnh hưởng bài trên.
          </p>
        </div>

        <hr>
        <div class="ms-3 mb-2 p-2 bg-light rounded border-start border-3 border-success">
          <small class="fw-bold text-success">Nguyễn Văn A</small>
          <p class="mb-0 small">Bài 2 này ảnh cũng đã nhỏ lại rồi!</p>
        </div>
      </div>
    </div>

    <!-- BÀI VIẾT SỐ 3 (Nhân bản và chỉnh sửa riêng) -->
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
          <img src="../assets/images/speed.jpg" 
               class="rounded border shadow-sm me-3" 
               style="width: 100px; height: 100px; object-fit: cover;" 
               alt="Thumbnail">
          <p class="card-text text-secondary">
            Bài viết thứ 3 với thông tin riêng biệt. Ảnh đại diện/minh họa đã đồng nhất kích thước.
          </p>
        </div>

        <hr>
        <div class="ms-3 mb-2 p-2 bg-light rounded border-start border-3 border-danger">
          <small class="fw-bold text-danger">Lê Thị C</small>
          <p class="mb-0 small">Bình luận riêng cho bài số 3.</p>
        </div>
      </div>
    </div>

  </div>
</template>