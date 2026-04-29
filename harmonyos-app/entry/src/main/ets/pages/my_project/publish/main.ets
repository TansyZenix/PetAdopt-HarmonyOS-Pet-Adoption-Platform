import {promptAction,router} from '@kit.ArkUI'
import {post}from './../../../services/request'

@Entry
@Component
export  struct login {
  @State name: string = 'login'
  @State email: string = '';
  @State pwd: string = '';
  @State agreedProtocol: boolean = false;
  //登录的流程
  async login(){
    //判断用户名或密码是否为空
    if(this.email.length == 0 || this.pwd.length == 0){
      promptAction.showToast({
        message:'用户名或密码不能为空',
        duration:2000
      })
      return;
    }
    //发送请求
    let params =JSON.stringify({
      "userName":this.email,
      "userPwd":this.pwd,
      duration:2000
    })
    let result=await post('/loginAndRegister/login',params);
    let code:number=JSON.parse(result).code;
    console.log('',code);
    if(code==200){
      //登录成功
      promptAction.showToast({
        message:'登录成功',
        duration:2000
      })

      //跳转到主页
      router.pushUrl({url:"pages/my_project/front"})
      // router.replaceUrl({url:"pages/test02"})//不会记录
    }else{
      //登录失败
      promptAction.showToast({
        message:'登录失败',
        duration:2000
      })
    }


  }
  build() {
    Column() {

      //标题
      Text('登录').width('100%').fontFamily('Merriweather')
        .fontSize(25) //('#909090')
        .offset({left:118})

      //logo
      Image($r('app.media.img_3')).width('70%')
        .backgroundColor(Color.White)
        .padding(3)

      // 隐私协议
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
        Checkbox({ name: 'agreedProtocol' })
          .selectedColor('#FFCB45')
          .onChange((checked: boolean) => {
            this.agreedProtocol = checked
          })
        Text("请仔细阅读并勾选")
          .fontSize(14)
        Text("《用户隐私服务协议》")
          .fontSize(14)
          .fontColor('#FFCB45')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/my_project/publish/agreement' // 这里需要替换为实际的协议页面路由
            })
          })
      }.padding({ top: 16, bottom: 10 })
      //输入框
      TextInput({placeholder:'用户名'})
        .backgroundColor(Color.Transparent)
        .border({width:{bottom:1},
          color:{bottom:'#FFCF0B'},
          radius:0 })
        .margin({top:30,bottom:30})
        .fontFamily('Nuntio sans')
        .fontSize(14)
        .lineHeight(20)
        .letterSpacing(0)
        .placeholderColor('#909090')
        .onChange((v)=>{this.email = v})

      TextInput({placeholder:'密码'})
        .type(InputType.Password)
        .backgroundColor(Color.Transparent)
        .border({width:{bottom:1},
          color:{bottom:'#FFCF0B'},
          radius:0
        })
        .fontFamily('Nuntio sans')
        .fontSize(14)
        .lineHeight(20)
        .letterSpacing(0)
        .placeholderColor('#909090')
        .onChange((v)=>{this.pwd = v})
      //忘记密码
      Text('暂不登录')
        .margin({top:30,bottom:10}).fontSize(18)
        .fontFamily('NUntio sans')
        .align(Alignment.Top)
      //登录按钮
      Button('登录',{type:ButtonType.Normal})
        .width(285).height(50)
        .backgroundColor('#FFCF0B')
        .borderRadius(4).fontSize(20)
        .onClick(()=>{this.login()})
      // .enabled(this.email.length>0 && this.pwd.length>0?true:false)
      //sign up
      Text('注册').margin({top:10})
        .fontFamily('NUntio sans')
        .fontWeight(600)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/my_project/publish/PetRegister' // 这里需要替换为实际的协议页面路由
          })
        })
      Image($r('app.media.img_4')).width('130%')

        .backgroundColor(Color.White)
        .padding(3)


    }.height('100%')
    .width('100%')
    .padding({left:30,right:30})
  }
}
