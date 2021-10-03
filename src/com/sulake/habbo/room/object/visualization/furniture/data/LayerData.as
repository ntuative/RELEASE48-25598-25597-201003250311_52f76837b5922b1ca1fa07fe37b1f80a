package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_366:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_470:int = 0;
      
      public static const const_979:int = 2;
      
      public static const const_993:int = 1;
      
      public static const const_544:Boolean = false;
      
      public static const const_666:String = "";
      
      public static const const_416:int = 0;
      
      public static const const_379:int = 0;
      
      public static const const_453:int = 0;
       
      
      private var var_1877:int = 0;
      
      private var var_1781:String = "";
      
      private var var_1584:int = 0;
      
      private var var_1878:int = 0;
      
      private var var_1879:Number = 0;
      
      private var var_1880:int = 255;
      
      private var var_1881:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1877;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1584 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1879;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1878 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1877 = param1;
      }
      
      public function get tag() : String
      {
         return var_1781;
      }
      
      public function get alpha() : int
      {
         return var_1880;
      }
      
      public function get ink() : int
      {
         return var_1584;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1879 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1878;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1881 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1881;
      }
      
      public function set tag(param1:String) : void
      {
         var_1781 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1880 = param1;
      }
   }
}
