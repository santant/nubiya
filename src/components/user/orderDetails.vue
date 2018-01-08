<template>
  <div class="order-details">
    <mt-header title="订单详情">
      <router-link to="" v-tap='{methods:linkGo}' slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
    </mt-header>
    <div class="order-state">
      <i class="iconfont icon-yizhifu"></i>
      <span class="state-text">待支付</span>
      <span class="order-amount">需要付款：￥399</span>
    </div>
    <div class="making">
      <i class="iconfont icon-xiangzi1"></i>
      <span class="making-test">生产中</span>
    </div>
    <div class="express">
      <i class="iconfont icon-kuaidi"></i>
      <span class="express-text">顺丰快递</span>
      <div class="express-details">
        <span class="express-number">123456789</span>
        <button class="copy-btn">复制</button>
      </div>
    </div>
    <div class="address-info">
      <i class="iconfont icon-icon-yxj-address"></i>
      <span class="address-name">殷星</span>
      <span class="address-phone">130****5415</span>
      <span class="address-details">北京市-顺义区-高立庄1号</span>
    </div>
    <div class="order-goods-list">
      <div class="order-goods-item">
        <div class="thumbnail"></div>
        <div class="order-goods-info">
          <span class="order-goods-name">未命名未命名</span>
          <span class="order-goods-type">框画</span>
          <span class="order-goods-size">400X500mm</span>
          <span class="order-goods-color">原木框棕色</span>
        </div>
        <div class="unit-price-count">
          <span class="unit-price">￥399</span>
          <span class="count">X1</span>
        </div>
      </div>
    </div>
    <div class="payment-channel">
      <label for="channel-name">支付方式</label>
      <span id="channel-name">努比亚支付</span>
    </div>
    <div class="order-data">
      <div class="order-number">
        <span>订单编号：2017062759052212169</span>
        <button class="copy-btn">复制</button>
      </div>
      <div class="coupons">
        <label for="coupons-amount"></label>
        <span id="coupons-amount">-￥89.00</span>
      </div>
      <div class="order-time">
        <span class="order-time-label">下单时间：</span>
        <span class="order-time-value">2017-06-27 11:16:13</span>
      </div>
      <div class="order-sum">
        <div class="row">
          <label for="goods-amount">商品总额</label>
          <span id="goods-amount">￥310</span>
        </div>
        <div class="row">
          <label for="freight">+运费</label>
          <span id="freight">￥0</span>
        </div>
      </div>
      <div class="actual-payment">
        <label for="payment-amount">实付款：</label>
        <span id="payment-amount">￥310.00</span>
      </div>
      <div class="order-operation">
        <button class="btn cancel-btn">取消订单</button>
        <button class="btn pay-btn">去支付</button>
        <button class="btn delete-btn">删除订单</button>
      </div>
    </div>
  </div>
</template>

<script>
  import {Toast, Actionsheet, Popup, Indicator, MessageBox} from 'mint-ui'
  import Api from '@/api.js'

  export default {
    data() {
      return {
        userDbId: ''
      }
    },
    methods: {
      linkGo() {
        this.$router.go(-1)
      }
    },
    mounted() {
      this.userDbId = localStorage['userDbId']
    }
  }
</script>

<style lang="less" type="text/less" rel="stylesheet/less">
  .order-details {
    .order-state {

    }
  }
</style>
