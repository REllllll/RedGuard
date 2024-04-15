import {NormalEntry} from './components/NormalEntry'

@Preview
@Component
struct Me {
  build() {
    Column({space:10}) {
      Row() {
        GridRow() {
          GridCol({ span: 3 }) {
            Stack() {
              Shape() {
                Circle({ width: 57, height: 57 })
                  .fill('white')
              }

              Shape() {
                Circle({ width: 54, height: 54 })
                  .fill('#ffa0a0a0')
              }

              Image($r('app.media.avatar'))
                .width(54)
                .height(54)
                .clip(new Circle({ width: 54, height: 54 }))
            }.height('100%').align(Alignment.Center)
          }


          GridCol({ span: 7 }) {
            Stack() {
              Column({ space: 5 }) {
                Text('Sytles')
                  .fontSize(20)
                  .fontColor('white')
                  .fontWeight('bold')
                Row({ space: 10 }) {
                  Text('年龄: 19')
                    .fontSize(16)
                    .fontColor('white')
                    .fontWeight('bold')
                  Image($r('app.media.sex_icon'))
                    .width(16)
                    .height(16)
                }

                Button('资料管理')
                  .fontSize(14)
                  .height(25)
                  .width(104)
                  .border({ color: 'white', width: 1 })

              }
            }.height('100%').width('100%').align(Alignment.Start) // 左对齐
          }

          GridCol({ span: 2 }) {
            Stack() {
              Image($r('app.media.setting_icon'))
                .width(20)
                .height(20)
                .offset({y:16,x:20})  // 偏移
            }.height('100%')
            .align(Alignment.Top)  // 顶部对齐
          }
        }
      }.backgroundColor('#ff1a8af3').height(146).width('100%').padding({ left: 20, right: 20 })



      // 入口组
      Column() {
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
        NormalEntry({ head_icon: $r('app.media.star'), title: '血液检测记录' })
      }

    }.height('100%').width('100%')
  }
}


export { Me }