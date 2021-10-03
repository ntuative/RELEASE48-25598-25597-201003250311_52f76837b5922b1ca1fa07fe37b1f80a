package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_231:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1792:Boolean = false;
      
      private var var_1793:int = 0;
      
      private var var_1791:int = 0;
      
      private var var_1794:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_231,param5,param6);
         var_1794 = param1;
         var_1791 = param2;
         var_1793 = param3;
         var_1792 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1793;
      }
      
      public function get periodsLeft() : int
      {
         return var_1791;
      }
      
      public function get daysLeft() : int
      {
         return var_1794;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1792;
      }
   }
}
