// pages/ServiceAccountPage.ets
import router from '@ohos.router';

@Entry
@Component
struct ServiceAccountPage {
  build() {
    Column() {
      // 标题栏
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())

        Text('关注服务号')
          .fontSize(24)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)

      // 内容区域
      Scroll() {
        Text('这里是关注服务号的具体内容...')
          .fontSize(16)
          .fontColor(0x333333)
          .padding(16)
      }
      .flexGrow(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }
}