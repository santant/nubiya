<template>
	<div id="index" style="width: 100%;height:100%;">
		<p>404</p>
		<p>您请求的页面不存在!!</p>
	</div>

</template>

<script>
	import Api from '../../API.js'
	import { Swipe, SwipeItem, Indicator } from 'mint-ui';
	export default {
		data() {
			return {
				indexImg: []
			}
		},
		methods: {
			fetchData() {
				//alert(this.$route.query.userDbId)
				sessionStorage.setItem('urlQuery', JSON.stringify(this.$route.query))
				if(this.$route.query.userDbId) {
					localStorage.setItem('userDbId', this.$route.query.userDbId)
				}
				if(this.$route.query.query_tag) { //跳转到哪里去
					var query_tag = this.$route.query.query_tag
					switch (query_tag){
						case "cart":
							this.$router.push({path:"/cart",query:{}})
							break;
						case "order":
							this.$router.push({path:"/orderList",query:{}})
							break;
					    case "coupon":
							this.$router.push({path:"/CouponExchange",query:{}})
							break;	
					    case "haibao":
							this.$router.push({path:"/hbMsg",query:{"category":"haibao"}})
							break;
						case "xiaoshiguang":
							this.$router.push({path:"/bbsMsg",query:{"category":"xiaoshiguang"}})
							break;	
					    case "shiguangji":
							this.$router.push({path:"/huaceMsg",query:{"category":"shiguangji"}})
							break;		
					   case "taili":
							this.$router.push({path:"/tlMsg",query:{"category":"taili"}})
							break;	
					   case "kuanghua":
							this.$router.push({path:"/hbMsg",query:{"category":"kuanghua"}})
							break;
						default:
							break;
					}
				}
			}
		},
		mounted() {

			Indicator.open({
				text: '加载中...',
				spinnerType: 'fading-circle'
			});

			if(JSON.stringify(this.$route.query) != "{}") {
				this.fetchData();
			}
			//首页请求的数据
			Api.Index.indexImg().then(res => {
				//				var obj = {
				//					client:'mobile',
				//					imgUrl:'http://image2.artup.com/resources/static/pc/images/gqfhtz.jpg'
				//				}
				//				res.data.data.unshift(obj)

				this.indexImg = res.data.data;
				console.log(this.indexImg)
				Indicator.close();
			})
		},
		watch: {
			$route: 'fetchData'
		}

	}
</script>

<style>
	.a_herf {
		display: block;
		width: 100%;
		height: 100%;
	}
	
	.a_herf>img {
		display: block;
		width: 100%;
	}
	
	.gqfhtz {
		width: 100%;
		height: 100%;
		position: fixed;
		z-index: 999;
		display: none;
		overflow-y: auto;
		background-image: url("http://image2.artup.com/resources/static/pc/images/gqfhtz_02.jpg");
	}
	
	.content {
		width: 17.77rem;
		height: 100%;
		margin: 0 auto;
		margin-bottom: 3rem;
	}
	
	.content h2 {
		width: 100%;
		text-align: center;
		font-size: 1.03rem;
		color: #bc1b00;
		height: 5.18rem;
		line-height: 5.18rem;
	}
	
	.content .wzList {
		margin-top: 0.2rem;
	}
	
	.content .wzList h1 {
		font-size: 0.8rem;
		line-height: 1.11rem;
		color: #712d00;
		font-weight: 500;
	}
	
	.content .wzList p {
		text-indent: 0.8rem;
		font-size: 0.8rem;
		line-height: 1.1rem;
		color: #712d00;
	}
	
	.lastP {
		text-align: center;
		/*font-size: 0.648rem !important;*/
		margin-top: 2.03rem;
		font-weight: 500;
	}
</style>