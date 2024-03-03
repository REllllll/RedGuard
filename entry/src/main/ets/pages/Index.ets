//滑块试图容器数据源类
class MyDataSource implements IDataSource {
  private list: number[] = []
  private listener: DataChangeListener

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct SearchExample {
  // 搜索栏内容变量
  @State inputValue: string = ''
  // 点击搜索后传递到的变量
  @State getValue: string = ''
  // 搜索栏控制器
  controller: SearchController = new SearchController()

  // 轮播组件控制器
  private swiperController: SwiperController = new SwiperController()
  // 轮播数据源
  private data: MyDataSource = new MyDataSource([])
  // 处理轮播数据
  aboutToAppear(): void {
    let list = []
    for (var i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
  }

  build() {
    // 导航栏
    Tabs({ barPosition: BarPosition.End }) {

      // 首页内容
      TabContent() {

        // 整个页面为从上到下的多行，故采用列组件
        Column() {

          // 搜索栏
          Search({ value: this.inputValue, placeholder: '在此进行搜索...', controller: this.controller })
            .searchButton('搜索')
            .width('88%')
            .height(40)
            .backgroundColor('#F5F5F5')
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .textFont({ size: 14, weight: 400 })
              // 当搜索被按下时执行
            .onSubmit((value: string) => {
              this.getValue = value
            })
            .margin(20)

          // 轮播图
          Swiper(this.swiperController) {
            LazyForEach(this.data, (item: string) => {
              Text(item)
                .width('90%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            }, item => item)
          }
          .cachedCount(2)
          .index(1)
          .autoPlay(true)
          .interval(4000)
          .indicator(true)
          .loop(true)
          .duration(1000)
          .itemSpace(0)
          .curve(Curve.Linear)
          .onChange((index: number) => {
            console.info(index.toString())
          })

          // 分栏
          Row() {
            Button('记录血压')
              .onClick(() => {
                // 记录血压功能
              })
              .width('18%')
              .height('8%')
              .margin(2)

            Button('记录心率')
              .onClick(() => {
                // 记录心率功能
              })
              .width('18%')
              .height('8%')
              .margin(2)

            Button('记录体重')
              .onClick(() => {
                // 记录体重功能
              })
              .width('18%')
              .height('8%')
              .margin(2)

            Button('记录血糖')
              .onClick(() => {
                // 记录血糖功能
              })
              .width('18%')
              .height('8%')
              .margin(2)

            Button('冥想')
              .onClick(() => {
                // 进入冥想页面
              })
              .width('18%')
              .height('8%')
              .margin(2)

          }.margin(10)

          // 数据展示1
          Row() {
            // 左1
            Column() {
              Text('今日血压')
              Text('收缩压: 120mmHo')
              Text('舒张压: 76mmHg')
              Text('状态:正常')
              Text('本周平均:')
              Text('118/78 mmHg')
            }.margin(10)

            // 右1
            Column() {
              Text('今日心率')
              Text('每分钟跳动次数:')
              Text('74次')
              Text('状态:正常')
              Text('本周平均:')
              Text('69次')
            }.margin(10)

          }.margin(10)

          // 数据展示2
          Column() {
            // 下1
            Row() {
              Column() {
                Text('BMI指数')
                Text('19.1')
              }.margin(25)

              Column() {
                Text('今日体重')
                Text('62.7kg')
              }.margin(25)
            }.margin(10)

            // 下2
            Row() {
              Column() {
                Text('今日血糖')
                Text('空腹: 6.26mmol/L')
              }.margin(25)

              Column() {
                Text('状态:偏高')
                Text('餐后: 7.2mmol/L')
              }.margin(25)
            }.margin(10)

          }
        }
      }
      .tabBar('首页')

      TabContent() {

        // 顶部导航
        Tabs({ barPosition: BarPosition.Start }) {
          // TabContent的内容:关注、视频、游戏、数码、科技、体育、影视
          TabContent() {
            Text('广场').fontSize(30)
          }.tabBar('广场')

          TabContent() {
            Text('百科').fontSize(30)
          }.tabBar('百科')
        }.scrollable(false)

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
