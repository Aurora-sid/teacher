import {ItemType} from '../../model/types'
@Component
export default struct list {
  @State message: string = '列表组件';
  private ListData:Array<ItemType> = [
    {
      title:'ad1',
      img:$r('app.media.L1')
    },
    {
      title:'ad2',
      img:$r('app.media.L2')
    },
    {
      title:'ad3',
      img:$r('app.media.L3')
    },
    {
      title:'ad4',
      img:$r('app.media.L4')
    },
    {
      title:'ad5',
      img:$r('app.media.L5')
    },
    {
      title:'ad6',
      img:$r('app.media.L6')
    },
    {
      title:'ad7',
      img:$r('app.media.L7')
    },
    {
      title:'ad8',
      img:$r('app.media.L8')
    },
  ];
  build() {
    Column() {
        Text('列表')
          .fontSize(15)
          .fontWeight(FontWeight.Medium)
          .alignSelf(ItemAlign.Start)
       List({space:12}){
        ForEach(this.ListData,(item:ItemType)=>{
          ListItem(){
            Image(item.img)
              .objectFit(ImageFit.Cover)
              .aspectRatio(2)
          }
          .margin({left:'5vp',right:'5vp'})
        })
      }
      .width('95%')
       //.margin()
      .lanes(2) // 一行中的个数
    }
  }
}