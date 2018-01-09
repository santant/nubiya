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
        <span class="express-number">物流单号　123456789</span>
        <button class="copy-btn">复制</button>
      </div>
    </div>
    <div class="address-info">
      <i class="iconfont icon-icon-yxj-address"></i>
      <span class="address-name">殷星</span>
      <span class="address-phone">130****5415</span>
      <span class="address-details">北京市-顺义区-高立庄1号</span>
    </div>
    <div class="border"></div>
    <div class="order-goods-list">
      <div class="order-goods-item">
        <div class="thumbnail"
             style="background-image: url('https://wx4.sinaimg.cn/mw690/a1019e1ely1fn0d15u54gj20qo1407cl.jpg');"></div>
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
      <div class="line order-number">
        <span>订单编号：2017062759052212169</span>
        <button class="btn copy-btn">复制</button>
      </div>
      <div class="line coupons">
        <label for="coupons-amount">使用优惠券</label>
        <span id="coupons-amount">-￥89.00</span>
      </div>
      <div class="line order-time">
        <span class="order-time-label">下单时间：</span>
        <span class="order-time-value">2017-06-27 11:16:13</span>
      </div>
      <div class="line order-sum">
        <div class="row">
          <label for="goods-amount">商品总额</label>
          <span id="goods-amount">￥310</span>
        </div>
        <div class="row">
          <label for="freight">+运费</label>
          <span id="freight">￥0</span>
        </div>
      </div>
      <div class="line actual-payment">
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
    color: #333;
    font-size: .8rem;
    background: #f4f5f5;
    .iconfont {
      display: inline-block;
      width: 1.5em;
      color: #9698a1;
    }
    .order-state, .making, .express, .address-info, .payment-channel {
      padding: 0 .66rem 0 .8rem;
      line-height: 2.4rem;
      background: #fff;
      border-bottom: 1px solid #ebebeb;
    }
    .order-state .order-amount {
      float: right;
    }
    .express {
      padding: .4rem .66rem .45rem .8rem;
      line-height: 1;
      .express-details {
        margin-top: .6rem;
        padding-left: 1.9em;
        line-height: 1.2rem;
        vertical-align: middle;
      }
      .express-number {
        line-height: 24px;
      }
      .copy-btn {
        line-height: 24px;
        box-sizing: border-box;
        padding: 0 .6rem;
        margin-left: .4rem;
        font-size: .48rem;
        color: #999;
        border: 1px solid #c7c7c7;
        background: #fff;
        outline: 0;
      }
    }
    .address-info {
      padding: 1rem .66rem 1rem .8rem;
      line-height: 1;
      border: none;
      .address-name, .address-phone {
        font-weight: bold;
      }
      .address-details {
        display: block;
        padding-left: 1.9em;
        margin-top: .9rem;
      }
    }
    .border {
      height: 4px;
      background: url('../../assets/img/border-3l.png');
      background-size: 100% 100%;
    }
    .order-goods-list {
      margin-top: 0.56rem;
      background: #fff;
      border: 0 solid #e3e3e3;
      border-top-width: 1px;
      border-bottom-width: 1px;
    }
    .order-goods-item {
      display: flex;
      padding: .48rem .53rem .5rem .88rem;
    }
    .thumbnail {
      flex: 0 0 4.8rem;
      height: 4.8rem;
      background-position: 50%;
      background-repeat: no-repeat;
      background-size: contain;
      background-color: #fff;
      border: 1px solid #ebebeb;
      border-radius: 4px;
    }
    .order-goods-info {
      flex: 1;
      width: 100%;
      padding-left: .88rem;
      font-size: .64rem;
      .order-goods-name, .order-goods-type, .order-goods-size, .order-goods-color {
        display: block;
        margin-top: .46rem;
        color: #8a8b96;
      }
      .order-goods-name {
        padding-top: .24rem;
        margin-top: 0;
        color: #333;
      }
    }
    .unit-price-count {
      flex: 0 0 3rem;
      text-align: right;
      .unit-price {
        color: #333;
      }
      .count {
        display: block;
        margin-top: .46rem;
        color: #8a8b96;
      }
    }
    .payment-channel {
      border-bottom: 1px solid #ebebeb;
      #channel-name {
        float: right;
      }
    }
    .order-data {
      margin-top: 0.56rem;
      color: #999;
      background: #fff;
      .line {
        padding: 0 .66rem 0 .8rem;
        line-height: 2.4rem;
        border-bottom: 1px solid #ebebeb;
      }
      #coupons-amount, #goods-amount, #freight {
        float: right;
      }
      .actual-payment {
        border: 0;
        text-align: right;
        #payment-amount {
          color: #d82e00;
        }
      }
      .order-operation {
        text-align: right;
      }
      .btn {
        margin-left: .6rem;
        line-height: 1.44rem;
        width: 5em;
        text-align: center;
        border: 1px solid #333;
        color: #333;
        background: #fff;
        outline: 0;
      }
      .copy-btn {
        color: #999;
        border-color: #999;
      }
      .pay-btn, .delete-btn {
        color: #d82e00;
        border-color: #d82e00;
      }
    }
  }
</style>
