package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_130:String = "RWPUE_VOTE_RESULT";
      
      public static const const_125:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1261:int;
      
      private var var_1033:String;
      
      private var var_706:Array;
      
      private var var_994:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1033 = param2;
         var_994 = param3;
         var_706 = param4;
         if(var_706 == null)
         {
            var_706 = [];
         }
         var_1261 = param5;
      }
      
      public function get votes() : Array
      {
         return var_706.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1261;
      }
      
      public function get question() : String
      {
         return var_1033;
      }
      
      public function get choices() : Array
      {
         return var_994.slice();
      }
   }
}
