package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1804:int;
      
      private var var_1806:String;
      
      private var var_1457:IActionDefinition;
      
      private var var_1807:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1809:String;
      
      private var var_1810:String;
      
      private var var_1725:Boolean;
      
      private var var_1805:ColorTransform;
      
      private var var_1808:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1806 = param1;
         var_1809 = param2;
         var_1804 = param3;
         _color = param4;
         _frames = param5;
         var_1457 = param6;
         var_1725 = param7;
         var_1808 = param8;
         var_1810 = param9;
         var_1807 = param10;
         var_1805 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1725;
      }
      
      public function get partType() : String
      {
         return var_1809;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1808;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1807;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1804;
      }
      
      public function get flippedPartType() : String
      {
         return var_1810;
      }
      
      public function get bodyPartId() : String
      {
         return var_1806;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1457;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1805;
      }
   }
}
