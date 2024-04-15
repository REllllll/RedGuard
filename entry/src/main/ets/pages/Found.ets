import { PostCard } from './components/Cards'
import { User } from '../models/auth'


@Component
struct Found {
  build() {
    // 顶部导航
    Tabs({ barPosition: BarPosition.Start }) {
      // TabContent的内容:关注、视频、游戏、数码、科技、体育、影视
      TabContent() {
        Scroll() {
          // 创建七个PostCard
          Column(){
            ForEach([1, 2, 3, 4, 5, 6, 7], (i) => {
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