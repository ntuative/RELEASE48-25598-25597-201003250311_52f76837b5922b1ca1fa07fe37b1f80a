package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_130:String = "RSPE_VOTE_RESULT";
      
      public static const const_125:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1261:int = 0;
      
      private var var_1033:String = "";
      
      private var var_706:Array;
      
      private var var_994:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_994 = [];
         var_706 = [];
         super(param1,param2,param7,param8);
         var_1033 = param3;
         var_994 = param4;
         var_706 = param5;
         if(var_706 == null)
         {
            var_706 = [];
         }
         var_1261 = param6;
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
