import {HomePage} from './Home'
import {Found} from './Found'

@Entry
@Component
struct SearchExample {


  build() {
    // 导航栏
    Tabs({ barPosition: BarPosition.End }) {

      // 首页内容
      TabContent() {
        HomePage()
      }
      .tabBar('首页')

      TabContent() {
        Found()
      }
      .tabBar('发现')

      TabContent() {
        Text('+').fontSize(30)
      }
      .tabBar('+')

      TabContent() {
        Text('收到的消息').fontSize(30)
      }
      .tabBar('消息')

      TabContent() {
        Text('我的内容').fontSize(30)
      }
      .tabBar("我的")
    }

  }
}
