<template>
    <div>
        <br>
        <h2>Danh sách bài viết</h2>
        <div v-for="(post, index) in posts" :key="index" :class="{ 'highlighted': post.title.length > 20 }" :style="{ backgroundColor: post.backgroundColor, color: post.textColor}" class="post">
            <h3 class="text-success">{{ post.title }}</h3>
            <h4 class="text-danger">{{ post.author }}</h4>
            <p>{{ post.content }}</p>
        </div>
    </div>
</template>
<script setup>
    import { defineProps } from 'vue';

    defineProps({
        posts: {
            type: Array,
            required: true
        }
    });
</script>
<style>
    .post {
        padding: 20px;
        margin: 10px 0;
        border: 1px solid #ddd; 
        border-radius: 10px;
    }

    .post p {
        word-wrap: break-word;
        word-break: break-word;
        overflow-wrap: break-word;
        white-space: pre-wrap;
    }

    .highlighted {
        border: 2px solid lightgray;
    }
    
</style>