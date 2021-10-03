package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1089:int = 0;
      
      private var var_1257:int = 0;
      
      private var var_2021:String = "";
      
      private var var_1088:int = 0;
      
      private var var_2024:String = "";
      
      private var var_2023:int = 0;
      
      private var var_1587:String = "";
      
      private var var_2019:int = 0;
      
      private var var_2018:int = 0;
      
      private var var_2022:String = "";
      
      private var var_2020:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2019 = param1;
         var_2022 = param2;
         var_1587 = param3;
         var_2021 = param4;
         var_2024 = param5;
         if(param6)
         {
            var_1257 = 1;
         }
         else
         {
            var_1257 = 0;
         }
         var_2023 = param7;
         var_2018 = param8;
         var_1088 = param9;
         var_2020 = param10;
         var_1089 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2019,var_2022,var_1587,var_2021,var_2024,var_1257,var_2023,var_2018,var_1088,var_2020,var_1089];
      }
      
      public function dispose() : void
      {
      }
   }
}
