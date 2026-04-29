import router from '@ohos.router';
import { get } from '../../../services/request'
import {hospital,iResponseModel} from '../../../types/index'

@Entry
@Component
struct CooperativeHospital {
  @State res:iResponseModel<hospital[]> ={code:0,message:''};

  async aboutToAppear() {
    let result = await get(`/hospital`)
    this.res = JSON.parse(result);
    // console.log('',this.res.message);
  }

  build() {
    Column(){
      // 顶部导航栏
      Row() {
        Image($r('app.media.back')).width(30).height(30) // 返回按钮
        Text('合作医院')
          .fontSize(20)
          .margin({ left: 115 })
      }
      .onClick(()=>{
        router.back();
      })
      .width('100%')
      .height(50)
      Row() {
        Row(){
          Image($r('app.media.research2line')).width(15).height(15)
          Text('搜索').fontSize(15)
        }

      }.width('100%')
      .padding(5)
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor('#F5F5F5')
      .borderRadius(20)
      Text().width('100%').height(10).backgroundColor('#F5F5F5').margin(10)

      if (this.res.code != 0) {
        if (this.res.data?.length != 0) {
          ForEach(this.res.data, (item: hospital, index: number) => {
            Row(){
              Image(item.picture).width(50).height(50).borderRadius(25)
              Column(){
                Text(item.text1)
                  .fontSize(18)
                  .margin({bottom:5})
                // Row(){
                Text(item.text2)
                  .fontSize(12)
                  .padding(2)
                  .fontColor(Color.Gray)
                // }

              }.alignItems(HorizontalAlign.Start)
              Column(){
                Text(item.text3).fontSize(15).fontWeight(700).padding(10).backgroundColor('#FFF700').borderRadius(20)
              }



            }.width('100%')
            .margin({bottom:10})
            .justifyContent(FlexAlign.SpaceAround)

            Text().width('100%').height(10).backgroundColor('#F5F5F5').margin(5)
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
      Text('没有更多了').fontColor(Color.Gray).fontSize(10)

    }
  }
}