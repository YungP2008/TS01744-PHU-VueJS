<template>
<div>
<h2 v-bind:class="className" v-bind:style="styleData" v-html="content"></h2>
<h2 class="text-red" style="font-size: 5rem">{{ content }}</h2>
<button @click="change">Change</button>
</div>
</template>
<script>
export default {
data() {
return {
content: 'xin chào các bạn',
className: 'text-red',
styleData: 'font-size: 5rem'
}
},
methods: {
    change() {
        this.className = 'text-blue';
        this.content = "Đã đổi màu xanh nhé"
    }
}
}
</script>
<style scoped>
.text-red{color: red;}
.text-blue{color: blue;}
</style>