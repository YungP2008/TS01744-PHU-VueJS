<template>
    <div class="container mt-5">
        <div class="row">
            <form @submit.prevent="submitForm" class="col-sm-4 border p-4 rounded shadow-sm">
                <h3 class="mb-3">{{ isEditing ? 'Cập nhật học sinh' : 'Thêm học sinh' }}</h3>

                <div class="mb-3">
                    <label for="name" class="form-label">Họ tên:</label>
                    <input type="text" class="form-control" v-model="student.name" id="name" placeholder="Nhập họ tên"
                        required />
                </div>

                <div class="mb-3">
                    <label for="score" class="form-label">Điểm:</label>
                    <input type="number" max="10" min="0" step="0.1" class="form-control" v-model.number="student.score"
                        id="score" placeholder="Nhập điểm (0-10)" required />
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
                            <th>Xếp loại</th>
                            <th>Kết quả</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(stu, index) in students" :key="index">
                            <td>{{ stu.name }}</td>
                            <td>{{ stu.score }}</td>
                            <td>{{ stu.dob }}</td>
                            <td>
                                <span v-if="stu.score < 5">Yếu</span>
                                <span v-else-if="stu.score < 6.5">Trung bình</span>
                                <span v-else-if="stu.score < 8">Khá</span>
                                <span v-else-if="stu.score < 9">Giỏi</span>
                                <span v-else>Xuất sắc</span>
                            </td>
                            <td>
                                <span v-if="stu.score >= 5" style="color: green; font-weight: bold;">Đậu</span>
                                <span v-else style="color: red; font-weight: bold;">Rớt</span>
                            </td>
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

const students = ref([
    { name: 'Nguyễn Chí Hùng', score: 8, dob: '2006-01-01' },
    { name: 'Phạm Thị Lan', score: 4.5, dob: '2006-05-15' }
]);

const student = ref({
    name: '',
    score: null,
    dob: ''
});

const isEditing = ref(false);
const editingIndex = ref(null);

function submitForm() {
    if (isEditing.value) {
        students.value[editingIndex.value] = { ...student.value };
        isEditing.value = false;
        editingIndex.value = null;
    } else {
        students.value.push({ ...student.value });
    }
    resetForm();
}

function editStudent(index) {
    student.value = { ...students.value[index] };
    isEditing.value = true;
    editingIndex.value = index;
}

function deleteStudent(index) {
    if (confirm('Bạn có chắc chắn muốn xóa học sinh này không?')) {
        students.value.splice(index, 1);
    }
}

function resetForm() {
    student.value = {
        name: '',
        score: null,
        dob: ''
    };
}
</script>