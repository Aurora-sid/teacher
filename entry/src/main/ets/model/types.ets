export interface ItemType {
  id?:number;
  title?:string | Resource;
  img?:string | Resource; // 可以没有
  price?:string | number;
  url?:string;// 可以没有
}