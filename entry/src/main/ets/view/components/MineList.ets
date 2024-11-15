import {ItemType} from '../../model/types'
import promptAction from '@ohos.promptAction'; // 弹窗
import router from '@ohos.router';
@Component
export default struct MineList {
  @State message: string = '我的列表';
  private listData : Array<ItemType> = [
    {
      title:'消息推送',
      img:$r('app.media.messagePush'),
      url:'pages/LoginPage'
    },
    {
      title:'我的老师',
      img:$r('app.media.myTeacher'),
      url:'pages/MinePages/MyTeacherPage'
    },{
    title:'我的评价',
    img:$r('app.media.evalution'),
    url:'pages/MinePages/MyTeacher'
  },
    {
      title:'我的回答',
      img:$r('app.media.answer'),
      url:'pages/MinePages/MyTeacher'
    },
    {
      title:'我的课程',
      img:$r('app.media.subject'),
      url:'pages/MinePages/MyTeacher'
    },
    {
      title:'学习计划与总结',
      img:$r('app.media.studyPlan'),
      url:'pages/MinePages/MyTeacher'
    },
    {
      title:'设置',
      img:$r('app.media.settings'),
      url:'pages/MinePages/MyTeacher'
    }
  ]
  build() {
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
            Image($r('app.media.right'))
              .width('22vp')
            //开关组件
            // Toggle({type:ToggleType.Switch,isOn:false}) // 多种类型  // isOn默认状态
            //   .onChange((isChange:Boolean)=>{
            //     //开或关的状态
            //     let tip:string = isChange?'系统选项打开':'功能关闭'
            //     promptAction.showToast({
            //       message:tip,
            //       duration:3000
            //     })
            //   })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding('12vp')
          .onClick(()=>{
            router.pushUrl({
              url:item.url
            }).catch((error:Error)=>{

            })
          })

        }
        .height('50vp')
      })
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius('30vp')
    .padding({
      top:'5vp',
      bottom:'5vp',
     // right:'50vp'
    })
    .divider({
      color:'#dddd',
      strokeWidth:'1vp',
      startMargin:'46vp',
      endMargin:'12vp'
    })
  }
}