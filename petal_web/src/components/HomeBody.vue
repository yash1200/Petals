<template>
  <div class="homeBody">
    <div class="scan-button">
      <img
        src="https://www.flaticon.com/svg/static/icons/svg/3126/3126504.svg"
        alt="Icons"
        class="scan-icon"
      />
      <div class="scan-button-name">Scan</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeBody",
};
</script>

<style scoped>
.homeBody {
  padding-top: 50%;
}

p {
  color: white;
  font-weight: 500;
  font-size: 25px;
}

.scan-button {
  width: 70%;
  display: flex;
  margin-left: auto;
  margin-right: auto;
  border-radius: 20px;
  padding: 20px 0 20px;
  align-content: center;
  flex-direction: column;
  background-color: #424242;
}

.scan-icon {
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  background-color: #424242;
}

.scan-button-name {
  padding-top: 20px;
  color: white;
  font-weight: 400;
  font-size: 1.8em;
}
</style>
