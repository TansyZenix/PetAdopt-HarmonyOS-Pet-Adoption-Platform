import router from '@ohos.router'
@Entry
@Component
struct MessagePage {
  @State currentIndex: number = 0
  @State tabsTitle: string[] = ['全部', '未读', '已读']

  build() {
    Column() {
      // 顶部导航栏
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())
        Text('通知')
          .fontSize(24)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
        Blank()
        Image($r('app.media.toolbar_more'))
          .width(24)
          .height(24)
          .margin({ right: 16 })
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)


      // 标签页
      Tabs({
        barPosition: BarPosition.Start,
        index: this.currentIndex
      }) {
        ForEach(this.tabsTitle, (item: string, index: number) => {
          TabContent() {
            if (this.isEmpty()) {
              this.EmptyState()
            }
          }
          .tabBar(this.TabBuilder(item, index))
        })
      }
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
  }

  @Builder
  TabBuilder(title: string, index: number) {
    Column() {
      Text(title)
        .fontColor(this.currentIndex === index ? '#FFD700' : '#666666')
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? FontWeight.Medium : FontWeight.Regular)
      if (this.currentIndex === index) {
        Divider()
          .width(24)
          .margin({ top: 4 })
          .color('#FFD700')
          .strokeWidth(2)
      }
    }
    .width('100%')
    .padding({ top: 12, bottom: 12 })
  }

  @Builder
  EmptyState() {
    Column() {
      Image($r('app.media.empty_icon'))
        .width(120)
        .height(120)
      Text('-- 空空如也 --')
        .fontSize(14)
        .fontColor('#999999')
        .margin({ top: 8 })
      Button('一键已读')
        .width('90%')
        .height(48)
        .backgroundColor('#FFD700')
        .fontColor('#000000')
        .position({ x: '5%', y: '80%' })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  isEmpty(): boolean {
    // 数据判空
    return true
  }
}