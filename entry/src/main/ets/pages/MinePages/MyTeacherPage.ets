import router from '@ohos.router';
import {getUserTeacher} from '../../../api/axios'
import {getUserName} from '../../../utils/data'

@Entry
@Component
struct MyListsPage {
  @State message: string = '我的老师'
  @State private teacher: { id: number, name: string, subject: string, phone: string, describe: string, starttime: string, endtime: string } = {
    id: -1,
    name: '',
    subject: '',
    phone: '',
    describe: '',
    starttime: '',
    endtime: ''
  }
  @State imgList: Array<{ url: Resource }> = [
    { url: $r('app.media.T') },
    { url: $r('app.media.T2') },
    { url: $r('app.media.T3') },
    { url: $r('app.media.T4') },
    { url: $r('app.media.T5') },
    { url: $r('app.media.T6') },
    { url: $r('app.media.T6') },
    { url: $r('app.media.T6') },
    { url: $r('app.media.T6') },
    { url: $r('app.media.T6') },
    { url: $r('app.media.T6') }
  ]

  async aboutToAppear() {
    let result = await getUserTeacher(getUserName());
    if(result.data){

      this.teacher = result.data;
    }else{

    }


    // console.log(JSON.stringify(this.teacher));
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

      // 判断 teacher.id 是否为 -1
      if (this.teacher.id === -1) {
        // 无预约老师时的显示内容lisi
        Column() {
          Text("暂无预约老师")
            .fontSize(20)
            .margin(10)
        }.justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center).height("90%")
      }
 else {
        // // 有预约老师时的显示内容
        Column() {
          Row() {
            Image(this.imgList[this.teacher.id - 1].url).width("50%").height("100%").backgroundColor(Color.Pink)
            Column() {
              Text("姓名: " + this.teacher.name)
                .fontSize(20)
              Text("学科: " + this.teacher.subject)
                .fontSize(20)
              Text("电话: " + this.teacher.phone)
                .fontSize(20)
              Text("开始时间: " + this.teacher.starttime)
                .fontSize(17)
              Text("结束时间: " + this.teacher.endtime)
                .fontSize(17)
            }.width("50%").alignItems(HorizontalAlign.Start)
          }.height("80%")
          Row().margin(5)
          Text(this.teacher.describe).backgroundColor(Color.Orange).padding(2)
        }.width("80%").backgroundColor(Color.Blue).height("30%").borderRadius(10).padding(10)
      }
    }
    .height('100%')
    .width("100%")
    .backgroundColor('#f1f3f5')
  }
}
