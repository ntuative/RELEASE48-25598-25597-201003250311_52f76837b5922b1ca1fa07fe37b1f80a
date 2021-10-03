package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePartSet implements IFigurePartSet
   {
       
      
      private var _id:int;
      
      private var var_660:String;
      
      private var var_169:Array;
      
      private var var_1419:Array;
      
      private var var_1724:int;
      
      private var var_1725:Boolean;
      
      private var var_1723:Boolean;
      
      public function FigurePartSet(param1:XML)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         super();
         _id = parseInt(param1.@id);
         var_660 = String(param1.@gender);
         var_1724 = parseInt(param1.@club);
         var_1725 = Boolean(parseInt(param1.@colorable));
         var_1723 = Boolean(parseInt(param1.@selectable));
         var_169 = new Array();
         var_1419 = new Array();
         for each(_loc2_ in param1.part)
         {
            _loc4_ = new FigurePart(_loc2_);
            _loc5_ = indexOfPartType(_loc4_);
            if(_loc5_ != -1)
            {
               var_169.splice(_loc5_,0,_loc4_);
            }
            else
            {
               var_169.push(_loc4_);
            }
         }
         for each(_loc3_ in param1.hiddenlayers.layer)
         {
            var_1419.push(String(_loc3_.@parttype));
         }
      }
      
      public function get gender() : String
      {
         return var_660;
      }
      
      public function get hiddenLayers() : Array
      {
         return var_1419;
      }
      
      public function get parts() : Array
      {
         return var_169;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1723;
      }
      
      public function getPart(param1:String, param2:int) : IFigurePart
      {
         var _loc3_:* = null;
         for each(_loc3_ in var_169)
         {
            if(_loc3_.type == param1 && _loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1725;
      }
      
      public function get clubLevel() : int
      {
         return var_1724;
      }
      
      private function indexOfPartType(param1:FigurePart) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_169.length)
         {
            _loc3_ = var_169[_loc2_];
            if(_loc3_.type == param1.type && _loc3_.index < param1.index)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
   }
}
