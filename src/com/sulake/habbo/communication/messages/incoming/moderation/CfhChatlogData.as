package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1957:int;
      
      private var var_1061:int;
      
      private var var_1956:int;
      
      private var var_1491:int;
      
      private var var_115:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1491 = param1.readInteger();
         var_1956 = param1.readInteger();
         var_1061 = param1.readInteger();
         var_1957 = param1.readInteger();
         var_115 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1491);
      }
      
      public function get chatRecordId() : int
      {
         return var_1957;
      }
      
      public function get reportedUserId() : int
      {
         return var_1061;
      }
      
      public function get callerUserId() : int
      {
         return var_1956;
      }
      
      public function get callId() : int
      {
         return var_1491;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_115;
      }
   }
}
