import router from '@ohos.router';
import {getUserName} from '../../../utils/data'
import { getUserCount } from "../../../api/axios"

@Entry
@Component
struct MyWalletPage {
  @State message: string = '我的钱包'
  @State count:number = 0
  async aboutToAppear(){
    let result = await getUserCount(getUserName())
    this.count = result.data
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.left'))
          .width(25)
          .onClick(()=>{router.back()})

        Text(this.message)
          .fontSize(20)
          .margin({ left: 100 })
      }
      .width('100%')
      .height('10%')
      .backgroundColor(Color.Yellow)
      .justifyContent(FlexAlign.Start)
      .padding(10)
      .margin({bottom:10})

      Column() {
        Text(getUserName())
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({bottom:40})
        Text( this.count + '￥')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('95%')
      .height('30%')
      .backgroundColor(Color.Green)
      .borderRadius(20)
      .padding(10)
    }
    .height('100%')
    .width('100%')
  }
}