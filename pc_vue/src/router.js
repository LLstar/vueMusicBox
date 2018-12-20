import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/home/Home.vue'
import Play from './views/play/Play.vue'
import Person from './views/person/Person.vue'
import Singer from './views/singer/Singer.vue'
import SongList from './views/SongList.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import Favorite from './views/Favorite.vue'
import SingerUSA from './views/singer/SingerUSA.vue'
import SingerZH from './views/singer/SingerZH.vue'
import SingerK from './views/singer/SingerK.vue'
import SingerInfo from './views/singer/SingerInfo.vue'
import SingleSong from './views/singer/singerInfo/SingleSong.vue'
import AllSong from './views/singer/singerInfo/AllSong.vue'
import MV from './views/singer/singerInfo/MV.vue'
import SongDel from './views/singer/singerInfo/SongDel.vue'
import MyMenu from './views/person/MyMenu.vue'
import Sortlist from './views/home/Sortlist.vue'
import SortlistDetails from './views/home/SortlistDetails.vue'
import LocalSong from './views/person/LocalSong.vue'
import Onload from './views/person/Onload.vue'
import SortMenu from './views/home/SortMenu.vue'
import SortMenuList from './views/home/SortMenuList.vue'
import SortMenuList2 from './views/home/SortMenuList2.vue'
import Search from './views/Search.vue'
import SearchList from './views/SearchList.vue'
import MVList from './views/home/MVList.vue'
import Radio from './views/home/Radio.vue'
import SingSong from './views/home/SingSong.vue'
import RadioDetail from './views/home/RadioDetail.vue'
import PlayDetail from './views/play/PlayDetail.vue'
import PlayList from './views/play/PlayList.vue'
import PlayList2 from './views/play/PlayList2.vue'
import PlayList3 from './views/play/PlayList3.vue'
import Member from './views/person/Member.vue'
import LatestPlay from './views/person/LatestPlay.vue'
import LatestPlaySong from './views/person/LatestPlaySong.vue'
import LatestPlayVedio from './views/person/LatestPlayVedio.vue'
import Problem from './components/Problem.vue'
import Pifu from './components/Pifu.vue'
import AboutMe from './components/AboutMe.vue'
import NotFound from './components/NotFound.vue'

Vue.use(Router)

export default new Router({ 
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    { path: '/',redirect: "/home"},
    { path: '/home',component: Home },
    { path: '/play',component: Play,children:[
      { path: '',component: PlayDetail},
      { path: 'playlist',component:PlayList},
      { path: 'playlist2',component:PlayList2},
      { path: 'playlist3',component:PlayList3}
    ] },
    { path: '/person',component: Person },
    { path: '/singer',component: Singer},
    { path: '/songlist',component: SongList},
    { path: '/login',component: Login},
    { path: '/register',component: Register},
    { path: '/favorite',component: Favorite},
    { path: '/singerUSA',component: SingerUSA},
    { path: '/singerZH',component: SingerZH},
    { path: '/singerK',component: SingerK},
    { path: '/singerinfo/:id',component: SingerInfo,children:[
      { path: '',component: SingleSong },
      { path: 'allsong',component: AllSong },
      { path: 'mv',component: MV },
      { path: 'songdel',component: SongDel }
    ]},
    { path: '/mymenu',component: MyMenu},
    { path: '/sortlist',component: Sortlist},
    { path: '/sortlistdetails/:pno',component: SortlistDetails},
    { path: '/localsong',component: LocalSong},
    { path: '/onload',component: Onload},
    { path: '/sortmenu',component: SortMenu},
    { path: '/sortmenulist/:id',component: SortMenuList},
    { path: '/sortmenulist2/:id',component: SortMenuList2},
    { path: '/search',component: Search},
    { path: '/searchlist/:value',component: SearchList},
    { path: '/mvlist',component: MVList},
    { path: '/radio',component: Radio},
    { path: '/singsong',component: SingSong},
    { path: '/radiodetail/:id',component: RadioDetail},
    { path: '/member',component: Member},
    { path: '/latestplay',component: LatestPlay,children:[
      { path: '',component: LatestPlaySong},
      { path: 'latestplayvedio',component: LatestPlayVedio}
    ]},
    { path: '/problem',component: Problem},
    { path: '/pifu',component: Pifu},
    { path: '/aboutme',component: AboutMe},
    { path: '/notfound',component: NotFound}
  ]
})
