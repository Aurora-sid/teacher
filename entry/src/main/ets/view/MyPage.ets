import router from '@ohos.router';
import MineUser from './components/MineUser'
import MineList from './components/MineList'
import trap from './components/trap';
@Component
export default struct My {
  @State message: string = '我的';

  build() {
    Row() {
      Column(){
        Text(this.message)
          .fontSize('16fp')
          .alignSelf(ItemAlign.Start)
        // 用户描述
        MineUser()
        // 列表
        trap()
        //列表
        MineList()
        // 退出登录
        Button('退出登录')
          .width('90%')
          .height('40vp')
          .fontSize('16fp')
          .fontColor(Color.Black)
          .backgroundColor('#e5e8ea')
          .margin({
            top:'12vp'
          })
          .onClick(()=>{
            router.pushUrl({
              url:'pages/LoginPage'
            }).catch((error:Error)=>{
            // 异常处理
            })
          })
      }
      .width('100%')
      .padding('20vp')
      .height('100%')
    }
    .backgroundColor('#f1f3f5')
  }
}