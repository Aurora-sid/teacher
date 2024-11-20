// @ts-nocheck
// 导入页面路由
import router from '@ohos.router';
// ohos,open Harmony OS
// 弹窗接口
import promptAction from '@ohos.promptAction';
import { testApi,getPassword, register } from "../../api/axios"
import { promptAction } from '@kit.ArkUI';
@Entry
@Component
struct Login {
  @State message: string = '欢迎登录';
  @State user:string = '';
  @State password: string = '';

  private item:Array<{title:string,iconSelected:Resource}> =[
    {title:'微信',iconSelected:$r('app.media.WeChat')},
    {title:'QQ',iconSelected:$r('app.media.QQ')},
    {title:'手机',iconSelected:$r('app.media.phone')},
  ]


  build() {
    // 页面布局
    Row() {
      Column() {
        // LOGO
        Image($r("app.media.register"))
          .width('80vp') // 80 = '80vp'
          .height('80vp')
          .margin({ top: '180vp' })
          .borderRadius(100)
        // 登录
        Text(this.message)
          .fontSize('25fp')
          .fontWeight(FontWeight.Bold)
        // 用户名，密码输入信息
        TextInput({ placeholder: '请输入用户名'})
        //  .placeholderColor(Color.Black) // 设置占位符颜色为红色
         // .fontColor(Color.Black)
        //  .backgroundColor('#D3D3D3')
          .inputStyle()
          .maxLength(20)
          .onChange(data => { // 输入值发生变化，触发回调，data代表输入的内容
            this.user = data;
           // console.info('user: ' + data)
          })

        TextInput({ placeholder: '请输入密码' })
          //.fontColor(Color.Black)
      //    .backgroundImageSize(10)
         // .backgroundColor('#D3D3D3')
          .type(InputType.Password) // 输入框类型
          .inputStyle() // 公共样式函数
          .onChange(data => { // 输入值发生变化，触发回调，data代表输入的内容
            this.password = data;
          //  console.info('password: ' + data)
          })
        // 文字提示
        Row() {
          Text('短信验证码登录')
            .textStyle() // 公共样式函数
          Text('忘记密码')
            .textStyle()
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround) // 子组件对齐方式

        // 登录按钮
        Button('登录', { type: ButtonType.Capsule, stateEffect: true }) // 按钮类型
          .width('90%')
          .margin('10vp')
          .onClick(async () => {
            if (this.user == '' || this.password == '') {
              // 不可跳转,弹窗提示
              promptAction.showToast({
                message: '用户名或密码不能为空',
                duration: 3000, // 弹窗持续时间
                bottom: '60vp'
              })
            }
            else {
                 let result =   await getPassword(this.user)
                  // console.log(result.data.password)
              // console.log(result.code)
           //   console.log(JSON.stringify(result))
           //      console.log(JSON.stringify(result.message))
              if(result.code ===0){
             //   console.log("用户存在")
                console.log("验证未通过，用户不存在")
                promptAction.showToast({
                  message: '用户不存在',
                  duration: 4000, // 弹窗持续时间
                  bottom: '100vp'
                })
              }
              else if(this.password === result.data.password){
                console.log("验证通过，密码正确")
                console.log(JSON.stringify(result.data))
                router.pushUrl({
                  url: 'pages/MainPage'
                }).catch((error: Error) => {
                  // 错误提示
                })
              }
              else if(this.password!== result.data.password){
               console.log("验证未通过，密码错误")
                promptAction.showToast({
                  message: '用户名或密码错误',
                  duration: 4000, // 弹窗持续时间
                  bottom: '100vp'
                })
              }
            }
          }
          );

            // 路由跳转

       // 其他
        Row(){
          Text('注册账号')
            .textStyle()
            .fontColor(Color.Blue)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/LoginPages/RegisterPage'
              }).catch((error: Error) => {
                // 错误提示
              })
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          ForEach(this.item, (item: { title: string; iconSelected: Resource }) => {
            Button(item.title, { type: ButtonType.Circle, stateEffect: true }){
              Image(item.iconSelected)
                .borderRadius(110)
            }
              .width('50vp') // 设置按钮宽度
              .height('50vp') // 设置按钮高度
              .backgroundColor(Color.White)
              .onClick(() => {
                promptAction.showToast({ message: `${item.title} 登录`, duration: 2000 });
              });
          }, (item: { title: string; iconSelected: Resource }) => JSON.stringify(item));
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ top: '80vp' });

      }
      .width('100%')
      .height('100%')

    }
    .backgroundImage('/pages/Picture/03.jpg')
    .backgroundImageSize(1)
    .width('100%')
    .height('100%')
  }
}
// 添加公共函数
// @Extend装饰器：扩展组件样式
// @Extend(名称)function 样式名称(){}
@Extend(Text) function textStyle(){
  .fontSize('15fp')
  .fontColor(Color.Blue)
  .height('20vp')
}

@Extend(TextInput) function inputStyle(){
  .placeholderColor(0x999999)
  .maxLength(6) // 最大长度
  .padding('12vp')
  .margin('10vp')
}

@Extend(Button) function buttonWHStyle(){
  .width('75vp')
  .height('70vp')
}