import router from '@ohos.router';
import {getUserTeacher} from '../../../api/axios'
import {getUserName} from '../../../utils/data'
@Entry
@Component
struct MyOrderPage {
  @State orders: Array<Order> = [
    { id: '1', title: '家教订单1', date: '2023-10-01', status: '进行中' },
  // 可以根据实际情况从后端获取订单数据
  ];
  @State private teacher: { id: number, name: string, subject: string, phone: string, describe: string, starttime: string, endtime: string } = {
    id: -1,
    name: '',
    subject: '',
    phone: '',
    describe: '',
    starttime: '',
    endtime: ''
  }
  async aboutToAppear() {
    let result = await getUserTeacher(getUserName());
    if(result.data){

      this.teacher = result.data;
    }else{

    }


    // console.log(JSON.stringify(this.teacher));
  }
  build() {

    // 判断 teacher.id 是否为 -1
    if (this.teacher.id === -1) {
      // 无预约老师时的显示内容lisi
      Column() {
        Text("暂无订单")
          .fontSize(20)
          .margin(10)
      }.justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center).height("90%")
    }else {

      Column() {
        // Row() {
        //   Image($r('app.media.left'))
        //     .width(25)
        //     .onClick(()=>{router.back()})
        //
        //   Text('我的订单')
        //     .fontSize(20)
        //     .margin({ left: 100 })
        // }
        // .width('100%')
        // .height('10%')
        // .backgroundColor('#FFD700')
        // .borderRadius(10)
        // .justifyContent(FlexAlign.Start)
        // .padding(10)

        Text('我的订单')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 20 })
        List({ space: 10 }) {

          ForEach(this.orders, (order) => {
            ListItem() {
              Column() {
                Row() {
                  Text('订单编号: ' + order.id)
                    .fontSize(20)
                  Text(order.date)
                    .fontSize(20)

                }

                Text('教师: ' + this.teacher.name)
                  .fontSize(18)
                  .margin({ top: 10 })
                Text('状态: ' + order.status)
                  .fontSize(18)
                  .margin({ top: 5 })
                Divider()
                  .margin({ top: 10, bottom: 10 })
              }
              .padding({ left: 20, right: 20, top: 10 })
              .backgroundColor(Color.Yellow)
              .borderRadius(10)
            }

          })


        }
        Button('返回', { type: ButtonType.Normal, stateEffect: true })
          .width('50%')
          .height(30)
          .borderRadius(25)
          .margin({ top: 20 })
          .onClick(() => {
            router.back()
          })
      }
      .padding({ left: 10, right: 10 })
      .height('100%')
      .backgroundColor('#F5F5F5')
    }
  }
}

type Order = {
  id: string;
  title: string;
  date: string;
  status: string;
};