package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_434:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_310:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_813:int;
      
      private var var_266:Boolean;
      
      private var var_1795:Boolean;
      
      private var var_1547:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_813 = param2;
         var_1795 = param3;
         var_266 = param4;
         var_1547 = param5;
      }
      
      public function get position() : int
      {
         return var_813;
      }
      
      public function get isActive() : Boolean
      {
         return var_266;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1547;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1795;
      }
   }
}
