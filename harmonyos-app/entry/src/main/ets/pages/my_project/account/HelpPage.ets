import router from '@ohos.router';

@Entry
@Component
struct HelpAndFeedbackPage {
  @State title: string = '帮助与反馈';
  @State isExpanded: boolean = false;

  build() {
    Column() {
      // 顶部栏
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())
        Text('商城')
          .fontSize(24)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)

      // 帮助与反馈栏
      Row({ space: 12 }) {
        Text(this.title)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.isExpanded = !this.isExpanded;
          })
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)

      // 展开的内容
      if (this.isExpanded) {
        Column() {
          Text('这里是帮助与反馈的详细信息。')
            .fontSize(16)
            .fontColor(0x666666)
            .margin({ top: 10, bottom: 10 });
          // 你可以在这里添加更多的内容
        }
        .width('100%')
        .padding(16)
        .backgroundColor(0xF5F5F5)
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center);
  }
}