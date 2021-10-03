package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_721:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2200:BitmapData;
      
      private var var_2173:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_721,param3,param4);
         var_2173 = param1;
         var_2200 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_2200;
      }
      
      public function get badgeID() : String
      {
         return var_2173;
      }
   }
}
