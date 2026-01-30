<template>
  <div class="container mt-5">
    <div class="row">
      <form @submit.prevent="submitForm" class="col-sm-4 border p-4 rounded shadow-sm">
        <h3 class="mb-3">{{ isEditing ? 'Cập nhật học sinh' : 'Thêm học sinh' }}</h3>
        
        <div class="mb-3">
          <label for="name" class="form-label">Họ tên:</label>
          <input type="text" class="form-control" v-model="student.name" id="name" placeholder="Nhập họ tên" required />
        </div>
        
        <div class="mb-3">
          <label for="score" class="form-label">Điểm:</label>
          <input type="number" max="10" min="0" class="form-control" v-model.number="student.score" id="score" placeholder="Nhập điểm (0-10)" required />
        </div>
        
        <div class="mb-3">
          <label for="dob" class="form-label">Ngày sinh:</label>
          <input type="date" class="form-control" v-model="student.dob" id="dob" required />
        </div>
        
        <button type="submit" class="btn" :class="isEditing ? 'btn-warning' : 'btn-success'">
          {{ isEditing ? 'Cập nhật' : 'Thêm' }}
        </button>
      </form>

      <div class="col-sm-8 ps-5">
        <h3 class="mb-3">Danh sách học sinh</h3>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>Họ và tên</th>
              <th>Điểm</th>
              <th>Ngày sinh</th>
              <th>Hành động</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(stu, index) in students" :key="index">
              <td>{{ stu.name }}</td>
              <td>{{ stu.score }}</td>
              <td>{{ stu.dob }}</td>
              <td>
                <button class="btn btn-warning btn-sm me-2" @click="editStudent(index)">Sửa</button>
                <button class="btn btn-danger btn-sm" @click="deleteStudent(index)">Xóa</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

// 1. Dữ liệu mẫu ban đầu theo yêu cầu Lab
const students = ref([
  { name: 'Nguyễn Chí Hùng', score: 8, dob: '2006-01-01' },
  { name: 'Phạm Thị Lan', score: 9, dob: '2006-05-15' }
]);

// 2. Biến quản lý trạng thái form và chế độ sửa
const student = ref({
  name: '',
  score: null,
  dob: ''
});

const isEditing = ref(false);
const editingIndex = ref(null);

// 3. Hàm xử lý gửi form (Thêm mới hoặc Cập nhật)
function submitForm() {
  if (isEditing.value) {
    // Cập nhật học sinh tại vị trí index đang chọn
    students.value[editingIndex.value] = { ...student.value };
    isEditing.value = false;
    editingIndex.value = null;
  } else {
    // Thêm học sinh mới vào danh sách
    students.value.push({ ...student.value });
  }
  resetForm(); // Xóa sạch form sau khi thực hiện xong
}

// 4. Hàm đưa dữ liệu từ bảng ngược lại form để sửa
function editStudent(index) {
  student.value = { ...students.value[index] };
  isEditing.value = true;
  editingIndex.value = index;
}

// 5. Hàm xóa học sinh khỏi danh sách
function deleteStudent(index) {
  if (confirm('Bạn có chắc chắn muốn xóa học sinh này không?')) {
    students.value.splice(index, 1);
  }
}

// 6. Hàm reset form về mặc định
function resetForm() {
  student.value = {
    name: '',
    score: null,
    dob: ''
  };
}
</script>
