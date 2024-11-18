// @ts-nocheck
// 导入页面路由
import router from '@ohos.router';
// ohos,open Harmony OS
// 弹窗接口
import promptAction from '@ohos.promptAction';
import axios from '@ohos/axios';
import {http} from '@kit.NetworkKit';
@Entry
@Component
struct Login {
  @State message: string = '欢迎登录';
  @State user:string = '';
  @State password: string = '';
  @State userList: Array<any> = []; // 确保初始为空数组，而非 undefined
  @State isPresent: boolean = false;


  private item:Array<{title:string,iconSelected:Resource}> =[
    {title:'微信',iconSelected:$r('app.media.WeChat')},
    {title:'QQ',iconSelected:$r('app.media.QQ')},
    {title:'手机',iconSelected:$r('app.media.phone')},
  ]
  // // 获取用户列表的方法
  // getUserList() {
  //   // 请求地址：http://47.92.137.107:8080/test/userList
  //   axios.get('localhost:8080/test/userList')
  //     .then(response => {
  //       console.log('接口返回数据:', response.data); // 打印数据查看
  //
  //       // 确保返回的数据是一个数组
  //       if (Array.isArray(response.data)) {
  //         this.userList = response.data; // 将获取到的用户列表数据赋值给userList状态
  //       } else {
  //         console.error('返回数据不是数组:', response.data);
  //         this.userList = []; // 如果返回的数据不是数组，确保 userList 是一个空数组
  //       }
  //     })
  //     .catch(error => {
  //       // 处理请求错误
  //       promptAction.showToast({
  //         message: '请求失败: ' + error.message,
  //         duration: 3000,
  //         bottom: '60vp'
  //       });
  //     });
  // }

  build() {
    // 页面布局
    Row() {
      Column() {
        // LOGO
        Image($r("app.media.register"))
          .width('80vp') // 80 = '80vp'
          .height('80vp')
          .margin({ top: '115vp' })
          .borderRadius(100)
        // 登录
        Text(this.message)
          .fontSize('25fp')
          .fontWeight(FontWeight.Bold)
        // 用户名，密码输入信息
        TextInput({ placeholder: '请输入用户名' })
          .backgroundImageSize(10)
          .inputStyle()
          .onChange(data => { // 输入值发生变化，触发回调，data代表输入的内容
            this.user = data;
            console.info('user: ' + data)
          })

        TextInput({ placeholder: '请输入密码' })
          .backgroundImageSize(10)
          .type(InputType.Password) // 输入框类型
          .inputStyle() // 公共样式函数
          .onChange(data => { // 输入值发生变化，触发回调，data代表输入的内容
            this.password = data;
            console.info('password: ' + data)
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
          .onClick(() => {
            if (this.user == '' || this.password == '') {
              // 不可跳转,弹窗提示
              promptAction.showToast({
                message: '用户名或密码为空',
                duration: 3000, // 弹窗持续时间
                bottom: '60vp'
              })
            }
            else {
              //   this.getUserList(); // 获取用户列表

              router.pushUrl({
                url: 'pages/MainPage'
              }).catch((error: Error) => {
                // 错误提示
              })
            }
          }
          );

        // 显示获取到的用户列表
        // if (Array.isArray(this.userList) && this.userList.length > 0) {
        //   Row() {
        //     Text('用户列表:')
        //       .fontSize('20fp')
        //       .fontWeight(FontWeight.Bold)
        //       .padding('10vp');
        //     ForEach(this.userList, (item: { id: number; name: string }) => {
        //       Row() {
        //         Text(`用户ID: ${item.id}, 用户名: ${item.name}`)
        //           .fontSize('15fp')
        //           .padding('5vp');
        //       }
        //       .width('100%')
        //       .justifyContent(FlexAlign.Start);
        //     });
        //   }
        //   .width('100%')
        //   .margin({ top: '20vp' });
        // } else {
        //   // 如果用户列表为空，显示提示
        //   Row() {
        //     Text('没有获取到用户数据')
        //       .fontSize('15fp')
        //       .fontColor(Color.Red)
        //       .padding('10vp');
        //   }
        //   .width('100%')
        //   .justifyContent(FlexAlign.Start);
        // }

            // 路由跳转

       // 其他
        Row(){
          Text('其他登录方式')
            .textStyle()
            .fontColor(Color.Blue)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          ForEach(this.item, (item: { title: string; iconSelected: Resource }) => {
            Button(item.title, { type: ButtonType.Circle, stateEffect: true }){
              Image(item.iconSelected)
                .borderRadius(110)
            }
              //.backgroundImage(item.iconSelected)
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
        .margin({ top: '20vp' });

      }
      .width('100%')
      .height('100%')

    }
    .backgroundImage('/pages/Picture/04.jpg',{fit:ImageFit.Fill})
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