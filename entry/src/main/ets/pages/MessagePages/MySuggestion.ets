import router from '@ohos.router'
import promptAction from '@ohos.promptAction';
// <<<<<<< HEAD
//
// =======
import {getUserName} from '../../../utils/data'
import {getSuggest } from '../../../api/axios';
// >>>>>>> eb98ba99b8eaaf89e3b369172f6e150abbbf2876
@Entry
@Component
struct MySuggestion {
  @State message: string = '我的建议'
  @State subject: string = '';
  @State theme: string = '';
  @State suggestion: string = '';
  @State userName: string = getUserName()

  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.left'))
            .width(25)
            .onClick(()=>{router.back()})

          Text("我的建议")
            .fontSize(20)
            .margin({ left: 100 })
        }
        .width('100%')
        .height('10%')
        .backgroundColor(Color.Yellow)
        .justifyContent(FlexAlign.Start)
        .padding(10)


        Row() {
          Column() {
            Row(){
              Column(){
                Text("科目：")
                  .fontSize(20)
              }
              .width('25%')
              .height('100%')
              .alignItems(HorizontalAlign.Start)
              .margin({
                left:'10vp',
              })
              .justifyContent(FlexAlign.Center)

              Column() {
                Select([{ value: '语文', icon: $r('app.media.chinese') },
                  { value: '数学', icon: $r('app.media.math') },
                  { value: '英语', icon: $r('app.media.english') },
                  { value: '物理', icon: $r('app.media.physics') },
                  { value: '化学', icon: $r('app.media.chemistry') },
                  { value: '政治', icon: $r('app.media.politics') },
                  { value: '生物', icon: $r('app.media.biology') },
                ])
                  .selected(8)
                  .value('请选择')
                  .font({ size: 16, weight: 500 })
                  .fontColor('#182431')
                  .selectedOptionFont({ size: 16, weight: 400 })
                  .optionFont({ size: 16, weight: 400 })
                  .onSelect((index: number, value: string) => {
                    console.info('Select:' + index)
                   //this.theme = Select [index].value;

                    this.subject = value;

                  })
                  .height(40)
                  .width(180)
                  .borderStyle(BorderStyle.Solid)
                  .borderColor(Color.Black)
                  .borderWidth(1)
                  .borderRadius(10)
              }
              .width('80%')

              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Center)

            }
            .height('10%')
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .backgroundColor(Color.White)

            Row() {
              Column(){
                Text('主题：')
                  .fontSize(20)
              }
              .width('25%')
              .height('100%')
              .alignItems(HorizontalAlign.Start)
              .margin({left:'10vp'})
              .justifyContent(FlexAlign.Center)
              Column() {
                TextInput({placeholder: '请输入主题'})
                  .onChange(data => {
                    this.theme = data
                  })
                  .width(200)
                  .height(40)
                  .borderStyle(BorderStyle.Solid)
                  .borderRadius(10)
                  .borderColor(Color.Black)
                  .borderWidth(1)
              }
            }
            .width('100%')
            .height('15%')
            .backgroundColor(Color.White)
            .margin({
               top: 10,
            })

            Row() {
              Column(){
                Text("建议：")
                  .fontSize(20)
                // TextArea({ placeholder: 'input your username' })
              }
              .width('25%')
              .height('100%')
              .alignItems(HorizontalAlign.Start)
              .margin({left:'10vp'})
              .justifyContent(FlexAlign.Center)

              Column(){
                TextArea({ placeholder: '输入建议内容' })
                  .width("70%")
                  .height("80%")
                  .borderStyle(BorderStyle.Solid)
                  .borderRadius(10)
                  .borderColor(Color.Black)
                  .onChange(data => {
                    this.suggestion = data
                    console.info('Suggestion:' + data)
                  })
                //  .borderColor("#D3D3D3")
                  .borderWidth(1)
              }

            }
            .width('100%')
            .height('25%')
            .backgroundColor(Color.White) // 浅灰色的 Hex 代码
            // .justifyContent(FlexAlign.SpaceBetween)
            .margin({
              top: 10,
            })

            Button(){
              Text("发表建议")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .textAlign(TextAlign.Center)
               // .color(Color.White)
                .backgroundColor("#D3D3D3")
                .borderRadius(10)
                .borderWidth(1)
                .borderColor(Color.Black)
                .width("85%")
                .height("9%")

                .onClick(async () => {
                  console.info('提交')
                  console.log(getUserName())
                  if (this.subject == '' || this.suggestion == '' || this.theme == '') {
                    promptAction.showToast({
                      message: '请填写完整信息',
                      duration: 4000, // 弹窗持续时间
                      bottom: '150vp'
                    })
                  }
                  else{
                    let data =   await getSuggest({subject: this.subject, suggestion: this.suggestion, theme: this.theme,
                      username: getUserName()})
                    //console.log(JSON.stringify(data))
                    promptAction.showToast({
                      message: '提交成功',
                      duration: 4000, // 弹窗持续时间
                      bottom: '150vp'
                    })

                  }
                })
            }
            .margin({
              top: 200,
            })
          }
          .width('100%')
          .height('100%')
      }
       .height('90%')
        .width('100%')
        .backgroundColor("#F5F5F5")

        // .alignItems(VerticalAlign.Top)

    }
    .width('100%')
    .height('100%')

  }

  .height('100%')
}
}