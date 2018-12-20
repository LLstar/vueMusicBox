<template>
  <div class="singer">
    <HeaderBack></HeaderBack>
    <h1>This is a singer page</h1>
  </div>
</template>

<script>
  import HeaderBack from '@/components/HeaderBack.vue'
  export default {
    data(){
      return {}
    },
    components: {
      HeaderBack
    }
  }
</script>

<style>
  .singer {
    padding-top: 40px;
  }
</style>