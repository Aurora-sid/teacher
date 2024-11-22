// @ts-nocheck
import router from '@system.router'
import promptAction from '@ohos.promptAction';
import { testApi,getPassword, register } from "../../../api/axios";
@Entry
@Component
struct RegisterPage {
  @State message: string = '注册账号'
  @State user:string = '';
  @State password: string = '';
  @State confirmPassword: string = '';
  @State gender: string = '';
  build() {
    Column() {
      Row() {
        Image($r('app.media.left'))
          .width(25)
          .onClick(()=>{router.back()})
          // .alignSelf(ItemAlign.Start)
          .margin({ top: 5, left: 10 })
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 90 })
        // Button('注册账号',{type:ButtonType.Normal,stateEffect:true})
        //   .width('50%')
        //   .height(30)
        //   .borderRadius(25)
        //   .onClick(()=>{
        //     router.back()
        //   })
      }
      .width('100%')
      .height('10%')

      .backgroundColor(Color.Yellow)
      // .justifyContent(FlexAlign.Center)
      // .alignItems(HorizontalAlign.Center)
      .padding(10)
      Row() {
        Text('请输入用户名：')
          .fontSize(16)
          .width('40%')
          //.margin({ top: 8, left: 10 })
          .textAlign(TextAlign.Center)
        TextInput()
          .width('60%')
          .height(30)
          .borderRadius(15)
          .backgroundColor('F5F5F5')
          .onChange(data => { // 输入值发生变化，触发回调，data代表输入的内容
            this.user = data;
             console.info('user: ' + data)
          })
      }
      .height('9%')
      .width('100%')
      .margin({ top: 15 })
      .backgroundColor('F5F5F5')

      Row() {
        Text('设置密码：')
          .fontSize(16)
          .width('40%')
            //.margin({ top: 8, left: 10 })
          .textAlign(TextAlign.Center)
        TextInput()
          .width('60%')
          .type(InputType.Password)
          .height(30)
          .borderRadius(15)
          .backgroundColor('F5F5F5')
          .onChange(data =>{
            this.password = data;
             console.info('password: ' + data)
          })
      }
      .height('10%')
      .width('100%')
      .margin({ top: 15 })
      .backgroundColor('F5F5F5')

      Row() {
        Text('再次确认密码：')
          .fontSize(16)
          .width('40%')
            //.margin({ top: 8, left: 10 })
          .textAlign(TextAlign.Center)
        TextInput()
          .width('60%')
          .height('100%')
          .type(InputType.Password)
          .height(30)
          .onChange(data =>{
            this.confirmPassword = data;
             console.info('confirmPassword: ' + data)
          })
          .borderRadius(15)
          .backgroundColor('F5F5F5')

      }
      .height('10%')
      .width('100%')
      .margin({ top: 15 })
      .backgroundColor('F5F5F5')

      Row() {
        Text('选择年级：')
          .fontSize(16)
          .width('40%')
            //.margin({ top: 8, left: 10 })
          .textAlign(TextAlign.Center)
        Column() {
          Select([{ value: '一年级' }, { value: '二年级'}, { value: '三年级'}, { value: '四年级'},
            { value: '五年级'}, { value: '六年级'}, { value: '初一' }, { value: '初二'},
            { value: '初三'}, { value: '高一'}, { value: '高二'}, { value: '高三'},
          ])
            .selected(8)
            .value('请选择')
            .font({ size: 16, weight: 500 })
            .fontColor('#182431')
            .selectedOptionFont({ size: 16, weight: 400 })
            .optionFont({ size: 16, weight: 400 })
            .onSelect((index: number) => {
              console.info('Select:' + index)

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
      .backgroundColor('F5F5F5')
      .margin({ top: 15 })

      Row() {
        Text('辅助邮箱：')
          .fontSize(16)
          .width('40%')
            //.margin({ top: 8, left: 10 })
          .textAlign(TextAlign.Center)
        TextInput()
          .width('60%')
          .height('100%')
          .height(30)
          .borderRadius(15)
          .backgroundColor('F5F5F5')
      }
      .height('10%')
      .width('100%')
      .margin({ top: 15 })
      .backgroundColor('F5F5F5')
      Button('注册', { type: ButtonType.Normal, stateEffect: true })
        .width('50%')
        .height(30)
        .borderRadius(25)
        .margin({ top: 120 })
        .onClick(async ()=>{
          if (this.password !== this.confirmPassword) {
            console.log("两次密码不一致，请重试")
            promptAction.showToast({
              message: '两次密码不一致，请重试',
              duration: 4000, // 弹窗持续时间
              bottom: '100vp'
            })
          }
          else{
             let data =   await register({username:this.user,password:this.password})
            if(data.code === 10000){
              router.back()
            }
             console.log(JSON.stringify(data))

          }
        })
    }
    .height('100%')
    .backgroundColor('#F5F5F5')
    // .alignItems(VerticalAlign.Top)

  }
}