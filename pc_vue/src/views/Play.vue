<template>
  <div class="play">
    <mt-header></mt-header>
    <h1>This is a play page</h1>
  </div>
</template>

<script>
  import mtHeader from '@/components/Header.vue'
  export default {
    data(){
      return {}
    },
    components: {
      mtHeader
    }
  }
</script>

<style>
  .play {
    padding-top: 40px;
  }
</style>