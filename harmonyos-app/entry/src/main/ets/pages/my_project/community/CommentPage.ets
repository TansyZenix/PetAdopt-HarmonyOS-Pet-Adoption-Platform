import router from '@ohos.router'
import prompt from '@ohos.prompt'

// 定义评论接口
interface Comment {
  content: string
  timestamp: number
}

// 初始化AppStorage
PersistentStorage.PersistProp('commentList', [])
AppStorage.SetOrCreate('commentList', [])

@Entry
@Component
struct CommentPage {
  @State content: string = ''
  @StorageProp('commentList') commentList: Comment[] = []

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.ic_back')).height(30).width(30).padding({left:10,bottom:2})
          .onClick(()=>{
            router.back();
          })
        Text('留言')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 16 })
        Blank()
        Image($r('app.media.more'))
          .width(120)
          .height(24)
          .margin({ right: 32})
      }
      .width('100%')
      .height(56)
      .backgroundColor(Color.White)

      // 留言输入区域
      TextArea({ text: this.content, placeholder: '请输入留言内容' })
        .width('90%')
        .height(200)
        .margin({ top: 16 })
        .backgroundColor(Color.White)
        .borderRadius(8)
        .onChange((value: string) => {
          this.content = value
        })

      // 发布按钮
      Button('发布')
        .width('90%')
        .height(48)
        .backgroundColor('#FFD700')
        .margin({ top: 32 })
        .onClick(() => {
          if (this.content.trim() === '') {
            prompt.showToast({
              message: '请输入留言内容'
            })
            return
          }

          // 创建新的评论对象
          const newComment: Comment = {
            content: this.content,
            timestamp: Date.now()
          }

          // 将新评论添加到列表中
          let currentList = AppStorage.Get<Comment[]>('commentList') || []
          currentList = [newComment, ...currentList]
          AppStorage.Set<Comment[]>('commentList', currentList)

          // 清空输入框
          this.content = ''

          prompt.showToast({
            message: '发布成功'
          })

          router.back()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8F8F8')
  }
}