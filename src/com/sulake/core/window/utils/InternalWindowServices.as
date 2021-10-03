package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_116:DisplayObject;
      
      private var var_2312:uint;
      
      private var var_883:IWindowToolTipAgentService;
      
      private var var_885:IWindowMouseScalingService;
      
      private var _windowContext:IWindowContext;
      
      private var var_886:IWindowFocusManagerService;
      
      private var var_884:IWindowMouseListenerService;
      
      private var var_882:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2312 = 0;
         var_116 = param2;
         _windowContext = param1;
         var_882 = new WindowMouseDragger(param2);
         var_885 = new WindowMouseScaler(param2);
         var_884 = new WindowMouseListener(param2);
         var_886 = new FocusManager(param2);
         var_883 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_885;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_886;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_883;
      }
      
      public function dispose() : void
      {
         if(var_882 != null)
         {
            var_882.dispose();
            var_882 = null;
         }
         if(var_885 != null)
         {
            var_885.dispose();
            var_885 = null;
         }
         if(var_884 != null)
         {
            var_884.dispose();
            var_884 = null;
         }
         if(var_886 != null)
         {
            var_886.dispose();
            var_886 = null;
         }
         if(var_883 != null)
         {
            var_883.dispose();
            var_883 = null;
         }
         _windowContext = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_884;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_882;
      }
   }
}
