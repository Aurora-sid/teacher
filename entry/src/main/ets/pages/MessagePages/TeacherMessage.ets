import router from '@ohos.router';
@Entry
@Component
struct TeacherMessage {
  @State messages: Array<{ sender: string, content: string }> = [
    { sender: 'teacher', content: '你好，请提前准备一下课本哦' },
    { sender: 'student', content: '老师，我想问一下今天的作业是什么？' }
  ];
  @State newMessage: string = '';

  build() {
    Column() {
      // 标题栏
      Row() {
        Image($r('app.media.left'))
          .width(25)
          .onClick(()=>{router.back()})

        Text("老师消息")
          .fontSize(20)
          .margin({ left: 100 })
      }
      .width('100%')
      .height('10%')
      .backgroundColor('#F5FFFA')
      .justifyContent(FlexAlign.Start)
      .padding(10)

      // 聊天消息区域
      List({ space: 10 }) {
        ForEach(this.messages,(item:{sender:string,content:string}) => {
          ListItem(){
          if (item.sender === 'teacher') {
            // 老师消息
            Row() {
              Column() {
                Text("老师: " + item.content)
                  .fontSize(16)
                  .backgroundColor('#87CEEB')
                  .padding(10)
                  .borderRadius(8)
              }
            }
            .width('100%')
            .justifyContent(FlexAlign.Start)
          } else {
            // 学生消息
            Row() {
              Column() {
                Text("我: " + item.content)
                  .fontSize(16)
                  .backgroundColor('#f1f3f5')
                  .padding(10)
                  .borderRadius(8)

              }
            }
            .width('100%')
            .justifyContent(FlexAlign.End)
          }
          }
        });
      }
      .height("78%")
      .padding(10)

      // 输入区域
      Row() {
        TextInput({ placeholder: "请输入消息..." })
          .width("75%")
          .height("100%")
          .fontSize(20)
          .onChange((value: string) => {
            this.newMessage = value;
          })

        Button("发送")
          .width("20%")
          .fontSize(16)
          .onClick(() => {
            if (this.newMessage.trim() !== '') {
              this.messages.push({ sender: 'student', content: this.newMessage });
              this.newMessage = '';
            }
          })
      }
      .height(60)
      .padding(10)
      .alignItems(VerticalAlign.Center)
    }
    .height("100%")
    .width("100%")
  }
}
