<template>
  <div>
    <main style="height: 740px">
      <h1>{{ title }}</h1>
      <div class="arrow-field">
        <button @click="showPrev">&lt;</button>
        <button @click="showNext">&gt;</button>
      </div>
      <VueSlickCarousel ref="carousel" v-bind="settings">
        <div class="no-outline" v-for="(item, index) in items" :key="index">
          <Wine :item="item"></Wine>
        </div>
      </VueSlickCarousel>
    </main>
  </div>
</template>

<script>
import VueSlickCarousel from "vue-slick-carousel";
import "vue-slick-carousel/dist/vue-slick-carousel.css";
import "vue-slick-carousel/dist/vue-slick-carousel-theme.css";
import Wine from "./Wine";
import items from "./items.js";
// import RightArrow from "./RightArrow.vue";
// import LeftArrow from "./LeftArrow.vue";

export default {
  props: ["title"],
  components: {
    VueSlickCarousel,
    Wine,
    // RightArrow,
    // LeftArrow,
  },
  methods: {
    showNext() {
      this.$refs.carousel.next();
    },
    showPrev() {
      this.$refs.carousel.prev();
    },
  },
  data() {
    return {
      items,
      settings: {
        dots: false,
        infinite: true,
        initialSlide: 2,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 1,
        swipeToSlide: false,
        responsive: [
          {
            breakpoint: 1200,
            settings: {
              slidesToShow: 3,
            },
          },
          {
            breakpoint: 992,
            settings: {
              slidesToShow: 3,
            },
          },
          {
            breakpoint: 860,
            settings: {
              slidesToShow: 2,
            },
          },
          {
            breakpoint: 576,
            settings: {
              slidesToShow: 1,
            },
          },
        ],
      },
    };
  },
};
</script>

<style lang="scss" scoped>
.no-outline:focus {
  outline: none;
}
main {
  padding: 2rem 1rem;
  width: 100%;
  h1 {
    margin: 0 0 0.5rem 2rem;
    font-size: 4rem;
    font-family: "Times New Roman", Times, serif;
    font-weight: normal;
  }
  .arrow-field {
    width: 98%;
    display: flex;
    justify-content: flex-end;
    margin-right: 0;
    @media only screen and (max-width: 576px) {
      width: 95%;
    }
  }
  .arrow-field button {
    width: 40px;
    height: 40px;
    color: rgb(181, 153, 131);
    font-size: 1.5rem;
    text-align: center;
    background: rgba(255, 255, 255, 0);
    border: 1px solid rgb(181, 153, 131);
  }

  .arrow {
    position: absolute;
    top: -15%;
    font-size: 2.8rem;
    color: black;
    border: 1px solid rgb(119, 82, 82);
    z-index: 1;
    cursor: pointer;
    &:active {
      opacity: 0.8;
    }
    &[data-type="prev"] {
      right: 90px;
    }
    &[data-type="next"] {
      right: 40px;
    }
  }
  @media only screen and (max-width: 992px) {
    h1 {
      font-size: 2.5rem;
    }
    .arrow {
      top: -10%;
    }
  }
  @media only screen and (max-width: 576px) {
    h1 {
      font-size: 1.5rem;
    }
    .arrow {
      &[data-type="prev"] {
        right: 70px;
      }
      &[data-type="next"] {
        right: 20px;
      }
    }
  }
  @media only screen and (max-width: 320px) {
    h1 {
      margin-left: 1rem;
      font-size: 1.2rem;
    }
    .arrow {
      &[data-type="prev"] {
        right: 70px;
      }
      &[data-type="next"] {
        right: 20px;
      }
    }
  }
}
</style>