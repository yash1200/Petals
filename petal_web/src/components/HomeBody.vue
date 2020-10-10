<template>
  <div class="homeBody">
    <div class="scan-button">
      <img
        src="https://www.flaticon.com/svg/static/icons/svg/3126/3126504.svg"
        alt="Icons"
        class="scan-icon"
      />
      <p>Scan</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeBody",
};
</script>

<style scoped>
p {
  color: white;
  font-weight: 500;
  font-size: 25px;
}

.scan-button {
  display: flex;
  flex-direction: column;
  width: 70%;
  margin-left: auto;
  margin-right: auto;
  background-color: #424242;
}

.scan-icon {
  background-color: #424242;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
}
</style>
