package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_224:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_224 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_224;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_224 = new RoomSettingsFlatInfo();
         var_224.allowFurniMoving = param1.readInteger() == 1;
         var_224.doorMode = param1.readInteger();
         var_224.id = param1.readInteger();
         var_224.ownerName = param1.readString();
         var_224.type = param1.readString();
         var_224.name = param1.readString();
         var_224.description = param1.readString();
         var_224.showOwnerName = param1.readInteger() == 1;
         var_224.allowTrading = param1.readInteger() == 1;
         var_224.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
