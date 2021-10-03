package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_354:Boolean;
      
      private var var_191:String;
      
      private var var_1177:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_191 = param1;
         var_1177 = param2;
         var_354 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1177;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_354 = param1;
      }
      
      public function get text() : String
      {
         return var_191;
      }
      
      public function get visible() : Boolean
      {
         return var_354;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1177 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_191 = param1;
      }
   }
}
