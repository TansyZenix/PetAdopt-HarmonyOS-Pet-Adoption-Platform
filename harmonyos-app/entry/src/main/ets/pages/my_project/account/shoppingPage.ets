import { StartOptions } from '@kit.AbilityKit';
import router from '@ohos.router'
import { get } from '../../../services/request'
import {shop_list,iResponseModel} from '../../../types/index'

@Entry
@Component
struct ShoppingPage {
  @State res:iResponseModel<shop_list[]> ={code:0,message:''};

  async aboutToAppear() {
      let result = await get(`/shop`)
      this.res = JSON.parse(result);
      // console.log('',this.res.message);
  }

  build() {
    Scroll(){
      Column() {
        //header
        Row() {
          Image($r('app.media.ic_back'))
            .width(20)
            .height(20)
            .padding({left:10})
            .onClick(()=>{
              router.back();
            })
          Text('商城')
          Image('https://s1.aigei.com/src/img/png/9f/9fe49e97e43c47dba9bd1a12930c7d78.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:Rjj2xWzEmad-s2U8W8E_GetVSO0=')
            .width(30)
            .height(30)

        }.width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        if (this.res.code != 0) {
          if (this.res.data?.length != 0) {
            ForEach(this.res.data, (item: shop_list, index: number) => {
              Row() {
                Image(`${item.url}`)
                  .width(130)
                  .height(130)

                //商品名，价格
                Column() {
                  Text(`${item.name}`)
                  Text(`${item.price}`)
                }.height(130)
                .width(180)
                .alignItems(HorizontalAlign.Start)

                //删除与添加
                Column() {
                  //Image('https://s1.chu0.com/src/img/png/9a/9a4e40cd225348d78ec7b79058b4e2e8.png?e=2051020800&token=1srnZGLKZ0Aqlz6dk7yF4SkiYf4eP-YrEOdM1sob:gPjXRZZ-M_s1tDGShJq04RqUcN8=').width(25).height(25)
                  Image('https://s1.aigei.com/src/img/png/8f/8f9f0dd3275d4037a4c752ee261414a3.png?imageMogr2/auto-orient/thumbnail/!282x282r/gravity/Center/crop/282x282/quality/85/%7CimageView2/2/w/282&e=2051020800&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:77WauwZgY7o-_ugUz_LmePIf8f0=')
                    .width(25)
                    .height(25)
                }.height(130).justifyContent(FlexAlign.SpaceBetween)
              }.justifyContent(FlexAlign.SpaceBetween)
              .width('100%')
              .padding({ top: 15, bottom: 15 })
              .border({ width: { bottom: 1 } })
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
      .width('100%')
      .padding(({ left: 10, right: 10 }))
    }

  }
}