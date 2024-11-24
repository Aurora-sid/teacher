import router from '@ohos.router';


@Entry
@Component
struct MyOrderPage {
  @State orders: Array<Order> = [
    { id: '1', title: '家教订单1', date: '2023-10-01', status: '已完成' },
    { id: '2', title: '家教订单2', date: '2023-10-05', status: '进行中' },
  // 可以根据实际情况从后端获取订单数据
  ];

  build() {
    Column() {
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

              Text('标题: ' + order.title)
                .fontSize(18)
                .margin({ top: 10 })
              Text('状态: ' + order.status)
                .fontSize(18)
                .margin({ top: 5 })
              Divider()
                .margin({ top: 10, bottom: 10 })
            }
            .padding({ left: 20, right: 20 ,top:10})
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

type Order = {
  id: string;
  title: string;
  date: string;
  status: string;
};