@Component
export default struct SwiperExample {
  @State swiperData:Array<Resource>= [
    $r('app.media.Sw1'),
    $r('app.media.Sw2'),
    $r('app.media.Sw5'),
    $r('app.media.Sw4'),
  ];

  build() {
   Column(){
     Swiper(){
       ForEach(this.swiperData,(item:Resource)=>{
         Image(item)
           .width('90%')
           .height('160vp')
       })
     }
     .index(0) // 初始化索引
     .autoPlay(true) // 自动播放
     .interval(3000) // 间隔时间 ，默认三秒
     .loop(true) // 轮播循环
     .duration(1000)  // 切换的动画时长
     .itemSpace(10)  // 图片间隙
     .indicator(true) // 导航点
   }
    .width('100%')
    .margin({top:'5vp'})
  }
}