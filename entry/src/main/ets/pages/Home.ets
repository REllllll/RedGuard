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

@Component
struct HomePage {
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
    // 整个页面为从上到下的多行，故采用列组件
    Column() {

      // 搜索栏
      Search({ value: this.inputValue, placeholder: '在此进行搜索...', controller: this.controller })
        .searchButton('搜索')
        .width(357)
        .height(48)
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
            .width(327)
            .height(151)
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

      // 按钮栏（图片）
      Row() {
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r("app.media.fa5_heartbeat_fas")).width(24).height(24)
          }.alignItems(VerticalAlign.Center)
        }.backgroundColor(0xffffff).width(24).height(24).margin({ right: 25 })

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r("app.media.fa5_stethoscope_fas")).width(24).height(24)
          }.alignItems(VerticalAlign.Center)
        }.backgroundColor(0xffffff).width(24).height(24).margin({ left: 25, right: 25 })

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r("app.media.iconpark_balance_one")).width(24).height(24)
          }.alignItems(VerticalAlign.Center)
        }.backgroundColor(0xffffff).width(24).height(24).margin({ left: 25, right: 25 })

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r("app.media.iconpark_medical_files")).width(24).height(24)
          }.alignItems(VerticalAlign.Center)
        }.backgroundColor(0xffffff).width(24).height(24).margin({ left: 25, right: 25 })

        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            Image($r("app.media.fa5_street_view_fas")).width(24).height(24)
          }.alignItems(VerticalAlign.Center)
        }.backgroundColor(0xffffff).width(24).height(24).margin({ left: 25 })

      }.margin({ top: 24 })

      // 按钮文字栏
      Row() {
        Text('记录血压').width(75).height(20).margin({ left: 15 })
        Text('记录心率').width(75).height(20)
        Text('记录体重').width(75).height(20)
        Text('记录血糖').width(75).height(20)
        Text('   冥想').width(75).height(20)
      }.margin({ top: 15 })

      // 分割线（分割线上面是功能区，下面是数据区）
      Divider().strokeWidth(4).color('#F1F3F5').margin({ top: 10 })

      // 数据展示1
      Row() {
        // 左1
        Column() {
          Row(){
            Text('今日血压').width(80).height(24).margin({ top: 13, left: 13 })

          }

          Text('收缩压: 120mmHo')
          Text('舒张压: 76mmHg')
          Text('状态:正常')
          Text('本周平均:')
          Text('118/78 mmHg')
        }
        .alignItems(HorizontalAlign.Start)
        .backgroundColor(0x4095E5)
        .borderRadius(20)
        .width(172)
        .height(180)
        .margin({ right: 5 })

        // 右1
        Column() {
          Text('今日心率')
          Text('每分钟跳动次数:')
          Text('74次')
          Text('状态:正常')
          Text('本周平均:')
          Text('69次')
        }
        .alignItems(HorizontalAlign.Start)
        .backgroundColor(0x377F7F)
        .borderRadius(20)
        .width(172)
        .height(180)
        .margin({ left: 5 })

      }.margin({ top: 21 })

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
}

export { HomePage }