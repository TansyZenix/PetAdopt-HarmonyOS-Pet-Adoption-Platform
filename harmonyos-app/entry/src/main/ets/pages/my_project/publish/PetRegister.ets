import {promptAction,router} from '@kit.ArkUI'
import {post}from './../../../services/request'

@Entry
@Component
export  struct PetRegister {
  @State userName: string = 'register'
  @State userPwd: string = '';
  @State userId:string = '';
  @State agreedProtocol: boolean = false;
  //登录的流程
  async register() {
    //判断用户名或密码是否为空
    if (this.userName.length == 0 || this.userPwd.length == 0 ) {
      // AlertDialog.show({
      //   title:'提示',
      //   message:'用户名或密码不能为空',
      //   })
      promptAction.showToast({
        message: '用户名或密码或手机号不能为空',
        duration: 2000
      })
      return;
    }
    //验证有效email格式@.com正则表达式
    // if(! /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9-]+[\.a-zA-Z]+$/.test(this.email)) {
    //   promptAction.showToast({
    //     message: '请输入有效的邮箱',
    //     duration: 2000
    //   })
    //   return;
    // }
    //发送请求
    let params = JSON.stringify({
      userId:this.userId,
      userName: this.userName,
      userPwd: this.userPwd,
      // duration: 2000
    })
    console.log(params);
    console.log(`/loginAndRegister/add/?userId=${this.userId}&userName=${this.userName}&userPwd=${this.userPwd}`);
    // let result = await post('http://localhost:8888/loginAndRegister/add/', params);
    let result = await post(`/loginAndRegister/add/?userId=${this.userId}&userName=${this.userName}&userPwd=${this.userPwd}`);
    let code: number = JSON.parse(result).code;
    console.log('',code);
    if (code == 200) {
      //登录成功
      promptAction.showToast({
        message: '注册成功',
        duration: 2000
      })

      //跳转到主页
      router.pushUrl({ url: "pages/my_project/publish/main" })
      // router.replaceUrl({url:"pages/test02"})//不会记录
    } else {
      //登录失败
      promptAction.showToast({
        message: '注册失败',
        duration: 2000
      })
    }
  }
  build() {
    Column() {
      // Logo
      Text('注册 ').width('100%').fontFamily('Merriweather')
        .fontSize(25).fontColor('#303030')
        .offset({left:119})
      Image($r('app.media.img_5')).width('130%')
        .backgroundColor(Color.White)
        .padding(3)
      // Input fields
      TextInput({placeholder:'用户名'})
        .backgroundColor(Color.Transparent)
        .border({width:{bottom:1},
          color:{bottom:'#E0E0E0'},
          radius:0
        })
        .margin({top:30,bottom:30})
        .fontFamily('Nuntio sans')
        .fontSize(14)
        .lineHeight(20)
        .letterSpacing(0)
        .placeholderColor('#909090')
        .onChange((v)=>{this.userName = v})

      // TextInput({placeholder:'手机号'})
      //   .backgroundColor(Color.Transparent)
      //   .border({width:{bottom:1},
      //     color:{bottom:'#E0E0E0'},
      //     radius:0
      //   })
      //   .margin({bottom:30})
      //   .fontFamily('Nuntio sans')
      //   .fontSize(14)
      //   .lineHeight(20)
      //   .letterSpacing(0)
      //   .placeholderColor('#909090')
      //   .onChange((v)=>{this.userId = v})

      TextInput({placeholder:'密码'})
        .type(InputType.Password)
        .backgroundColor(Color.Transparent)
        .border({width:{bottom:1},
          color:{bottom:'#E0E0E0'},
          radius:0
        })
        .margin({bottom:30})
        .fontFamily('Nuntio sans')
        .fontSize(14)
        .lineHeight(20)
        .letterSpacing(0)
        .placeholderColor('#909090')
        .onChange((v)=>{this.userPwd = v})

      TextInput({placeholder:'确认密码'})
        .type(InputType.Password)
        .backgroundColor(Color.Transparent)
        .border({width:{bottom:1},
          color:{bottom:'#E0E0E0'},
          radius:0
        })
        .fontFamily('Nuntio sans')
        .fontSize(14)
        .lineHeight(20)
        .letterSpacing(0)
        .placeholderColor('#909090')
        .onChange((v)=>{this.userId = v})

      // Register button
      Button('注册',{type:ButtonType.Normal})
        .margin({top:50,bottom:10}).fontSize(18)
        .width(285).height(50)
        .fontColor(Color.Black)
        .backgroundColor('#FFCF0B')
        .borderRadius(4).fontSize(20)
        .onClick(()=>{this.register()})
      // Sign in
      Row() {
        Text('已有账户?').fontFamily('NUntio sans')
          .fontWeight(400)
        Text(' 登录').fontFamily('NUntio sans')
          .fontWeight(600)
          .onClick(() => {
            router.back({
              url: 'pages/my_project/publish/main' // 这里需要替换为实际的协议页面路由
            })
          })
      }.margin({top:30})

    }.height('100%')
    .width('100%')
    .padding({left:30,right:30})
  }
}