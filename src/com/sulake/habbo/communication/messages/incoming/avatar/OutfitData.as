package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1649:String;
      
      private var var_660:String;
      
      private var var_1430:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1430 = param1.readInteger();
         var_1649 = param1.readString();
         var_660 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_660;
      }
      
      public function get figureString() : String
      {
         return var_1649;
      }
      
      public function get slotId() : int
      {
         return var_1430;
      }
   }
}
