import router from '@ohos.router'
import { get } from '../../../services/request'
import { banned_list, iResponseModel } from '../../../types/index'

@Entry
@Component
export struct BlacklistPage {
  @State res: iResponseModel<banned_list[]> = { code: 0, message: '' };
  @State wechatName: string = 'a';

  async aboutToAppear() {
    let result = await get(`/banned_lists/getAll`)
    this.res = JSON.parse(result);
    console.log('', this.res);
  }

  build() {
    Column() {
      // 标题栏
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())

        Text('黑名单')
          .fontSize(24)
          .fontColor(0x333333)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)
      .shadow({ radius: 4, color: 0x000000, offsetX: 0, offsetY: 2 })

      // 内容区域
      Scroll() {
        Column() {
          if (this.res.code != 0) {
            if (this.res.data?.length != 0) {
              ForEach(this.res.data, (item: banned_list, index: number) => {
                Row({ space: 4 }) {
                  Column({ space: 4 }) {
                    Text(`${item.wechat_name}`)
                      .fontSize(18)
                      .fontColor(0x333333)
                      .fontWeight(FontWeight.Bold)
                    Text(`${item.tel}`)
                      .fontSize(14)
                      .fontColor(0x666666)
                  }
                  .flexGrow(1)
                  .alignItems(HorizontalAlign.Start)

                  Text(`${item.report_reason}`)
                    .fontSize(14)
                    .fontColor(0x666666)
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .flexGrow(2)
                    .textAlign(TextAlign.Start)

                  Button('详情')
                    .fontSize(14)
                    .fontColor(0xFFFFFF)
                    .backgroundColor(0x007AFF)
                    .padding(8)
                    .borderRadius(4)
                    .onClick(() => {
                      router.pushUrl({
                        url: 'pages/my_project/account/detail_banned_list_page',
                        params: {
                          name: `${item.wechat_name}`,
                        }
                      })
                    })
                }
                .width('100%')
                .padding(16)
                .backgroundColor(0xFFFFFF)
                .borderRadius(8)
                .border({ width: 1, color: 0xE0E0E0, style: BorderStyle.Solid })
                .shadow({ radius: 2, color: 0x000000, offsetX: 0, offsetY: 1 })
                .margin({ bottom: 8 })
                .alignItems(VerticalAlign.Center)
              })
            } else {
              Text('没有数据')
                .fontSize(16)
                .fontColor(0x666666)
                .textAlign(TextAlign.Center)
                .width('100%')
                .padding(16)
            }
          }
        }
        .padding(16)
      }
      .flexGrow(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }
}