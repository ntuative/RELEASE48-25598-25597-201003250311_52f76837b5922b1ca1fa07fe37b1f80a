package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_687:IAssetLoader;
      
      private var var_1296:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1296 = param1;
         var_687 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_687;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_687 != null)
            {
               if(true)
               {
                  var_687.dispose();
                  var_687 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1296;
      }
   }
}
