// 用接口定义
export interface User{
  userId:number,
  userName:string,
  userPwd:string
}

export interface hospital{
  picture:string,
  text1:string,
  text2:string,
  text3:string,
}

export interface shop_list{
  name:string,
  price:string,
  url:string,
}
export interface pet_id{
  pet_id_from_db:string//这里存放的是宠物的id，到时候直接对id进行查找，提取相关信息
}


export interface iResponseModel<T>{
  code:number,
  message:string,
  data?:T,
  detailsErr?:string
}

export interface pet_responseType<T>{
  code:number,
  data?:T,
  message:string,
  count?:number,

}


export interface banned_list{
  //前一个页面
  wechat_name:string,
  tel:string,
  report_reason:string,

  //detail page:
  _id:string,
  detail_name:string,
  detail_sex:string,
  wechat_id:string,
  report_evidence:string,//举报证据的url:
}

export interface detail_information{
  _id:string,
  userName:string,
  title:string,
  avatar:string,
  time:string,
  picture:string,
  tag:string,
  text:string,
}

export interface animal{
  _id:string,//
  icon:string, //url 头像
  title:string, //宠物的名字
  age:string, //年龄
  sex:string,//男孩/女孩
  pet_location:string,//发布的位置
  pet_describe:string,//宠物的粗略描述
  pet_class:string,//流浪救助/家养宠物
  jieZhong:string,// 未接种/已接种/不详
  quChong:string,// 已驱虫/未驱虫/不详
  jueYu:string, // 已绝育/未绝育/不详
  story:string,//宠物的详细描述
  adopt_condition:string,// 领养条件
  adopt_way:string,// 领养方式
}

export interface BarItem{
  icon:Resource,
  sel_icon:Resource,
  text:string,
  id:number
}