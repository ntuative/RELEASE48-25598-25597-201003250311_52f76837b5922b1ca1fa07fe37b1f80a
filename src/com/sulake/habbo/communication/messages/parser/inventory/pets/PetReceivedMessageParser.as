package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_952:PetData;
      
      private var var_1411:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1411 = param1.readBoolean();
         var_952 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1411 + ", " + var_952.id + ", " + var_952.name + ", " + pet.figure + ", " + var_952.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1411;
      }
      
      public function get pet() : PetData
      {
         return var_952;
      }
   }
}
