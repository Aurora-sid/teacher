import {ItemType} from '../../model/types'
@Component
export default struct list {
  @State message: string = '列表组件';
  private ListData:Array<ItemType> = [
    {
      title:'techer',
      img:$r('app.media.ome_icon')
    },
    {
      title:'techer',
      img:$r('app.media.ome_icon')
    },
    {
      title:'techer',
      img:$r('app.media.ome_icon')
    },
    {
      title:'techer',
      img:$r('app.media.ome_icon')
    },
    {
      title:'techer',
      img:$r('app.media.ome_icon')
    },
    {
      title:'techer',
      img:$r('app.media.ome_icon')
    },
    {
      title:'techer',
      img:$r('app.media.ome_icon')
    },
    {
      title:'techer',
      img:$r('app.media.ome_icon')
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