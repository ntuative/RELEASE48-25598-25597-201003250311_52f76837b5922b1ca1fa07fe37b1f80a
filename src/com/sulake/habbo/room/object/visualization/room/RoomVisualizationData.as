package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_438:FloorRasterizer;
      
      private var var_828:Boolean = false;
      
      private var var_614:PlaneMaskManager;
      
      private var var_437:WallRasterizer;
      
      private var var_613:WallAdRasterizer;
      
      private var var_439:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_437 = new WallRasterizer();
         var_438 = new FloorRasterizer();
         var_613 = new WallAdRasterizer();
         var_439 = new LandscapeRasterizer();
         var_614 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_437;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_613;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_438;
      }
      
      public function get initialized() : Boolean
      {
         return var_828;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_614;
      }
      
      public function dispose() : void
      {
         if(var_437 != null)
         {
            var_437.dispose();
            var_437 = null;
         }
         if(var_438 != null)
         {
            var_438.dispose();
            var_438 = null;
         }
         if(var_613 != null)
         {
            var_613.dispose();
            var_613 = null;
         }
         if(var_439 != null)
         {
            var_439.dispose();
            var_439 = null;
         }
         if(var_614 != null)
         {
            var_614.dispose();
            var_614 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_437.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_438.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_613.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_439.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_614.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_437 != null)
         {
            var_437.clearCache();
         }
         if(var_438 != null)
         {
            var_438.clearCache();
         }
         if(var_439 != null)
         {
            var_439.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_439;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_828)
         {
            return;
         }
         var_437.initializeAssetCollection(param1);
         var_438.initializeAssetCollection(param1);
         var_613.initializeAssetCollection(param1);
         var_439.initializeAssetCollection(param1);
         var_614.initializeAssetCollection(param1);
         var_828 = true;
      }
   }
}
