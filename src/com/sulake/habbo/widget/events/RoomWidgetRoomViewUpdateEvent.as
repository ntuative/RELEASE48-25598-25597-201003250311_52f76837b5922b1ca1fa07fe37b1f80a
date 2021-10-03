package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_585:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_512:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_253:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1589:Point;
      
      private var var_1590:Rectangle;
      
      private var var_195:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1590 = param2;
         var_1589 = param3;
         var_195 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1590 != null)
         {
            return var_1590.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_195;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1589 != null)
         {
            return var_1589.clone();
         }
         return null;
      }
   }
}
