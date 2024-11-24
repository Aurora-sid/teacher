import router from '@ohos.router';
import MineUser from './components/MineUser'
import MineList from './components/MineList'
import trap from './components/trap';
import ListExample from './components/ListExample'
import promptAction from '@ohos.promptAction';
import {getTeacherList,setTeacherState,setUserTeacher} from '../../api/axios'
import {getUserName} from '../../utils/data'
import resourceManager from '@ohos.resourceManager';
@Component
export default struct Teacher {
  @State message: string = '名师';
  @State teacherList:Array<{id:number,name:string,phone:string,subject:string,starttime:string,endtime:string,describe:string,state:string,price:string}> =[
   {"id":1,"name":"王老师","phone":"15161353301","subject":"语文","starttime":"6：00","endtime":"12：00","describe":"毕业于北京大学，拥有20年教学经验","state":"繁忙","price":"300"},
 {"id":2,"name":"许老师","phone":"87696009","subject":"数学","starttime":null,"endtime":null,"describe":"毕业于北京大学，拥有10年的教学经验","state":"空闲","price":"400"},
 {"id":3,"name":"张老师","phone":"333666","subject":"英语","starttime":null,"endtime":null,"describe":"初中毕业，有2年代课经验","state":"空闲","price":"30"},
 {"id":4,"name":"李老师","phone":"5556662","subject":"数学","starttime":null,"endtime":null,"describe":"毕业于江苏大学，有10年教学经验","state":"空闲","price":"100"}
 ]
  @State imgList:Array<{url:Resource}> = [
    {url:$r('app.media.T')},
    {url:$r('app.media.T2')},
    {url:$r('app.media.T3')},
    {url:$r('app.media.T4')},
    {url:$r('app.media.T5')},
    {url:$r('app.media.T6')},
    {url:$r('app.media.T6')},
    {url:$r('app.media.T6')},
    {url:$r('app.media.T6')},
    {url:$r('app.media.T6')},
    {url:$r('app.media.T6')}
  ]
  async aboutToAppear(){
    let result =  await getTeacherList();
    this.teacherList = result.data
  }
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
    setTeacherState(this.teacherName,startTime,endTime,"繁忙")
    await setUserTeacher(getUserName(),this.teacherName)
    let result =  await getTeacherList();
    this.teacherList = result.data
  }
  build() {
    Column() {
      Row() {
        Text("在线教师")
         .fontSize(20)
         .fontWeight(FontWeight.Bold)
         .textAlign(TextAlign.Center)
         .width('100%')
         .height('8%')
          .borderRadius(10)
         .backgroundColor('#FCE4EC')
      }
      List({space:12}){
        ForEach(this.teacherList,(item:{name:string,phone:string,subject:string,describe:string,state:string,price:string,icon:string},index:number)=>{
          ListItem(){
              Column(){
                Row(){
                  Image(this.imgList[index].url).width("50%").height("100%").backgroundColor(Color.Pink)
                  Column(){
                    Text("姓名: "+item.name)
                      .fontSize(15)
                    Text("学科: "+item.subject)
                      .fontSize(15)
                    Text("电话: "+item.phone)
                      .fontSize(15)
                    Text("价格: "+item.price+"元/小时")
                      .fontSize(15)
                    Text("状态: "+item.state)
                      .fontSize(15)
                  }.width("60%").alignItems(HorizontalAlign.Start)
                }.height("70%")
                Text(item.describe).backgroundColor('#ADD8E6').padding(2)
              }.width("100%")
          }
          .height(220)
          .width("100%")
          .borderRadius(10)
          .backgroundColor('#F5FFFA')
          .onClick(()=>{
            if(item.state === "繁忙"){
              promptAction.showToast({
                message: '老师繁忙中',
                duration: 2000,
                bottom: 50
              });
            }else{
              this.teacherName = item.name
              // 打开自定义弹窗
              this.dialogController.open()
            }

          })
        })
      }
      //.margin()
      .lanes(2) // 一行中的个数
      .height('100%')
      .width('100%')
      .padding(10)
      .backgroundColor('#F8F8FF')
      .alignListItem(ListItemAlign.Center)

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f1f3f5')

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

        Column({ space: 20 }) {
          Text('你确定要预约这个老师吗')
            .fontSize(20)
          // TextInput({ placeholder: "请输入数字" })
          //   .type(InputType.Number)
          //   .onChange((value: string) => {
          //     this.answer = value
          //   })
          Row() {
            Text('选择开始时间：')
              .fontSize(16)
              .width('40%')
                //.margin({ top: 8, left: 10 })
              .textAlign(TextAlign.Center)
            Column() {
              Select([{ value: '1:00' }, { value: '2:00' }, { value: '3:00' }, { value: '4:00' },
                { value: '5:00' }, { value: '6:00' }, { value: '7:00' }, { value: '8:00' },
                { value: '9:00' }, { value: '10:00' }, { value: '11:00' }, { value: '12:00' }, { value: '13:00' }, {
                  value: '14:00'
                }
                , { value: '15:00' }, { value: '16:00' }, { value: '17:00' }, { value: '18:00' }, { value: '19:00' },
                { value: '20:00' }, { value: '21:00' }, { value: '22:00' }, { value: '23:00' }, { value: '24:00' }
              ])
                .selected(8)
                .value('请选择')
                .font({ size: 16, weight: 500 })
                .fontColor('#182431')
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 16, weight: 400 })
                .onSelect((index: number, value: string) => {
                  // console.info('Select:' + index)
                  this.startTime = value

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
            Text('选择结束时间：')
              .fontSize(16)
              .width('40%')
                //.margin({ top: 8, left: 10 })
              .textAlign(TextAlign.Center)
            Column() {
              Select([{ value: '1:00' }, { value: '2:00' }, { value: '3:00' }, { value: '4:00' },
                { value: '5:00' }, { value: '6:00' }, { value: '7:00' }, { value: '8:00' },
                { value: '9:00' }, { value: '10:00' }, { value: '11:00' }, { value: '12:00' }, { value: '13:00' }, {
                  value: '14:00'
                }
                , { value: '15:00' }, { value: '16:00' }, { value: '17:00' }, { value: '18:00' }, { value: '19:00' },
                { value: '20:00' }, { value: '21:00' }, { value: '22:00' }, { value: '23:00' }, { value: '24:00' }
              ])
                .selected(8)
                .value('请选择')
                .font({ size: 16, weight: 500 })
                .fontColor('#182431')
                .selectedOptionFont({ size: 16, weight: 400 })
                .optionFont({ size: 16, weight: 400 })
                .onSelect((index: number, value: string) => {
                  //console.info('Select:' + index)
                  this.endTime = value
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
          .backgroundColor('#F5F5F5')
          .margin({ top: 15 })

          Row({ space: 40 }) {
            Button('取消')
              .onClick(() => {
                // 关闭弹窗
                this.controller.close()
              })
            Button('确定')
              .onClick(() => {
                // 关闭弹窗
                this.controller.close()
                // 确认按钮回调函数
                this.confirm(this.startTime, this.endTime)
              })
          }
        }.padding(20)
      }
    }
  }}