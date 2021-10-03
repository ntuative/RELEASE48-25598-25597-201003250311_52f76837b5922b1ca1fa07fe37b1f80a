package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_64:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_969:int;
      
      private var _color:uint;
      
      private var var_970:int;
      
      private var var_1626:int;
      
      private var var_31:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_64,param6,param7);
         var_31 = param1;
         var_1626 = param2;
         var_969 = param3;
         _color = param4;
         var_970 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_970;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_969;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function get presetId() : int
      {
         return var_1626;
      }
   }
}
