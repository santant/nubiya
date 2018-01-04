<template>
	<div id="index" style="width: 100%;height:100%;">
		<!--<div class="diaocha">
			<a href="http://testbuilder.artup.com/test/diaocha/wx/index.html"><i>📃</i>问题反馈</a>
		</div>-->
		<div class="swipeDiv" style="width: 100%;height: 400px;">
			<mt-swipe :auto="4000">
				<mt-swipe-item v-for="(img,index) in indexImg">
					<a class="a_herf" :href="img.link">
						<img @click="showGqtz(index)" :src="img.imgUrl" />
					</a>
				</mt-swipe-item>
			</mt-swipe>
		</div>
		<div v-DomHeight class="btn_btn">
			<ul class="btn_ul">
				<li>
					<router-link to="bbsMsg?category=xiaoshiguang">
						<i style="font-size: 3.1875rem;" class="icon iconfont">&#xe625;</i>
						<p>小时光</p>
					</router-link>
				</li>
				<li>
					<router-link to="huaceMsg?category=shiguangji">
						<i style="font-size: 3.1875rem;" class="icon iconfont">&#xe7ca;</i>
						<p>拾光集</p>
					</router-link>
				</li>
				<li>
					<router-link to="tlMsg?category=taili">
						<i style="font-size: 3.1875rem;" class="icon iconfont">&#xe686;</i>
						<p>台历</p>
					</router-link>
				</li>
				<li>
					<router-link to="khMsg?category=kuanghua">
						<i style="font-size: 3.1875rem;" class="icon iconfont">&#xe628;</i>
						<p>框画</p>
					</router-link>
				</li>
				<li>
					<router-link to="hbMsg?category=haibao">
						<i style="font-size: 3.1875rem;" class="icon iconfont">&#xe609;</i>
						<p>海报</p>
					</router-link>
				</li>
				<li>
					<router-link to="user">
						<i style="font-size: 3.1875rem;" class="icon iconfont">&#xe64b;</i>
						<p>个人中心</p>
					</router-link>
				</li>
			</ul>
		</div>
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