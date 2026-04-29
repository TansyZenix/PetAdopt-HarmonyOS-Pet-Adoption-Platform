import router from '@ohos.router'
import { get } from '../../../services/request'
import {banned_list,iResponseModel} from '../../../types/index'

@Entry
@Component
struct Detail_banned_list_page {
  @State message: string = 'Hello World';
  @State res:iResponseModel<banned_list[]> ={code:0,message:''};
  @State wechatName:string='';

  async aboutToAppear() {
    let params: object = router.getParams()
    if (params['name']) {
      this.wechatName = params['name']
      console.log('',this.wechatName);
      console.log(`/banned_lists/getbyName?wechatName=${this.wechatName}`)
      let result = await get(`/banned_lists/getbyName?wechatName=${this.wechatName}`)
      this.res = JSON.parse(result);
      console.log('',this.res.message);
    }
  }

  build() {
    Column() {
      // Button('返回')
      //   .width(120)
      //   .height(40)
      //   .margin({ top: 16, bottom: 16 })
      //   .onClick(() => {
      //     router.back({
      //       url:'pages/my_project/account/BlacklistPage',
      //     })
      //   })
      Row({ space: 12 }) {
        Image($r('app.media.ic_back'))
          .width(24)
          .height(24)
          .onClick(() => router.back())
        Text('帖子')
          .fontSize(24)
          .fontColor('#2D4B6D')
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xFFFFFF)
      Column() {
        ForEach(this.res.data,(item:banned_list,index:number)=>{
          Column() {
            Column() {
              Text('基本信息')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 12 })

              Row() {
                Text('微信名称：')
                  .fontWeight(FontWeight.Medium)
                Text(`${item.wechat_name}`)
              }
              .margin({ bottom: 8 })

              Row() {
                Text('微信号：')
                  .fontWeight(FontWeight.Medium)
                Text(`${item.wechat_id}`)
              }
              .margin({ bottom: 8 })

              Row() {
                Text('电话：')
                  .fontWeight(FontWeight.Medium)
                Text(`${item.tel}`)
              }
              .margin({ bottom: 8 })
            }
            .padding(16)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .margin({ bottom: 16 })

            Column() {
              Text('详细信息')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 12 })

              Row() {
                Text('姓名：')
                  .fontWeight(FontWeight.Medium)
                Text(`${item.detail_name}`)
              }
              .margin({ bottom: 8 })

              Row() {
                Text('性别：')
                  .fontWeight(FontWeight.Medium)
                Text(`${item.detail_sex}`)
              }
              .margin({ bottom: 8 })
            }
            .padding(16)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
            .margin({ bottom: 16 })

            Column() {
              Text('举报信息')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 12 })

              Row() {
                Text('举报原因：')
                  .fontWeight(FontWeight.Medium)
                Text(`${item.report_reason}`)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }
              .margin({ bottom: 8 })

              Row() {
                Text('举报证据：')
                  .fontWeight(FontWeight.Medium)
                Text(`${item.report_evidence}`)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }
            }
            .padding(16)
            .backgroundColor('#F5F5F5')
            .borderRadius(8)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)
          .margin({ bottom: 16 })
          .shadow({ radius: 8, color: '#1A000000', offsetY: 2 })
        })
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}