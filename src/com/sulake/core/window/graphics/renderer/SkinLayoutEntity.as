package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_240:uint = 1;
      
      public static const const_420:uint = 0;
      
      public static const const_1000:uint = 8;
      
      public static const const_272:uint = 4;
      
      public static const const_401:uint = 2;
       
      
      private var var_442:uint;
      
      private var var_1771:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1772:uint;
      
      private var var_95:Rectangle;
      
      private var var_625:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_95 = param3;
         _color = param4;
         var_442 = param5;
         var_1771 = param6;
         var_1772 = param7;
         var_625 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1771;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_442;
      }
      
      public function get scaleV() : uint
      {
         return var_1772;
      }
      
      public function get tags() : Array
      {
         return var_625;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_95 = null;
         var_625 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_95;
      }
   }
}
