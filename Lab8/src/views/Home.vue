<template lang="">
    <div>
        <h2> đây là trang home </h2>
        <button @click="goToAbout">Go to About</button>
    </div>
</template>
<script>
export default {
    methods: {
        goToAbout() {
            this.$router.push('/about');
        }
    }
}
</script>
<style lang="">

</style>