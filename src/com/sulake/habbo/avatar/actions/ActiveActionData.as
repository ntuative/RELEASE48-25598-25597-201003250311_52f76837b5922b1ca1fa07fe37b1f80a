package com.sulake.habbo.avatar.actions
{
   public class ActiveActionData implements IActiveActionData
   {
       
      
      private var var_1329:String = "";
      
      private var var_906:IActionDefinition;
      
      private var _actionParameter:String = "";
      
      public function ActiveActionData(param1:String, param2:String = "")
      {
         super();
         var_1329 = param1;
         _actionParameter = param2;
      }
      
      public function set actionParameter(param1:String) : void
      {
         _actionParameter = param1;
      }
      
      public function dispose() : void
      {
         var_1329 = null;
         _actionParameter = null;
         var_906 = null;
      }
      
      public function get actionType() : String
      {
         return var_1329;
      }
      
      public function get actionParameter() : String
      {
         return _actionParameter;
      }
      
      public function set definition(param1:IActionDefinition) : void
      {
         var_906 = param1;
      }
      
      public function get definition() : IActionDefinition
      {
         return var_906;
      }
      
      public function get id() : String
      {
         if(var_906 == null)
         {
            return "";
         }
         return "undefined_" + _actionParameter;
      }
   }
}
