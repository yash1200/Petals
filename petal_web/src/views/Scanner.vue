<template>
  <div class="home">
    <ScannerNavBar />
    <ScanCode />
  </div>
</template>

<script>
import ScannerNavBar from "@/components/ScannerComponents/ScannerNavBar";
import ScanCode from "@/components/ScannerComponents/ScanCode.vue";

export default {
  name: "Scanner",
  components: {
    ScannerNavBar,
    ScanCode,
  },
};
</script>

<style scoped>
</style>