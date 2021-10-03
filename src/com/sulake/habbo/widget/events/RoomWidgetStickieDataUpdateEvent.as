package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_526:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_191:String;
      
      private var var_675:String;
      
      private var var_1463:String;
      
      private var var_149:int = -1;
      
      private var var_47:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_149 = param2;
         var_1463 = param3;
         var_191 = param4;
         var_675 = param5;
         var_47 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1463;
      }
      
      public function get colorHex() : String
      {
         return var_675;
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
