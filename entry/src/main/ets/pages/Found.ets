import { PostCard } from './components/Cards'
import router from '@ohos.router'


@Component
struct Found {
  @State bg_color: string = '#ffffffff'


  build() {
    // 顶部导航
    Tabs({ barPosition: BarPosition.Start }) {
      // TabContent的内容:关注、视频、游戏、数码、科技、体育、影视
      TabContent() {
        Scroll() {
          // 创建七个PostCard
          Column(){
            PostCard({title:'这是一个标题'})
            ForEach([1, 2, 3, 4, 5, 6, 7], () => {
              PostCard()
            })
          }
        }
      }.tabBar('广场')

      TabContent() {
        Text('百科').fontSize(30)
      }.tabBar('百科')
    }.scrollable(false)
  }
}

export { Found }