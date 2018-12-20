import Vue from 'vue'
import App from './App.vue'
import router from './router'

//引入vue-resource组件，用来发送ajax请求
import VueResource from 'vue-resource'
Vue.use(VueResource)
//设置请求的根路径(服务器地址)
Vue.http.options.root = "http://localhost:3001/";

//使用mint-ui中的组件时，需要先引入再注册
//import {Header,Button} from "mint-ui"
//Vue.component(Header.name,Header)

//完整引入mint-ui的所有组件
import MintUI from 'mint-ui'
Vue.use(MintUI)
//引入完整的elementUI的组件
import ElementUI from 'element-ui';
Vue.use(ElementUI);
import 'element-ui/lib/theme-chalk/index.css';

//引入mui的css文件
import "@/assets/css/mui.css"
import "@/assets/css/icons-extra.css"
//引入外部的字体样式
import '@/assets/css/iconfont.css'

//引入mint-ui中的css文件
import 'mint-ui/lib/style.css'


//时间转换的过滤器
Vue.filter("dateTimeFilter",function(val){
  //年
  var year = new Date(val).getFullYear();
  //月
  var month = new Date(val).getMonth()+1;
  month = month>9?month:"0"+month;
  //日
  var date = new Date(val).getDate();
  date = date>9?date:"0"+date;

  return year+"-"+month+"-"+date+"";
  //2018-08-22
})
//服务器中的静态资源路径的过滤器
Vue.filter("resouceFilter",function(val){
  return 'http://localhost:3001/'+val;
})

//2.1:将vuex添加到项目中
  //1:导入vuex
  import Vuex from 'vuex'
  //2:将vuex注册vue
  Vue.use(Vuex)
  //3:创建vuex实例[共享数据;提供操作数据方法;获取数据方法]
  //new Vuex.Store(); 得到一个数据仓储对象
  var store = new Vuex.Store({
    state:{   
      //专门用来保存共享数据，即组件中的data
      //如果在组件中操作 this.$store.state.** 方法
      //购物车中数量共享数据
      bgUrl:"/img/bg1.jpg"
    },  
    mutations:{
      //#注意 操作共享数据只能通过 mutations提供方法
      //如果组件想调用 mutations 只能使用
      //this.$store.commit("changeBgUrl");
      changeBgUrl:(state,url)=>{ 
        state.bgUrl = url;
       }
    },
    getters:{
      //#getters 只负责对外提供数据，不负责修改数据
      //在组件模板中 {{this.$store.getters.optBgUrl}}
      optBgUrl:function(state){
        return state.bgUrl;
      }
    }
  });
//小结：
//1:state中的数据，不能直接修改，必须通过mutations
//2:如果组件想直接获取数据 简单 this.$store.state.***
//3:推荐使用 getters 方法
//4:如果组件想修改数据 this.$store.commit("substract");


  //4:将vuex实例对象添加到vue对象中
//3：创建Vue实例对象，挂载public/index.html#app

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
