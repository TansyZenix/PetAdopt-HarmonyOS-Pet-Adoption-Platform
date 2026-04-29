// PostPage.ets
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';

@Entry
@Component
struct PostPage {
  @State private inputText: string = '';
  @State private privacy: string = '公开';


  // 清空所有内容
  private clearContent() {
    this.inputText = '';
    // this.remindUsers = [];
    this.privacy = '公开';
  }

  build() {
    Column() {
      // 文本输入区域
      TextInput({ placeholder: '这一刻的想法...', text: this.inputText })
        .height(120)
        .width('90%')
        .fontSize(18)
        .onChange((value: string) => {
          this.inputText = value;
        })
      Divider().margin({ top: 10, bottom: 10 })

      // 位置信息
      Row() {
        Image($r('app.media.ic_location'))
          .width(20)
          .height(20)
          .margin({ right: 8 })
        Text('所在位置')
          .fontSize(16)
      }
      .width('90%')
      .padding(8)


      Divider().margin({ top: 10, bottom: 10 })

      // 提醒设置
      Row() {
        Image($r('app.media.ic_remind'))
          .width(20)
          .height(20)
          .margin({ right: 8 })
        Text('提醒谁看')
          .fontSize(16)
      }
      .width('90%')
      .padding(8)


      Divider().margin({ top: 10, bottom: 10 })

      // 隐私设置
      Row() {
        Image($r('app.media.ic_privacy'))
          .width(20)
          .height(20)
          .margin({ right: 8 })
        Text('谁可以看')
          .fontSize(16)
        Text(this.privacy)
          .fontSize(16)
          .fontColor(Color.Gray)
          .margin({ left: 16 })
      }
      .width('90%')
      .padding(8)

      // 底部操作栏
      Row() {
        Button('取消')
          .backgroundColor(Color.Transparent)
          .fontColor(Color.Black)
          .onClick(() => {
            if (this.inputText.trim().length > 0) {
              promptAction.showDialog({
                title: '确认取消',
                message: '当前内容尚未保存，确定要取消吗？',
                buttons: [
                  {
                    text: '继续编辑',
                    color: '#000000'
                  },
                  {
                    text: '确认取消',
                    color: '#007AFF',
                  }
                ]
              })
            } else {
              promptAction.showToast({
                message: '已取消发布',
                duration: 2000,
              }
              );
              router.back();
            }
          })

        Button('发布')
          .type(ButtonType.Capsule)
          .backgroundColor('#007AFF')
          .fontColor(Color.White)
          .margin({ left: 20 })
          .onClick(() => {
            if (this.inputText.trim().length > 0) {
              promptAction.showToast({
                message: '发布成功！',
                duration: 2000
              });
              this.clearContent();
              router.back();
            } else {
              promptAction.showToast({
                message: '请输入内容',
                duration: 2000
              });
            }
          })
      }
      .width('90%')
      .margin({ top: 30 })
      .justifyContent(FlexAlign.End)
    }
    .width('100%')
    .padding(10)
    .backgroundColor(Color.White)
  }
}