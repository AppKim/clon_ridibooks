<template>
<div class="review">
    <span class="review__star">
        <span class="star5_rating" data-rate="4"></span>
    </span>
    <span class="review__count">4</span>
</div> 
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
.star5_rating{
    position: relative;
    z-index: 0;
    display: inline-block;
    white-space: nowrap;
    color: #CCCCCC; 
    font-size: 15px;
}

.star5_rating:before, .star5_rating:after{
    content: '★★★★★';
}

.star5_rating:after{
    position: absolute;
    z-index: 1;
    top: 0;
    left: 0;
    overflow: hidden;
    white-space: nowrap;
    color: #ffcf32; 
}

.star5_rating[data-rate="5"]:after{ width: 100%; } /* 星5 */
.star5_rating[data-rate="4.5"]:after{ width: 90%; } /* 星4.5 */
.star5_rating[data-rate="4"]:after{ width: 80%; } /* 星4 */
.star5_rating[data-rate="3.5"]:after{ width: 70%; } /* 星3.5 */
.star5_rating[data-rate="3"]:after{ width: 60%; } /* 星3 */
.star5_rating[data-rate="2.5"]:after{ width: 50%; } /* 星2.5 */
.star5_rating[data-rate="2"]:after{ width: 40%; } /* 星2 */
.star5_rating[data-rate="1.5"]:after{ width: 30%; } /* 星1.5 */
.star5_rating[data-rate="1"]:after{ width: 20%; } /* 星1 */
.star5_rating[data-rate="0.5"]:after{ width: 10%; } /* 星0.5 */
.star5_rating[data-rate="0"]:after{ width: 0%; } /* 星0 */
</style>