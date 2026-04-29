import router from '@ohos.router'
import prompt from '@ohos.prompt'

// 定义输入配置接口
interface InputConfig {
  titlePlaceholder: string
  contentPlaceholder: string
  contentHeight: number
}

@Entry
@Component
struct PostMessage {
  @State selectedCategory: string = '讨论/科普'
  @State title: string = ''
  @State content: string = ''
  @State isAgreed: boolean = false

  // 根据分类获取输入框配置
  private getInputConfig(): InputConfig {
    switch (this.selectedCategory) {
      case '讨论/科普':
        return {
          titlePlaceholder: '请输入标题',
          contentPlaceholder: '请输入讨论内容或科普知识',
          contentHeight: 200
        }
      case '救助':
        return {
          titlePlaceholder: '请输入救助标题',
          contentPlaceholder: '请详细描述救助对象、地点、时间和联系方式',
          contentHeight: 250
        }
      case '晒照':
        return {
          titlePlaceholder: '请输入照片描述',
          contentPlaceholder: '请描述照片内容、拍摄地点和时间',
          contentHeight: 150
        }
      case '闲置':
        return {
          titlePlaceholder: '请输入物品名称',
          contentPlaceholder: '请描述物品状态、价格和交易方式',
          contentHeight: 180
        }
      default:
        return {
          titlePlaceholder: '请输入标题',
          contentPlaceholder: '请输入内容',
          contentHeight: 200
        }
    }
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        // Image($r('app.media.ic_back'))
        //   .width(24)
        //   .height(24)
        //   .margin({ left: 16 })
        //   .onClick(() => {
        //     router.back()
        //   })
        Image($r('app.media.ic_back')).height(30).width(30).padding({left:10,bottom:2})
          .onClick(()=>{
            router.back();
          })
        Text('发帖')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 16 })
        Blank()
        Image($r('app.media.more'))
          .width(120)
          .height(24)
          .margin({ right: 32 })
      }
      .width('100%')
      .height(56)
      .backgroundColor(Color.White)

      // 分类选择
      Column() {
        Text('分类')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 16, top: 16 })
        Row() {
          ForEach(['讨论/科普', '救助', '晒照', '闲置'], (category: string) => {
            Text(category)
              .fontSize(14)
              .backgroundColor(this.selectedCategory === category ? '#FFD700' : '#F5F5F5')
              .padding({ left: 16, right: 16, top: 8, bottom: 8 })
              .margin({ right: 8 })
              .borderRadius(16)
              .onClick(() => {
                this.selectedCategory = category
              })
          })
        }
        .margin({ left: 16, top: 8 })
      }

      // 标题输入
      TextInput({ text: this.title, placeholder: this.getInputConfig().titlePlaceholder })
        .width('90%')
        .height(48)
        .margin({ top: 16 })
        .onChange((value: string) => {
          this.title = value
        })

      // 正文输入
      TextArea({ text: this.content, placeholder: this.getInputConfig().contentPlaceholder })
        .width('90%')
        .height(this.getInputConfig().contentHeight)
        .margin({ top: 16 })
        .onChange((value: string) => {
          this.content = value
        })

      // 图片上传区域
      Column() {
        Text('图片')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 16, top: 16 })
        Image($r('app.media.add_photo'))
          .width(80)
          .height(80)
          .margin({ left: 16, top: 8 })
      }

      // 底部发布按钮
      Button('发布')
        .width('90%')
        .height(48)
        .backgroundColor('#FFD700')
        .margin({ top: 32 })
        .onClick(() => {
          if (!this.isAgreed) {
            prompt.showToast({
              message: '请先同意用户协议'
            })
            return
          }
          // TODO: 处理发布逻辑
          prompt.showToast({message:"发布成功"})
          router.back();
        })

      // 用户协议
      Row() {
        Checkbox()
          .select(this.isAgreed)
          .onChange((value: boolean) => {
            this.isAgreed = value
          })
          .margin({ right: 8 })
        Text() {
          Span('请仔细阅读并勾选')
          Span('《用户隐私服务协议》')
            .fontColor('#FFD700')
        }
      }
      .margin({ top: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8F8F8')
  }
}