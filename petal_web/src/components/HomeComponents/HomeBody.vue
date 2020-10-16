<template>
  <div class="HomeBody">
    <div class="HomeBodyContent">
      <router-link to="/scan">
        <div class="scan-button">
          <img
            src="https://www.flaticon.com/svg/static/icons/svg/3126/3126504.svg"
            alt="Icons"
            class="scan-icon"
          />
          <div class="scan-button-name">Scan</div>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeBody",
};
</script>

<style scoped>
.HomeBody {
  height: 93vh;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}

p {
  color: white;
  font-size: 25px;
  font-weight: 500;
}

.scan-button {
  width: 65%;
  display: flex;
  margin-left: auto;
  margin-right: auto;
  border-radius: 20px;
  padding: 30px 0 30px;
  justify-content: center;
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
  color: white;
  padding-top: 20px;
  font-weight: 400;
  font-size: 1.8em;
  text-decoration: none;
}
</style>
