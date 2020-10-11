<template>
  <div class="Nav">
    <router-link class="ScannerTitleLink" to="/scan">
      <h3 class="ScannerTitle">Scan</h3>
    </router-link>
  </div>
</template>

<script>
export default {
  name: "ScannerNavBar",
};
</script>

<style scoped>
.Nav {
  display: flex;
  padding-left: 20px;
  justify-content: flex-start;
  background-color: #212121;
}

.ScannerTitleLink {
  text-decoration: none;
  cursor: pointer;
}

.ScannerTitle {
  color: white;
  font-size: 1.25em;
  font-weight: 400;
}

.material-icons {
  color: white;
  cursor: pointer;
}
</style>