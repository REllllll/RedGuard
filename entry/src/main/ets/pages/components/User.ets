
import { User } from '../../models/auth'

// Create a test User
let user = new User('Bob', 'male', $r('app.media.love'), '杭州市', 24)

@Extend(Text) function smallNumber() {
  .fontSize(10)
}

@Preview
@Component
struct NormalUserInfo {
  @State user: User = user


  // default gender background color
  private female_bg_color: string = '#FFC0CB'
  private male_bg_color: string = '#87CEFA'


  build() {
    Row() {
      // User avatar
      Image(this.user.getAvatar())
        .height(40)
        .width(40)
        .clip(new Circle({ width: 40, height: 40 }))
        .margin(5)

      Column() {

        // User name and age
        Row({ space: 5 }) {
          Text(this.user.getName())
            .fontSize(16)
            .fontWeight('bold')
          if (this.user.getSex() === 'male') {
            Stack() {
              Text('♂' + String(this.user.getAge()))
                .smallNumber()
            }.backgroundColor(this.male_bg_color).borderRadius(5).padding(2)
          } else {
            Stack() {
              Text('♀' + String(this.user.getAge()))
                .smallNumber()
            }.backgroundColor(this.female_bg_color).borderRadius(5).padding(2)
          }
        }

        // User location
        Text(this.user.getLocation())
          .fontSize(12)
          .fontColor('#808080')
      }
    }
  }
}

export { NormalUserInfo}