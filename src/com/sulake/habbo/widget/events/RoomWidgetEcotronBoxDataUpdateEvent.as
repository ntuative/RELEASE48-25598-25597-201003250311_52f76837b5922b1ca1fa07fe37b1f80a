package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetEcotronBoxDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_80:String = "RWEBDUE_CONTENTS";
      
      public static const const_63:String = "RWEBDUE_PACKAGEINFO";
       
      
      private var var_191:String;
      
      private var var_1610:BitmapData;
      
      private var var_149:int = -1;
      
      private var var_47:Boolean;
      
      public function RoomWidgetEcotronBoxDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_149 = param2;
         var_191 = param3;
         var_47 = param4;
         var_1610 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1610;
      }
      
      public function get text() : String
      {
         return var_191;
      }
      
      public function get objectId() : int
      {
         return var_149;
      }
      
      public function get controller() : Boolean
      {
         return var_47;
      }
   }
}
