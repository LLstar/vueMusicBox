<template>
  <div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
    <aside id="offCanvasSide" class="mui-off-canvas-left">
      <div id="offCanvasSideScroll" class="mui-scroll-wrapper">
        <div class="mui-scroll">
          <div class="title">侧滑导航</div>
          <div class="content">
            这是可拖动式侧滑菜单示例，你可以在这里放置任何内容；关闭侧滑菜单有多种方式： 1.在手机屏幕任意位置向左拖动(drag)；2.点击本侧滑菜单页之外的任意位置; 3.点击如下红色按钮
            <span class="android-only">；4.Android手机按back键；5.Android手机按menu键
            </span>。
            <p style="margin: 10px 15px;">
              <button id="offCanvasHide" type="button" class="mui-btn mui-btn-danger mui-btn-block" style="padding: 5px 20px;">关闭侧滑菜单</button>
            </p>

          </div>
          <div class="title" style="margin-bottom: 25px;">侧滑列表示例</div>
          <ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted">
            <li class="mui-table-view-cell">
              <a class="mui-navigate-right">
                Item 1
              </a>
            </li>
            <li class="mui-table-view-cell">
              <a class="mui-navigate-right">
                Item 2
              </a>
            </li>
            <li class="mui-table-view-cell">
              <a class="mui-navigate-right">
                Item 3
              </a>
            </li>
            <li class="mui-table-view-cell">
              <a class="mui-navigate-right">
                Item 4
              </a>
            </li>
            <li class="mui-table-view-cell">
              <a class="mui-navigate-right">
                Item 5
              </a>
            </li>
            <li class="mui-table-view-cell">
              <a class="mui-navigate-right">
                Item 6
              </a>
            </li>
          </ul>
        </div>
      </div>
    </aside>
    <div class="mui-inner-wrap">
      <header class="mui-bar mui-bar-nav">
        <a href="#offCanvasSide" class="mui-icon mui-action-menu mui-icon-bars mui-pull-left"></a>
        <a class="mui-icon mui-icon-extra mui-icon-extra-custom mui-pull-right"></a>
        <input text="type" value="请搜索" class="mui-input">
      </header>

      <div class="mui-off-canvas-backdrop"></div>
    </div>
	</div>
</template>

<script>
  export default {
    data(){
      return {}
    }
  }
</script>

<style>
#offCanvasWrapper {
  height: 40px;
  position: fixed;
  top: 0;
  left: 0;
}
#offCanvasWrapper .mui-bar.mui-bar-nav{
  background: #647077;
  color: #fff;
}

#offCanvasWrapper .mui-bar.mui-bar-nav > a{
  color:#fff;
  font-size: 16px;
  line-height: 25px;
}

#offCanvasWrapper .mui-bar.mui-bar-nav > a.mui-icon-extra-custom {
  font-size: 24px;
}


#offCanvasWrapper .mui-bar.mui-bar-nav >.mui-input {
  text-align: center;
  height: 30px;
  margin: 0 auto;
  background: rgba(255,255,255,0.3);
  text-decoration: none;
  text-shadow: none;
  border: 0;
  border-radius: 15px;
  margin-top: 5px;
  margin-left: 45px;
  color: rgba(255,255,255,.6);
  font-size:14px;
  width: 235px;
}
</style>