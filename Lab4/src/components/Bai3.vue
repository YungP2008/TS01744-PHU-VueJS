<template>
  <div class="container">
    <h1>{{ greeting }}</h1>

    <button 
      :title="buttonTitle" 
      @click="changeGreeting"
    >
      Click để thay đổi
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      greeting: 'Xin chào bạn!',
      buttonTitle: 'Nhấn để thay đổi lời chào'
    };
  },
  methods: {
    changeGreeting() {
      if (this.greeting === 'Xin chào bạn!') {
        this.greeting = 'Hello, World!';
        this.buttonTitle = 'Bấm để quay lại lời chào tiếng Việt';
      } else {
        this.greeting = 'Xin chào bạn!';
        this.buttonTitle = 'Nhấn để thay đổi lời chào';
      }
    }
  }
};
</script>