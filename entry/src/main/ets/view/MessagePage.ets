import router from '@ohos.router';
import { ItemType } from '../model/types'

@Component
export default struct Message {
  @State message: string = '消息';
  private listData: Array<ItemType> = [
    {
      title: '预约的老师消息',
      img: $r('app.media.WeChat'),
      url:'pages/LoginPage'
    },
    {
      title: '我要提建议',
      img: $r('app.media.WeChat'),
      url:'pages/MessagePages/MySuggestion'
    },
    {
      title: '消息论坛',
      img: $r('app.media.WeChat'),
      url:'pages/LoginPage'
    },
    {
      title: '优惠信息',
      img: $r('app.media.WeChat'),
      url:'pages/LoginPage'
    }

  ]

  build() {
    Row() {
      Column(){
        Row() {
          Text('消息')
            .fontSize(20)
        }
        .width('100%')
        .height('15%')
        .backgroundColor(Color.Red)
        .justifyContent(FlexAlign.Center)

        Row() {
          List(){
            ForEach(this.listData,(item:ItemType)=>{
              ListItem(){
                Row(){
                  Row({space:10}){
                    Image(item.img)
                      .width('22vp')
                      .height('22vp')
                    Text(item.title)
                      .fontSize('16vp')
                  }
                  //开关组件
                  Image($r('app.media.right'))
                    .width('22vp')
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
                .padding('12vp')
                .onClick(()=>{
                  router.pushUrl({
                    url:item.url
                  }).catch((error:Error)=>{
                    // 错误提示
                  })
                })
              }
              .height('50vp')
            })

          }
          .width('100%')
          .backgroundColor(Color.White)
          .divider({
            color:'#dddd',
            strokeWidth:'1vp',
            startMargin:'46vp',
            endMargin:'12vp'
          })


        }
        .width('100%')
        .height('85%')
        .padding({
          top:'5vp',
          bottom:'5vp',
          // right:'50vp'
        })
        .alignItems(VerticalAlign.Top)

      }
      .width('100%')
    }
    .height('100%')
    .width('100%')
    // .alignItems(VerticalAlign.Top)


  }
}