import Home from '../view/HomePage'
import TeacherPage from '../view/TeacherPage'
import LibraryPage from '../view/LibraryPage'
import My from '../view/MyPage'
import Message from '../view/MessagePage'
import router from '@ohos.router'
@Entry
@Component
struct Main {
  @State message: string = '首页';
  // 获取前一个页面传递过来的数据
  @State account: string = ''
  @State password: string = ''
  // 控制Tabs组件进行页签切换
  controller: TabsController = new TabsController()
  private item:Array<{title:string,iconSelected:Resource,iconNormal:Resource}> =[
     {title:'首页',iconSelected:$r('app.media.first_1'),iconNormal:$r('app.media.first_2')},
     {title:'老师',iconSelected:$r('app.media.teacher_1'),iconNormal:$r('app.media.teacher_2')},
     {title:'图书',iconSelected:$r('app.media.book_2'),iconNormal:$r('app.media.book')},
     {title:'消息',iconSelected:$r('app.media.message_2'),iconNormal:$r('app.media.message_1')},
     {title:'我的',iconSelected:$r('app.media.mine_icon_'),iconNormal:$r('app.media.My_icon')},
  ]
  @State currentIndex:number = 0; // 索引

  aboutToAppear(): void {
    if (router.getParams() !== undefined && router.getParams() !== null) {
      let record = router.getParams() as Record<string, string>;
      if (record !== undefined && record !== null) {
        this.account = record['account']
        this.password = record['password']
        console.info('接收到前一个页面的参数：', JSON.stringify(record))
      }
    }
  }

  // @Builder 装饰器 自定义构建函数
  @Builder TabBuilder(title,iconSelected,iconNormal,index){
    Column(){
      Image(this.currentIndex === index?iconSelected:iconNormal)
        .width('25vp')
        .height('25vp')
      Text(title)
        .fontColor(this.currentIndex===index?'#007dee':'#182431')
        .fontSize('14fp')
        .fontWeight(500)
    }
    .width('100%')
  }
  build() {
    Row() {
      Tabs({barPosition:BarPosition.End}){
        ForEach(this.item,(item:{title:string,iconSelected:Resource,iconNormal:Resource},index:Number)=>{
          TabContent(){
            Column(){
            //  Text(item.title)
              // 加载不同组件
              if (index === 0) {
                Home()
              }else if (index === 1){
                TeacherPage()
              }
              else if(index === 2){
                LibraryPage()
              }
              else if(index === 3){
                Message()
              }
              else {
                My()
              }
            }
          }.tabBar(this.TabBuilder(item.title,item.iconSelected,item.iconNormal,index))
        })

      }
      .vertical(false)
      .barWidth('100%')
      .barHeight('70vp')
      .animationDuration(400)
      .onChange((index:number)=>{
        this.currentIndex = index;
      })
    }
    .height('100%')
  }
}