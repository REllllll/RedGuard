import { Navbar } from './components/NavBar';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('jump to login page')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/login'
            }, router.RouterMode.Single)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}