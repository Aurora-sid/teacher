import SwiperExample from './components/SwiperExample'
import ListExample from './components/ListExample'
import Daohang from './components/Daohang'
import {registerCoupon} from '../../api/axios'
import promptAction from '@ohos.promptAction';
import {getUserName} from '../../utils/data'
@Component
export default struct Home {
  @State message: string = 'sckdc';
  @State teacherName: string = '?'
  @State startTime: string = '?'
  @State endTime: string = '?'
  // 创建构造器，与装饰器呼应相连。
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      // 确认按钮回调函数
      confirm: (val:string,val2:string) => {
        this.onAccept(val,val2)
      },
    })
  })
  // 确认
  async onAccept(startTime:string,endTime:string) {


  }
  aboutToAppear(){
    this.dialogController.open()
  }
  build() {
    Scroll() {
      Column(){
        // 轮廓
        SwiperExample()
        // 导航
        Daohang()
        // 列表
        ListExample()
      }
      .width('100%')
    }
    .scrollBar(BarState.Auto)
  }
}

// @CustomDialog装饰器用于装饰自定义弹框，此装饰器内进行自定义内容（也就是弹框内容）。
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  confirm: (val: string,val2:string) => void
  answer: string = ''
  startTime: string = ''
  endTime: string = ''

  build() {

    Row() {
      Column() {
        // Text(this.message)
        //   .fontSize('16fp')
        //   .alignSelf(ItemAlign.Start)
        // TeacherList()

        Column() {
          // Text('')
          //   .fontSize(20)
          // TextInput({ placeholder: "请输入数字" })
          //   .type(InputType.Number)
          //   .onChange((value: string) => {
          //     this.answer = value
          //   })
          Image($r('app.media.Dis2'))
          .height(200)

          Row({ space: 40 }) {
            Button('不用了谢谢')
              .onClick(() => {
                // 关闭弹窗
                this.controller.close()
              })
            Button('领取')
              .onClick(async () => {
                // 关闭弹窗
                this.controller.close()
              let result =  await registerCoupon({username:getUserName(),value:100,min:0})
                promptAction.showToast({
                  message: '领取成功',
                  duration: 3000, // 弹窗持续时间
                  bottom: '60vp'
                })
                // 确认按钮回调函数
               // this.confirm(this.startTime, this.endTime)
              })
          }
        }
      }
    }
    .width(400)
    .height(250)
  }}