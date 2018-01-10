<template>
	<div>

	</div>
</template>

<script>
   import { Toast ,Actionsheet,Popup,Indicator} from 'mint-ui';
   import Api from '@/api.js'
    export default {
        data() {
            return {

            }
        },
        methods: {


        },

        mounted() {
        	var jsons = {
        		paymentType:this.$route.query.paymentType,
        		addressId:this.$route.query.addressId,
        		dbId:this.$route.query.dbId,
        		userDbId:this.$route.query.userDbId,
        		openId:this.$route.query.openId,
            client:'mobile',
        		subject:'努比亚支付'
        	};
        	if(this.$route.query.isZeroPaid == 1){
        		Api.car.updataOrderStatus3Pay({id:jsons.dbId, status:3}).then(res=>{
				if(res.data.status == 1){
                    var stateObj = { foo: "bar" };
					this.$router.push( { path : '/orderList'})
				}
			},err=>{
				Toast('请求数据失败');
			})
        	}else{

        	Api.car.orderPay(jsons).then(res=>{
            //alert(res.data.code);
    		  if(res.data.code === 'success'){
    		  	alert(JSON.stringify(res.data))
					//手机微信支付
//					wxpay(res.data,function callback(res){
//                      //alert(res.errMsg);
//                      
//						if(res.errMsg=="chooseWXPay:fail"){
//							Toast('调起支付失败');
//							Api.car.updataOrderStatus2Pay({dbId:jsons.dbId, status:1}).then(res=>{
//								if(res.data.code == 'success'){
//                                  var stateObj = { foo: "bar" };
//                                  history.pushState(stateObj, "", "#user");
//
//									this.$router.push( { path : '/orderList'})
//								}
//
//							},err=>{
//								Toast('请求数据失败');
//							})
//
//						}else if(res.errMsg == "chooseWXPay:cancel" ) {//用户取消订单
//
//							Api.car.updataOrderStatus2Pay({dbId:jsons.dbId, status:1}).then(res=>{
//								if(res.data.code == 'success'){
//									//this.$router.replace({path:"/orderList"})
////												this.$router.replace({path:"/orderList"})
//                                  var stateObj = { foo: "bar" };
//                                  history.pushState(stateObj, "", "#user");
//									this.$router.push( { path : '/orderList'})
//								}
//
//							},err=>{
//
//                               var stateObj = { foo: "bar" };
//                              history.pushState(stateObj, "", "#user");
//
//								Toast('请求数据失败');
//                              this.$router.push( { path : '/orderList'})
//							})
//
//                          var stateObj = { foo: "bar" };
//                          history.pushState(stateObj, "", "#user");
//							Toast('用户取消支付');
//							this.$router.push( { path : '/orderList'})
//
//						}else{
//							Toast('支付成功');
//                          //this.$router.replace({path:"/orderList"})
//                          var stateObj = { foo: "bar" };
//                          history.pushState(stateObj, "", "#user");
//                          this.$router.push( { path : '/orderList'})
//						}
//					
//					});

				} else {

                    if(res.data.acquireOpenId && res.data.acquireOpenId === 'Y'){
                        window.location.href= res.data.codeUrl;
                    } else if(res.data.pay && res.data.pay === 'Y'){
                        this.$router.push( { path : '/user'})
                    }
                    else {
                        Toast('支付失败');
                        Api.car.updataOrderStatus2Pay({dbId:jsons.dbId, status:1}).then(res=>{
                        if(res.data.code == 'success'){
                            var stateObj = { foo: "bar" }
                            history.pushState(stateObj, "", "#user")
							this.$router.push( { path : '/orderList'})

                        }

                        },err=>{
                            Toast('请求数据失败');
                        })
                    }

				}
    	   },err=>{
    		Toast('请求数据失败');
    	   })
      }
   }
  }
</script>

<style>
</style>
