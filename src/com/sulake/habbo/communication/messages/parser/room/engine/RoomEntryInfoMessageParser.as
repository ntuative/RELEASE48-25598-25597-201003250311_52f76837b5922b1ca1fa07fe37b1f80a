package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2142:int;
      
      private var var_418:Boolean;
      
      private var var_2143:Boolean;
      
      private var var_899:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2143 = param1.readBoolean();
         if(var_2143)
         {
            var_2142 = param1.readInteger();
            var_418 = param1.readBoolean();
         }
         else
         {
            var_899 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_899 != null)
         {
            var_899.dispose();
            var_899 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2142;
      }
      
      public function get owner() : Boolean
      {
         return var_418;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2143;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_899;
      }
   }
}
